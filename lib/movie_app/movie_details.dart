import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class MovieDetail extends StatelessWidget {
  final movie;
  var image_url = 'https://image.tmdb.org/t/p/w500/';
  Color mainColor = const Color(0xffb51010);

  MovieDetail(this.movie);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          new Image.network(
            image_url + movie['poster_path'],
            fit: BoxFit.cover,
          ),
          new BackdropFilter(
            filter: new ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: new Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  new Container(
                    alignment: Alignment.center,
                    child: new Container(
                      width: 400.0,
                      height: 400.0,
                    ),
                    decoration: new BoxDecoration(
                        borderRadius: new BorderRadius.circular(10.0),
                        image: new DecorationImage(
                            image: new NetworkImage(
                                image_url + movie['poster_path']),
                            fit: BoxFit.cover),
                        boxShadow: [
                          new BoxShadow(
                              color: Colors.black,
                              blurRadius: 20.0,
                              offset: new Offset(0.0, 10.0))
                        ]),
                  ),
                  new Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 0.0),
                    child: new Row(
                      children: <Widget>[
                        new Expanded(
                            child: new Text(
                              movie['title'],
                              style: new TextStyle(
                                  color: Colors.white,
                                  fontSize: 30.0,
                                  fontFamily: 'Arvo'),
                            )),
                        new Text(
                          '${movie['vote_average']}/10',
                          style: new TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontFamily: 'Arvo'),
                        )
                      ],
                    ),
                  ),
                  Text(movie['overview'],
                      style: new TextStyle(
                          color: Colors.white, fontFamily: 'Arvo')),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(
                        color: Colors.blue,
                        textColor: Colors.white,
                        disabledColor: Colors.grey,
                        disabledTextColor: Colors.black,
                        padding: EdgeInsets.all(8.0),
                        splashColor: Colors.blueAccent,
                        onPressed: () {
                          /*...*/
                        },
                        child: Text(
                          "LOVE",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                      FlatButton(),

                      FlatButton(
                        color: Colors.blue,
                        textColor: Colors.white,
                        disabledColor: Colors.grey,
                        disabledTextColor: Colors.black,
                        padding: EdgeInsets.all(8.0),
                        splashColor: Colors.blueAccent,
                        onPressed: () {
                          /*...*/
                        },
                        child: Text(
                          " SHARE",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      )
                    ],

                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}