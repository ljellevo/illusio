import 'package:flutter/material.dart';
import 'package:screen/screen.dart';

import 'HomePage.dart';


void main() {
  Screen.keepOn(true);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'parallax',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(title: 'main'),
    );
  }
}

