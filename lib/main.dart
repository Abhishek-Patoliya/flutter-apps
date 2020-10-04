import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterappsss/Screen/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.redAccent,
        primaryColorDark: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
          );
  }
}
