package com.example.flutter_connect_native

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.example.flutter_native_text"
    override fun configureFlutterEngine( flutterEngine: FlutterEngine){
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
         if(call.method == "getTextNative"){
             result.success("This is Kotlin Code")
         }
            else{
                result.notImplemented()
         }
        }
    }

}