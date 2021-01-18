import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'movie_details.dart';



class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  var movies;
  Color mainColor = const Color(0xffb51010);

  Future getData() async {
    var data = await getJson();
    setState(() {
      movies = data['results'];
    });
    return movies;
  }


  @override
  Widget build(BuildContext context) {



    return Scaffold(

      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.3,
        centerTitle: true,
        leading: new Icon(
          Icons.arrow_back_ios,
          color: mainColor,
        ),
        title: Text(
          'Movies',
          style: TextStyle(
              color: mainColor,
              fontFamily: 'Arvo',
              fontWeight: FontWeight.bold),
        ),
        actions: [
          Icon(
            Icons.menu,
            color: mainColor,
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            MovieTitle(mainColor),
            new Expanded(

                child: FutureBuilder(
                  future:getData(),
                  builder: (context,snapshot){
                    if(snapshot.hasData){
                      return ListView.builder(

                          itemCount: movies == Null ? 0 : movies.length,
                          itemBuilder: (context, i) {
                            return FlatButton(
                              child: MovieCell(movies, i),
                              padding: const EdgeInsets.all(0.0),
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                      return MovieDetail(movies[i]);
                                    }));
                              },
                            );
                          });
                    }

                    return Center(child: CircularProgressIndicator(backgroundColor: Colors.red,));
                  },


                ))
          ],
        ),
      ),
    );
  }
}




Future<Map> getJson() async {
  var apiKey = "f476c933beeb792de073665402a501ad";
  var url = 'http://api.themoviedb.org/3/discover/movie?api_key=${apiKey}';
  var response = await http.get(url);
  return json.decode(response.body);
}

class MovieTitle extends StatelessWidget {
  final Color mainColor;

  MovieTitle(this.mainColor);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      child: Text(
        'Top Rated',
        style: new TextStyle(
            fontSize: 40.0,
            color: mainColor,
            fontWeight: FontWeight.bold,
            fontFamily: 'Arvo'),
        textAlign: TextAlign.left,
      ),
    );
  }
}

class MovieCell extends StatelessWidget {
  final movies;
  final i;
  Color mainColor = const Color(0xffb51010);
  var image_url = 'https://image.tmdb.org/t/p/w500/';

  MovieCell(this.movies, this.i);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                margin: const EdgeInsets.all(16.0),
//                                child: new Image.network(image_url+movies[i]['poster_path'],width: 100.0,height: 100.0),
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey,
                    image: DecorationImage(
                      image: NetworkImage(image_url + movies[i]['poster_path']),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      new BoxShadow(
                          color: mainColor,
                          blurRadius: 5.0,
                          offset: new Offset(2.0, 5.0))
                    ],
                  ),
                ),
              ),
            ),
            new Expanded(
                child: new Container(
                  margin: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                  child: new Column(
                    children: [
                      new Text(
                        movies[i]['title'],
                        style: new TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Arvo',
                            fontWeight: FontWeight.bold,
                            color: mainColor),
                      ),
                      new Padding(padding: const EdgeInsets.all(2.0)),
                      new Text(
                        movies[i]['overview'],
                        maxLines: 3,
                        style: new TextStyle(
                            color: const Color(0xfffcf0f1), fontFamily: 'Arvo'),
                      )
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                )),
          ],
        ),
        new Container(
          width: 300.0,
          height: 0.5,
//    color: const Color(0xffb51010),
          margin: const EdgeInsets.all(16.0),
        )
      ],
    );
  }
}