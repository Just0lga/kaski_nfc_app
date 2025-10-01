package com.example.kaski_nfc_app

import android.content.Context
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import androidx.appcompat.app.AppCompatActivity
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel
import com.bubuapps.baylancardcreditlibrary.BaylanCardCreditLibrary
import com.bubuapps.baylancardcreditlibrary.Model.DTO.Enums.ResultCode
import com.bubuapps.baylancardcreditlibrary.Model.DTO.Enums.enOperationType
import com.bubuapps.baylancardcreditlibrary.Interface.IBaylanCardCreditLibrary
import com.bubuapps.baylancardcreditlibrary.Model.DTO.ConsumerCardDTO
import com.bubuapps.baylancardcreditlibrary.Model.DTO.CreditRequestDTO
import com.bubuapps.baylancardcreditlibrary.Model.DTO.Enums.enResultCodes
import com.bubuapps.baylancardcreditlibrary.Model.DTO.LicenseRequest
import com.bubuapps.baylancardcreditlibrary.Model.DTO.ReadCardRequest
import kotlinx.coroutines.*
import java.util.UUID
import java.text.SimpleDateFormat
import java.util.Locale

class MainActivity : FlutterActivity(), IBaylanCardCreditLibrary {
    private val METHOD_CHANNEL = "com.example.kaski_nfc_app/methods"
    private val EVENT_CHANNEL = "com.example.kaski_nfc_app/events"
    
    private lateinit var methodChannel: MethodChannel
    private lateinit var eventChannel: EventChannel
    private var eventSink: EventChannel.EventSink? = null
    
    // Singleton instance
    companion object {
        private var libraryInstance: BaylanCardCreditLibrary? = null
        private var isLibraryInitialized = false
        private var lastLicenseCheckTime = 0L
        private const val LICENSE_CACHE_DURATION = 3600000L // 1 saat (milisaniye)
        private var isLicenseValid = false
        private var initializationJob: Job? = null
        
        // Thread-safe library instance
        @Synchronized
        fun getLibraryInstance(context: Context): BaylanCardCreditLibrary {
            if (libraryInstance == null) {
                println("🆕 Creating new BaylanCardCreditLibrary instance")
                libraryInstance = BaylanCardCreditLibrary(context)
            }
            return libraryInstance!!
        }
        
        // Lisans geçerliliğini kontrol et (cache'li)
        fun isLicenseCached(): Boolean {
            val now = System.currentTimeMillis()
            val isCacheValid = (now - lastLicenseCheckTime) < LICENSE_CACHE_DURATION
            println("📋 License cache check: valid=$isLicenseValid, cacheValid=$isCacheValid")
            return isCacheValid && isLicenseValid
        }
        
        // Lisans durumunu güncelle
        fun updateLicenseStatus(valid: Boolean) {
            isLicenseValid = valid
            lastLicenseCheckTime = System.currentTimeMillis()
            println("✅ License status updated: $valid at ${SimpleDateFormat("HH:mm:ss", Locale.getDefault()).format(lastLicenseCheckTime)}")
        }
    }

    private lateinit var baylanCardCreditLibrary: BaylanCardCreditLibrary

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        
        println("🏁 MainActivity: Configuring Flutter Engine")
        
        // Singleton instance kullan
        baylanCardCreditLibrary = getLibraryInstance(this)
        println("📚 Baylan Library instance retrieved")
        
        // Setup Method Channel
        methodChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, METHOD_CHANNEL)
        methodChannel.setMethodCallHandler { call, result ->
            handleMethodCall(call, result)
        }
        println("🔧 Method Channel configured")
        
        // Setup Event Channel
        eventChannel = EventChannel(flutterEngine.dartExecutor.binaryMessenger, EVENT_CHANNEL)
        eventChannel.setStreamHandler(object : EventChannel.StreamHandler {
            override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                eventSink = events
                println("👂 Event Channel listener started")
            }
            
            override fun onCancel(arguments: Any?) {
                eventSink = null
                println("❌ Event Channel listener cancelled")
            }
        })
        
        // İlk kez mi başlatılıyor kontrol et
        if (!isLibraryInitialized) {
            println("🚀 First initialization - Starting NFC and License check")
            initializeLibraryWithRetry()
        } else {
            println("♻️ Library already initialized - Checking cache")
            
            // Cache'den lisans kontrolü
            if (isLicenseCached()) {
                println("✅ Using cached license status")
                sendEvent(mapOf(
                    "type" to "licenseStatus",
                    "message" to "License is valid (cached)",
                    "cached" to true
                ))
            } else {
                println("🔄 Cache expired - Re-checking license")
                checkLicenceWithTimeout()
            }
        }
    }
    
    private fun initializeLibraryWithRetry() {
        // Önceki job varsa iptal et
        initializationJob?.cancel()
        
        initializationJob = CoroutineScope(Dispatchers.IO).launch {
            try {
                println("🔌 Starting NFC activation...")
                
                // NFC aktivasyonu (timeout ile)
                val nfcResult = withTimeoutOrNull(10000L) {
                    baylanCardCreditLibrary.ActivateNFCCardReader()
                }
                
                if (nfcResult != null) {
                    println("✅ NFC activated: ${nfcResult.name}")
                } else {
                    println("⚠️ NFC activation timeout - continuing anyway")
                }
                
                // Lisans kontrolü (retry ile)
                checkLicenceWithRetry(maxRetries = 3)
                
                isLibraryInitialized = true
                
            } catch (e: Exception) {
                println("❌ Initialization error: ${e.message}")
                e.printStackTrace()
                
                // Hata durumunda da initialized olarak işaretle
                isLibraryInitialized = true
                
                withContext(Dispatchers.Main) {
                    sendEvent(mapOf(
                        "type" to "error",
                        "message" to "Initialization failed: ${e.message}"
                    ))
                }
            }
        }
    }
    
    private suspend fun checkLicenceWithRetry(maxRetries: Int = 3) {
        var attempts = 0
        
        while (attempts < maxRetries) {
            try {
                println("🎫 License check attempt ${attempts + 1}/$maxRetries")
                
                val licenseCheckResult = withTimeoutOrNull(15000L) {
                    performLicenseCheck()
                }
                
                if (licenseCheckResult == true) {
                    println("✅ License check successful")
                    updateLicenseStatus(true)
                    return
                } else if (licenseCheckResult == null) {
                    println("⏱️ License check timeout")
                } else {
                    println("❌ License check failed")
                }
                
            } catch (e: Exception) {
                println("❌ License check exception: ${e.message}")
            }
            
            attempts++
            
            if (attempts < maxRetries) {
                val delayTime = 1000L * attempts // Exponential backoff
                println("⏳ Waiting ${delayTime}ms before retry...")
                delay(delayTime)
            }
        }
        
        println("❌ All license check attempts failed")
        updateLicenseStatus(false)
        
        withContext(Dispatchers.Main) {
            sendEvent(mapOf(
                "type" to "error",
                "message" to "License check failed after $maxRetries attempts"
            ))
        }
    }
    
    private suspend fun performLicenseCheck(): Boolean {
        return withContext(Dispatchers.IO) {
            try {
                val checkResult = baylanCardCreditLibrary.CheckLicence()
                
                if (checkResult.ResultCode == enResultCodes.LicenseisValid) {
                    println("✅ License is valid")
                    
                    withContext(Dispatchers.Main) {
                        sendEvent(mapOf(
                            "type" to "licenseStatus",
                            "message" to "License is valid"
                        ))
                    }
                    
                    return@withContext true
                } else {
                    println("⚠️ License not valid, requesting new license...")
                    
                    val licenseRequest = LicenseRequest()
                    licenseRequest.requestId = GetRequestId(0)
                    licenseRequest.licenceKey = "9283ebb4-9822-46fa-bbe3-ac4a4d25b8c2"
                    
                    val resultModel = baylanCardCreditLibrary.GetLicense(licenseRequest)
                    
                    withContext(Dispatchers.Main) {
                        sendEvent(mapOf(
                            "type" to "licenseStatus",
                            "message" to (resultModel.Message ?: "License obtained")
                        ))
                    }
                    
                    val isValid = resultModel.ResultCode == enResultCodes.LicenseisValid
                    return@withContext isValid
                }
            } catch (e: Exception) {
                println("❌ performLicenseCheck exception: ${e.message}")
                return@withContext false
            }
        }
    }
    
    private fun checkLicenceWithTimeout() {
        CoroutineScope(Dispatchers.IO).launch {
            try {
                withTimeoutOrNull(10000L) {
                    performLicenseCheck()
                }?.let { success ->
                    updateLicenseStatus(success)
                } ?: run {
                    println("⏱️ License re-check timeout")
                    // Timeout durumunda eski cache'i kullan
                }
            } catch (e: Exception) {
                println("❌ License re-check error: ${e.message}")
            }
        }
    }

    private fun handleMethodCall(call: io.flutter.plugin.common.MethodCall, result: MethodChannel.Result) {
        println("📞 Method call received: ${call.method}")
        
        when (call.method) {
            "activateNFC" -> {
                println("🔛 Activating NFC...")
                CoroutineScope(Dispatchers.IO).launch {
                    try {
                        val resultCode = withTimeoutOrNull(8000L) {
                            baylanCardCreditLibrary.ActivateNFCCardReader()
                        }
                        
                        withContext(Dispatchers.Main) {
                            if (resultCode != null) {
                                println("📱 NFC activation result: ${resultCode.name}")
                                result.success(mapOf("code" to resultCode.name))
                            } else {
                                println("⏱️ NFC activation timeout")
                                result.error("TIMEOUT", "NFC activation timeout", null)
                            }
                        }
                    } catch (e: Exception) {
                        withContext(Dispatchers.Main) {
                            result.error("ERROR", "NFC activation error: ${e.message}", null)
                        }
                    }
                }
            }
            
            "disableNFC" -> {
                println("🔴 Disabling NFC...")
                val resultCode = baylanCardCreditLibrary.DisapleNFCReader()
                println("📱 NFC disable result: ${resultCode.name}")
                result.success(mapOf("code" to resultCode.name))
            }
            
            "getLicense" -> {
                println("🎫 Getting license...")
                CoroutineScope(Dispatchers.IO).launch {
                    try {
                        val licenceKey = call.argument<String>("licenceKey") ?: ""
                        val requestId = call.argument<String>("requestId") ?: GetRequestId(0)
                        
                        println("🔑 License key: ${licenceKey.take(8)}...")
                        println("🆔 Request ID: $requestId")
                        
                        val licenseRequest = LicenseRequest()
                        licenseRequest.requestId = requestId
                        licenseRequest.licenceKey = licenceKey
                        
                        val licenseResult = withTimeoutOrNull(20000L) {
                            baylanCardCreditLibrary.GetLicense(licenseRequest)
                        }
                        
                        withContext(Dispatchers.Main) {
                            if (licenseResult != null) {
                                updateLicenseStatus(licenseResult.ResultCode == enResultCodes.LicenseisValid)
                                
                                result.success(mapOf(
                                    "resultCode" to licenseResult.ResultCode.name,
                                    "message" to (licenseResult.Message ?: "")
                                ))
                            } else {
                                result.error("TIMEOUT", "License request timeout", null)
                            }
                        }
                    } catch (e: Exception) {
                        withContext(Dispatchers.Main) {
                            result.error("ERROR", "License error: ${e.message}", null)
                        }
                    }
                }
            }
            
            "readCard" -> {
                println("📖 Starting card read operation...")
                val requestId = call.argument<String>("requestId") ?: GetRequestId(1)
                println("🆔 Read request ID: $requestId")
                
                val readCardRequest = ReadCardRequest()
                readCardRequest.requestId = requestId
                baylanCardCreditLibrary.ReadCard(readCardRequest)
                
                result.success(mapOf("status" to "reading_started"))
            }
            
            "writeCard" -> {
                try {
                    println("🚀 Write card method called")
                    
                    val credit = call.argument<Double>("credit") ?: 0.0
                    val reserveCreditLimit = call.argument<Double>("reserveCreditLimit") ?: 0.0
                    val criticalCreditLimit = call.argument<Double>("criticalCreditLimit") ?: 0.0
                    val operationTypeStr = call.argument<String>("operationType") ?: "None"
                    val requestId = call.argument<String>("requestId") ?: GetRequestId(2)
                    
                    println("📊 Write Parameters:")
                    println("  - Credit: $credit")
                    println("  - Reserve Credit: $reserveCreditLimit") 
                    println("  - Critical Credit: $criticalCreditLimit")
                    println("  - Operation Type: $operationTypeStr")
                    println("  - Request ID: $requestId")
                    
                    val creditRequestDTO = CreditRequestDTO()
                    creditRequestDTO.credit = credit
                    creditRequestDTO.reserveCreditLimit = reserveCreditLimit
                    creditRequestDTO.criticalCreditLimit = criticalCreditLimit
                    creditRequestDTO.requestId = requestId
                    
                    val enOperationTypeVal = when (operationTypeStr) {
                        "None" -> enOperationType.None
                        "AddCredit" -> enOperationType.AddCredit
                        "ClearCredits" -> enOperationType.ClearCredits
                        "SetCredit" -> enOperationType.SetCredit
                        else -> {
                            println("⚠️ Unknown operation type: $operationTypeStr, using None")
                            enOperationType.None
                        }
                    }
                    creditRequestDTO.operationType = enOperationTypeVal
                    
                    println("🎯 Starting CreditOperation with: ${creditRequestDTO.toString()}")
                    baylanCardCreditLibrary.CreditOperation(creditRequestDTO)
                    
                    result.success(mapOf(
                        "status" to "writing_started",
                        "requestId" to requestId,
                        "operationType" to operationTypeStr
                    ))
                    
                } catch (e: Exception) {
                    println("❌ Write card exception: ${e.message}")
                    e.printStackTrace()
                    result.error("WRITE_ERROR", "Write operation failed: ${e.message}", e.toString())
                }
            }
            
            "setUrl" -> {
                val url = call.argument<String>("url") ?: ""
                println("🌐 Setting URL: $url")
                baylanCardCreditLibrary.SetUrl(url)
                result.success(mapOf("status" to "url_set"))
            }
            
            "getUrl" -> {
                val url = baylanCardCreditLibrary.GetUrl()
                println("🌐 Current URL: $url")
                result.success(mapOf("url" to url))
            }
            
            else -> {
                println("❓ Unknown method: ${call.method}")
                result.notImplemented()
            }
        }
    }
    
    private fun GetRequestId(type: Int): String {
        return UUID.randomUUID().toString()
    }

    private fun checkLicence() {
        println("🎫 Checking license...")
        if (baylanCardCreditLibrary.CheckLicence().ResultCode == enResultCodes.LicenseisValid) {
            println("✅ License is already valid")
            sendEvent(mapOf(
                "type" to "licenseStatus",
                "message" to "License is valid"
            ))
        } else {
            println("⚠️ License not valid, requesting new license...")
            val licenseRequest = LicenseRequest()
            licenseRequest.requestId = GetRequestId(0)
            licenseRequest.licenceKey = "9283ebb4-9822-46fa-bbe3-ac4a4d25b8c2"
            
            val resultModel = baylanCardCreditLibrary.GetLicense(licenseRequest)
            
            Handler(Looper.getMainLooper()).post {
                sendEvent(mapOf(
                    "type" to "licenseStatus",
                    "message" to (resultModel.Message ?: "License check completed")
                ))
            }
        }
    }

    private fun sendEvent(eventData: Map<String, Any?>) {
        Handler(Looper.getMainLooper()).post {
            try {
                println("📤 Sending event: ${eventData["type"]}")
                
                val safeEventData = mutableMapOf<String, Any?>()
                eventData.forEach { (key, value) ->
                    when (value) {
                        is String, is Int, is Double, is Boolean, is Long, is Float -> {
                            safeEventData[key] = value
                        }
                        null -> {
                            safeEventData[key] = null
                        }
                        is Map<*, *> -> {
                            val safeMap = mutableMapOf<String, Any?>()
                            value.forEach { (k, v) ->
                                if (k is String) {
                                    when (v) {
                                        is String, is Int, is Double, is Boolean, is Long, is Float -> {
                                            safeMap[k] = v
                                        }
                                        null -> {
                                            safeMap[k] = null
                                        }
                                        else -> {
                                            safeMap[k] = v.toString()
                                        }
                                    }
                                }
                            }
                            safeEventData[key] = safeMap
                        }
                        else -> {
                            safeEventData[key] = value.toString()
                        }
                    }
                }
                
                eventSink?.success(safeEventData)
                
            } catch (e: Exception) {
                println("❌ Error sending event: $e")
                e.printStackTrace()
                val errorEventData = mapOf(
                    "type" to "error",
                    "message" to "Event sending error: ${e.message}"
                )
                try {
                    eventSink?.success(errorEventData)
                } catch (e2: Exception) {
                    println("❌ Failed to send error event: $e2")
                }
            }
        }
    }

    override fun OnResult(tag: String?, code: ResultCode) {
        println("🔄 OnResult called - Tag: $tag, Code: ${code.name}")
        sendEvent(mapOf(
            "type" to "onResult",
            "tag" to (tag ?: ""),
            "code" to code.name
        ))
    }

    override fun ReadCardResult(consumerCardDTO: ConsumerCardDTO?, code: ResultCode) {
        println("🔍 ReadCardResult called - Code: ${code.name}, DTO is null: ${consumerCardDTO == null}")
        
        if (consumerCardDTO != null && code == ResultCode.Success) {
            println("✅ Card read successful, converting DTO to map...")
            
            val safeCardData = convertConsumerCardDTOToSafeMap(consumerCardDTO)
            
            sendEvent(mapOf(
                "type" to "readCardResult",
                "code" to code.name,
                "cardData" to safeCardData
            ))
        } else {
            println("❌ Card read failed or no data - Code: ${code.name}")
            sendEvent(mapOf(
                "type" to "readCardResult",
                "code" to code.name,
                "cardData" to emptyMap<String, Any>()
            ))
        }
    }
    
    private fun convertConsumerCardDTOToSafeMap(dto: ConsumerCardDTO): Map<String, Any?> {
        val safeMap = mutableMapOf<String, Any?>()
        
        try {
            println("🔄 Converting ConsumerCardDTO to safe map...")
            
            val fields = dto::class.java.declaredFields
            println("📊 Found ${fields.size} fields in DTO")
            
            for (field in fields) {
                field.isAccessible = true
                val fieldName = field.name
                val value = field.get(dto)
                
                println("  - Field: $fieldName = $value (${value?.javaClass?.simpleName})")
                
                safeMap[fieldName] = when {
                    value == null -> null
                    value is String -> value
                    value is Int -> value
                    value is Double -> value
                    value is Float -> value.toDouble()
                    value is Long -> value
                    value is Boolean -> value
                    value.javaClass.isEnum -> value.toString()
                    value.javaClass.name.contains("Date") -> {
                        try {
                            val dateFormat = SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", Locale.getDefault())
                            when {
                                value.toString().isNotEmpty() -> value.toString()
                                else -> null
                            }
                        } catch (e: Exception) {
                            value.toString()
                        }
                    }
                    else -> {
                        try {
                            value.toString()
                        } catch (e: Exception) {
                            "Unknown"
                        }
                    }
                }
            }
            
            println("🔍 Safe card data created with ${safeMap.size} fields")
            
        } catch (e: Exception) {
            println("❌ Error converting DTO: $e")
            e.printStackTrace()
            
            safeMap["mainCredit"] = safeGetDoubleValue(dto, "mainCredit")
            safeMap["reserveCredit"] = safeGetDoubleValue(dto, "reserveCredit")
            safeMap["criticalCreditLimit"] = safeGetDoubleValue(dto, "criticalCreditLimit")
            safeMap["cardId"] = safeGetStringValue(dto, "cardId")
            safeMap["cardNumber"] = safeGetStringValue(dto, "cardNumber")
            safeMap["cardSeriNo"] = safeGetStringValue(dto, "cardSeriNo")
            safeMap["customerName"] = safeGetStringValue(dto, "customerName")
            safeMap["customerId"] = safeGetStringValue(dto, "customerId")
            safeMap["cardStatus"] = safeGetStringValue(dto, "cardStatus")
            safeMap["lastTransactionDate"] = safeGetStringValue(dto, "lastTransactionDate")
        }
        
        return safeMap
    }
    
    private fun safeGetDoubleValue(obj: Any, fieldName: String): Double? {
        return try {
            val field = obj.javaClass.getDeclaredField(fieldName)
            field.isAccessible = true
            val value = field.get(obj)
            when (value) {
                is Double -> value
                is Float -> value.toDouble()
                is Int -> value.toDouble()
                is Long -> value.toDouble()
                is String -> value.toDoubleOrNull()
                else -> null
            }
        } catch (e: Exception) {
            println("⚠️ Could not get double value for field $fieldName: $e")
            null
        }
    }
    
    private fun safeGetStringValue(obj: Any, fieldName: String): String? {
        return try {
            val field = obj.javaClass.getDeclaredField(fieldName)
            field.isAccessible = true
            val value = field.get(obj)
            when {
                value == null -> null
                value is String -> value
                value.javaClass.isEnum -> value.toString()
                else -> value.toString()
            }
        } catch (e: Exception) {
            println("⚠️ Could not get string value for field $fieldName: $e")
            null
        }
    }

    override fun WriteCardResult(code: ResultCode) {
        println("📝 WriteCardResult called with code: ${code.name}")
        
        sendEvent(mapOf(
            "type" to "writeCardResult",
            "code" to code.name,
            "timestamp" to System.currentTimeMillis()
        ))
        
        when (code) {
            ResultCode.Success -> {
                println("✅ Write operation completed successfully")
            }
            ResultCode.ReadCardAgain -> {
                println("⚠️ Card needs to be read again")
            }
            ResultCode.Failed -> {
                println("❌ Write operation failed")
            }
            else -> {
                println("ℹ️ Write result: ${code.name}")
            }
        }
    }
    
    override fun onDestroy() {
        super.onDestroy()
        initializationJob?.cancel()
        println("🔚 MainActivity destroyed, initialization job cancelled")
    }
    
    override fun onResume() {
        super.onResume()
        println("▶️ MainActivity resumed")
        
        // Uygulama ön plana geldiğinde lisans durumunu kontrol et
        if (!isLicenseCached()) {
            println("🔄 App resumed with expired cache - checking license")
            checkLicenceWithTimeout()
        }
    }
    
    override fun onPause() {
        super.onPause()
        println("⏸️ MainActivity paused")
    }
}