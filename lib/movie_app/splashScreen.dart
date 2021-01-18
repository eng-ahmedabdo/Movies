import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import 'movie_list.dart';



class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreenView(
          home: MovieList(),
          duration: 5000,
          imageSize: 50,
          imageSrc:
          "https://1.bp.blogspot.com/-ZNzEMAViS1Y/X0ScRt256AI/AAAAAAAAD2M/fJ-BQysrf-IXOjc-OmHx61czJREuy9XYwCLcBGAsYHQ/s1427/V%2BLogo%2B1080p.png",
          text: " NEW MOVIE",
          textType: TextType.ColorizeAnimationText,
          textStyle: TextStyle(
            fontSize: 60.0,
            fontStyle: FontStyle.italic,
          ),
          colors: [
            Colors.purple,
            Colors.blue,
            Colors.yellow,
            Colors.red,
          ],
          backgroundColor: Colors.black,
        ));
  }
}