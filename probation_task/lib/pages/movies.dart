import 'package:flutter/material.dart';
import '../models/movie_card.dart';
import '../widgets/movie_card.dart';
import 'package:http/http.dart';
import 'dart:convert';

final String apiURL = "https://hoblist.com/movieList";

List<MovieCard> Movies = [];

class MovieDetails extends StatefulWidget {
  static String routename = '/movie_details';
  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  void initState() {
    super.initState();
    final DateTime now = DateTime.now();
    print(now);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getMovies();
    });
  }

  _getMovies() async {
    Response movies = await post(
      apiURL,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "category": "movies",
        "language": "hindi",
        "genre": "all",
        "sort": "voting"
      }),
    );
    var Movielist = jsonDecode(movies.body)['result'];
    //print(Movielist);
    List<MovieCard> tempmovies = [];
    for (int i = 0; i < Movielist.length; ++i) {
     int netVotes;
     int x = Movielist[i]['upVoted']!=null ?Movielist[i]['upVoted'].length:0;
     int y = Movielist[i]['downVoted']!=null ?Movielist[i]['downVoted'].length:0;
     netVotes = x-y;
     print(netVotes); 
      var t = MovieCard(
          title: Movielist[i]['title'],
          genre: Movielist[i]['genre'],
          director: Movielist[i]['director'],
          totalVotes: Movielist[i]['totalVoted'],
          pageViews: Movielist[i]['pageViews'],
          starring: Movielist[i]['stars'],
          netVotes: netVotes,
          language: Movielist[i]['language'],
          releaseDate: Movielist[i]['releasedDate'],
          posterUrl: Movielist[i]['poster'] != null ?Movielist[i]['poster'] : '');
      tempmovies.add(t);
    }
    setState(() {
      Movies = tempmovies;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: SafeArea(
      child: Container(
        
        child: ListView.builder(
            itemCount: Movies.length,
            itemBuilder: (ctx, index) {
              return MovieCardWidget(card: Movies[index]);
            }),
      ),
    )));
  }
}
