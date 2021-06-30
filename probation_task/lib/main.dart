import 'package:flutter/material.dart';
import './routes.dart';
import './pages/home.dart';
import './pages/hub.dart';
import './pages/movies.dart';

void main() => runApp(ProbTask());

class ProbTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Hub(), routes: routes);
  }
}