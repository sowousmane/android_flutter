import 'package:flutter/material.dart';
import 'tpnoteous.dart';
import 'dart:async';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       scaffoldBackgroundColor: Colors.grey.shade300,
        primarySwatch: Colors.blue,
      ),
      home: Tpnoteous(),
    );
  }
}
