import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'dart:io';

// Generate a flutter app UI loading a rust library named "libhello_hack_congo.so". It should call its function "helloWorld" and just display it in center of the flutter window
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Rust FFI in Flutter'),
        ),
        body: Center(
          child: FutureBuilder<String>(
            future: helloWorld(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!);
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}

// Load the rust library and call its function "helloWorld"
Future<String> helloWorld() async {
  final DynamicLibrary helloLib = Platform.isAndroid
      ? DynamicLibrary.open("libhello_hack_congo.so")
      : DynamicLibrary.process();

  final Pointer<Utf8> Function() helloWorld =
      helloLib.lookup<NativeFunction<Pointer<Utf8> Function()>>("hello_world").asFunction();

  return helloWorld().toDartString();
}