import 'package:cicd_demo/utils/theme.dart';
import 'package:flutter/material.dart';
import 'screens/homepage.dart';


void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CI/CD DEMO',
      theme: themeData,
      home: const MyHomePage(title: 'CI / CD Demo Home Page'),
    );
  }
}
