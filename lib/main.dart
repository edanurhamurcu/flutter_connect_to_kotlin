// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Page(),
    );
  }
}

class Page extends StatefulWidget {
  Page({super.key});

  @override
  State<Page> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Page> {
  static const platform = MethodChannel('com.example.flutter_native_text');
  String text = 'No Data';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Flutter Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _getToNative,
              child: const Text("Click me to get data from native code"),
            ),
            const SizedBox(height: 20),
            const Text(
              'Data from Native code:',
            ),
            const SizedBox(height: 20),
            if (text != 'No Data')
              Container(
                padding: const EdgeInsets.all(10.0),
                width: 200.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.deepPurple[100],
                ),
                child: Center(
                  child: Text(
                    text,
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _getToNative() async {
    String txt;
    try {
      final result = await platform.invokeMethod('getTextNative');
      txt = result;
    } catch (e) {
      txt = 'Failed to Native code catch -->$e';
    }

    setState(() {
      text = txt;
    });
  }
}
