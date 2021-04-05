import 'package:chat_youtility_jpvp/screen/page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Youtility - Suporte Remoto',
      theme: ThemeData(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        primaryColor: Colors.green,
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

//Fonte: https://medium.com/@zeyadelosherey/the-complete-webview-in-flutter-d562b40c3260