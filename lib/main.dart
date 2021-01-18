

import 'package:flutter/material.dart';

import 'movie_app/splashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: " NEW MOVIES ",
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );

  }
}