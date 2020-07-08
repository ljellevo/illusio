import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:screen/screen.dart';

import 'home_page.dart';

void main() {
  Screen.keepOn(true);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.white, statusBarBrightness: Brightness.dark));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'illusio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(title: 'main'),
    );
  }
}
