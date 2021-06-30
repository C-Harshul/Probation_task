import 'package:flutter/material.dart';
import './pages/movies.dart';
import './pages/home.dart';
import './pages/register.dart';

Map<String, Widget Function(BuildContext)> routes = {
  MovieDetails.routename: (ctx) => MovieDetails(),
  HomePage.routename: (ctx) => HomePage(),
  Register.routename:(ctx) => Register()
};