package com.thumbmarkandroidplugin.thumbmark_android_flutter

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

//thumbmarkjs import
import com.thumbmarkjs.thumbmark_android.Thumbmark

/** ThumbmarkAndroidFlutterPlugin */
class ThumbmarkAndroidFlutterPlugin :
    FlutterPlugin,
    MethodCallHandler {
   
    private lateinit var channel: MethodChannel

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "thumbmark_android_flutter")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(
        call: MethodCall,
        result: Result
    ) {
        when(call.method){
            "getPlatformVersion"-> result.success("Android ${android.os.Build.VERSION.RELEASE}")

            "generateFingerPrintLow" -> {
                Thumbmark.setVolatility(ComponentVolatility.LOW)
                val id: String = Thumbmark.id(context = this)
                result.success(id)
            }

            "generateFingerPrintHigh" -> {
                Thumbmark.setVolatility(ComponentVolatility.HIGH)
                val id: String = Thumbmark.id(context = this)
                result.success(id)
            }

            else -> result.notImplemented()
        }
       
            
        
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
