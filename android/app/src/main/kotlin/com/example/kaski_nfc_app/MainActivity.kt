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

class MainActivity : FlutterActivity(), IBaylanCardCreditLibrary {
    private val METHOD_CHANNEL = "com.example.kaski_nfc_app/methods"
    private val EVENT_CHANNEL = "com.example.kaski_nfc_app/events"
    
    private lateinit var methodChannel: MethodChannel
    private lateinit var eventChannel: EventChannel
    private var eventSink: EventChannel.EventSink? = null
    
    private lateinit var baylanCardCreditLibrary: BaylanCardCreditLibrary

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        
        // Initialize Baylan Library
        baylanCardCreditLibrary = BaylanCardCreditLibrary(this)
        
        // Setup Method Channel
        methodChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, METHOD_CHANNEL)
        methodChannel.setMethodCallHandler { call, result ->
            handleMethodCall(call, result)
        }
        
        // Setup Event Channel
        eventChannel = EventChannel(flutterEngine.dartExecutor.binaryMessenger, EVENT_CHANNEL)
        eventChannel.setStreamHandler(object : EventChannel.StreamHandler {
            override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                eventSink = events
            }
            
            override fun onCancel(arguments: Any?) {
                eventSink = null
            }
        })
        
        // Initialize NFC and License
        GlobalScope.launch {
            baylanCardCreditLibrary.ActivateNFCCardReader()
            checkLicence()
        }
    }

    private fun handleMethodCall(call: io.flutter.plugin.common.MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "activateNFC" -> {
                val resultCode = baylanCardCreditLibrary.ActivateNFCCardReader()
                result.success(mapOf("code" to resultCode.name))
            }
            "disableNFC" -> {
                val resultCode = baylanCardCreditLibrary.DisapleNFCReader()
                result.success(mapOf("code" to resultCode.name))
            }
            "getLicense" -> {
                GlobalScope.launch {
                    val licenceKey = call.argument<String>("licenceKey") ?: ""
                    val requestId = call.argument<String>("requestId") ?: GetRequestId(0)
                    
                    val licenseRequest = LicenseRequest()
                    licenseRequest.requestId = requestId
                    licenseRequest.licenceKey = licenceKey
                    
                    val licenseResult = baylanCardCreditLibrary.GetLicense(licenseRequest)
                    
                    Handler(Looper.getMainLooper()).post {
                        result.success(mapOf(
                            "resultCode" to licenseResult.ResultCode.name,
                            "message" to licenseResult.Message
                        ))
                    }
                }
            }
            "readCard" -> {
                val requestId = call.argument<String>("requestId") ?: GetRequestId(1)
                val readCardRequest = ReadCardRequest()
                readCardRequest.requestId = requestId
                baylanCardCreditLibrary.ReadCard(readCardRequest)
                result.success(mapOf("status" to "reading_started"))
            }
            "writeCard" -> {
                try {
                    val credit = call.argument<Double>("credit") ?: 0.0
                    val reserveCreditLimit = call.argument<Double>("reserveCreditLimit") ?: 0.0
                    val criticalCreditLimit = call.argument<Double>("criticalCreditLimit") ?: 0.0
                    val operationTypeStr = call.argument<String>("operationType") ?: "None"
                    val requestId = call.argument<String>("requestId") ?: GetRequestId(2)
                    
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
                        else -> enOperationType.None
                    }
                    creditRequestDTO.operationType = enOperationTypeVal
                    
                    baylanCardCreditLibrary.CreditOperation(creditRequestDTO)
                    result.success(mapOf("status" to "writing_started"))
                } catch (e: Exception) {
                    result.error("WRITE_ERROR", "Only number values accepted!", e.message)
                }
            }
            "setUrl" -> {
                val url = call.argument<String>("url") ?: ""
                baylanCardCreditLibrary.SetUrl(url)
                result.success(mapOf("status" to "url_set"))
            }
            "getUrl" -> {
                val url = baylanCardCreditLibrary.GetUrl()
                result.success(mapOf("url" to url))
            }
            else -> {
                result.notImplemented()
            }
        }
    }
    
    private fun GetRequestId(type: Int): String {
        return UUID.randomUUID().toString()
    }

    private fun checkLicence() {
        if (baylanCardCreditLibrary.CheckLicence().ResultCode == enResultCodes.LicenseisValid) {
            sendEvent(mapOf(
                "type" to "licenseStatus",
                "message" to "License is valid"
            ))
        } else {
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

    private fun sendEvent(eventData: Map<String, Any>) {
        Handler(Looper.getMainLooper()).post {
            try {
                // Debug: Event data'yı kontrol et
                println("📤 Sending event: ${eventData["type"]}")
                eventData.forEach { (key, value) ->
                    println("🔑 $key: $value (${value?.javaClass?.simpleName})")
                }
                
                eventSink?.success(eventData)
            } catch (e: Exception) {
                println("❌ Error sending event: $e")
                // Hata durumunda sadece basit veri gönder
                val safeEventData = mapOf(
                    "type" to eventData["type"],
                    "code" to eventData["code"],
                    "message" to "Error occurred: ${e.message}"
                )
                try {
                    eventSink?.success(safeEventData)
                } catch (e2: Exception) {
                    println("❌ Failed to send safe event: $e2")
                }
            }
        }
    }

    override fun OnResult(tag: String?, code: ResultCode) {
        sendEvent(mapOf(
            "type" to "onResult",
            "tag" to (tag ?: ""),
            "code" to code.name
        ))
    }

    override fun ReadCardResult(consumerCardDTO: ConsumerCardDTO?, code: ResultCode) {
        println("🔍 ReadCardResult called - Code: $code, DTO is null: ${consumerCardDTO == null}")
        
        val cardDataMap = mutableMapOf<String, Any?>()
        
        if (consumerCardDTO != null && code == ResultCode.Success) {
            // Reflection ile tüm field'ları oku ama complex object'leri String'e çevir
            try {
                val fields = consumerCardDTO::class.java.declaredFields
                for (field in fields) {
                    field.isAccessible = true
                    val fieldName = field.name
                    val value = field.get(consumerCardDTO)
                    
                    // Complex object'leri String'e çevir
                    val processedValue = when {
                        value == null -> null
                        value is String -> value
                        value is Number -> value
                        value is Boolean -> value
                        value.javaClass.isEnum -> value.toString() // Enum'ları String'e çevir
                        value.javaClass.name.contains("CardStatus") -> value.toString() // CardStatus object'ini String'e çevir
                        value.javaClass.name.contains("Date") -> value.toString() // Date object'ini String'e çevir
                        else -> {
                            // Diğer complex object'ler için toString() kullan
                            try {
                                value.toString()
                            } catch (e: Exception) {
                                "Unknown"
                            }
                        }
                    }
                    
                    cardDataMap[fieldName] = processedValue
                }
                
                // Debug log - hangi field'lar geldi?
                println("🔍 Card data fields: ${cardDataMap.keys}")
                cardDataMap.forEach { (key, value) -> 
                    println("📊 $key: $value (${value?.javaClass?.simpleName})")
                }
                
            } catch (e: Exception) {
                println("❌ Reflection error: $e")
                // Fallback: Manuel field mapping
                cardDataMap["mainCredit"] = consumerCardDTO.mainCredit
                cardDataMap["reserveCredit"] = consumerCardDTO.reserveCredit  
                cardDataMap["criticalCreditLimit"] = consumerCardDTO.criticalCreditLimit
                // Diğer field'ları da manuel olarak ekleyelim
                try {
                    // Field'ları manuel olarak kontrol et
                    cardDataMap["cardId"] = safeFieldAccess(consumerCardDTO, "cardId")
                    cardDataMap["cardNumber"] = safeFieldAccess(consumerCardDTO, "cardNumber")
                    cardDataMap["customerName"] = safeFieldAccess(consumerCardDTO, "customerName")
                    cardDataMap["customerId"] = safeFieldAccess(consumerCardDTO, "customerId")
                    cardDataMap["cardStatus"] = safeFieldAccess(consumerCardDTO, "cardStatus")
                    cardDataMap["lastTransactionDate"] = safeFieldAccess(consumerCardDTO, "lastTransactionDate")
                } catch (e2: Exception) {
                    println("❌ Manual field access error: $e2")
                }
            }
        } else if (code != ResultCode.Success) {
            println("⚠️ Card read not successful. Code: $code")
        }
        
        sendEvent(mapOf(
            "type" to "readCardResult",
            "code" to code.name,
            "cardData" to cardDataMap
        ))
    }
    
    private fun safeFieldAccess(obj: Any, fieldName: String): String? {
        return try {
            val field = obj.javaClass.getDeclaredField(fieldName)
            field.isAccessible = true
            val value = field.get(obj)
            when {
                value == null -> null
                value is String -> value
                value is Number -> value.toString()
                value.javaClass.isEnum -> value.toString()
                else -> value.toString()
            }
        } catch (e: Exception) {
            println("⚠️ Could not access field $fieldName: $e")
            null
        }
    }

    override fun WriteCardResult(code: ResultCode) {
        sendEvent(mapOf(
            "type" to "writeCardResult",
            "code" to code.name
        ))
    }
}