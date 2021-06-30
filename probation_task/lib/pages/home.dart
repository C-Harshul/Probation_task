import 'package:flutter/material.dart';
import './company.dart';
import './movies.dart';

class HomePage extends StatefulWidget {
   static String routename = '/home_page';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedPage = 0;

  final _pageOptions = [
    MovieDetails(),
    Company(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: _pageOptions[selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.tv, size: 30), title: Text('Movies')),
            BottomNavigationBarItem(
                icon: Icon(Icons.business_center, size: 30),
                title: Text('Company Info')),
          ],
          selectedItemColor: Colors.blueAccent,
          elevation: 5.0,
          unselectedItemColor: Colors.black,
          currentIndex: selectedPage,
          backgroundColor: Colors.white,
          onTap: (index) {
            setState(() {
              selectedPage = index;
            });
          },
        ));
  }
}
