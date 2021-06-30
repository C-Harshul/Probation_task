import 'package:flutter/cupertino.dart';

class MovieCard {
  String title;
  String genre;
  List director;
  List starring;
  int netVotes;
  int totalVotes;
  int pageViews;
  String language;
  int releaseDate;
  String posterUrl;

  MovieCard(
      {@required this.title,
      @required this.genre,
      @required this.director,
      @required this.starring,
      @required this.netVotes,
      @required this.totalVotes,
      @required this.pageViews,
      @required this.language,
      @required this.posterUrl,
      @required this.releaseDate});
}
