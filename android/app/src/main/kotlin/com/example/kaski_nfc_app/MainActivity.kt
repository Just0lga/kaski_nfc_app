package com.example.kaski_nfc_app

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
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.launch
import java.util.UUID
import java.text.SimpleDateFormat
import java.util.Locale

class MainActivity : FlutterActivity(), IBaylanCardCreditLibrary {
    private val METHOD_CHANNEL = "com.example.kaski_nfc_app/methods"
    private val EVENT_CHANNEL = "com.example.kaski_nfc_app/events"
    
    private lateinit var methodChannel: MethodChannel
    private lateinit var eventChannel: EventChannel
    private var eventSink: EventChannel.EventSink? = null
    
    private lateinit var baylanCardCreditLibrary: BaylanCardCreditLibrary

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        
        println("🏁 MainActivity: Configuring Flutter Engine")
        
        // Initialize Baylan Library
        baylanCardCreditLibrary = BaylanCardCreditLibrary(this)
        println("📚 Baylan Library initialized")
        
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
        
        // Initialize NFC and License
        GlobalScope.launch {
            println("🚀 Starting NFC activation and license check")
            baylanCardCreditLibrary.ActivateNFCCardReader()
            checkLicence()
        }
    }

    private fun handleMethodCall(call: io.flutter.plugin.common.MethodCall, result: MethodChannel.Result) {
        println("📞 Method call received: ${call.method}")
        
        when (call.method) {
            "activateNFC" -> {
                println("🔛 Activating NFC...")
                val resultCode = baylanCardCreditLibrary.ActivateNFCCardReader()
                println("📱 NFC activation result: ${resultCode.name}")
                result.success(mapOf("code" to resultCode.name))
            }
            
            "disableNFC" -> {
                println("🔴 Disabling NFC...")
                val resultCode = baylanCardCreditLibrary.DisapleNFCReader()
                println("📱 NFC disable result: ${resultCode.name}")
                result.success(mapOf("code" to resultCode.name))
            }
            
            "getLicense" -> {
                println("🎫 Getting license...")
                GlobalScope.launch {
                    val licenceKey = call.argument<String>("licenceKey") ?: ""
                    val requestId = call.argument<String>("requestId") ?: GetRequestId(0)
                    
                    println("🔑 License key: ${licenceKey.substring(0, 8)}...")
                    println("🆔 Request ID: $requestId")
                    
                    val licenseRequest = LicenseRequest()
                    licenseRequest.requestId = requestId
                    licenseRequest.licenceKey = licenceKey
                    
                    val licenseResult = baylanCardCreditLibrary.GetLicense(licenseRequest)
                    
                    Handler(Looper.getMainLooper()).post {
                        result.success(mapOf(
                            "resultCode" to licenseResult.ResultCode.name,
                            "message" to (licenseResult.Message ?: "")
                        ))
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
                
                // Sadece primitive type'lardan oluşan safe event data oluştur
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
                            // Map'i de safe hale getir
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
                // En basit hata mesajı gönder
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
            
            // Sadece primitive değerleri içeren safe bir map oluştur
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
            
            // Reflection ile field'ları oku
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
                        // Date object'ini ISO string'e çevir
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
                        // Diğer complex object'ler için toString() kullan
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
            
            // Fallback: Manuel field mapping
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
        
        // Ek debug bilgisi
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
}