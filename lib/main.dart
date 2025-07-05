import 'package:flutter/material.dart';

import 'animated_splash.dart';

// import 'home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        backgroundColor: Color(0xFFEC5001),
          body: AnimatedSplash()),
    );
  }
}
