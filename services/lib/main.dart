import 'package:flutter/material.dart';
import 'package:services/app.dart';
import 'package:services/pages/home/home.dart';
import 'package:services/pages/login/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Services',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: AppScreen(),
    );
  }
}