import 'package:flutter/material.dart';

class Company extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
              child: Column(
                children: [
                  Text('Company : Housy',style: TextStyle(fontWeight: FontWeight.bold),),
                  Text('Address : Pune India',style: TextStyle(fontWeight: FontWeight.bold),),
                  Text('Phone : xxxxxxxx09',style: TextStyle(fontWeight: FontWeight.bold),),
                  Text('Email : xxxx@housy.com',style: TextStyle(fontWeight: FontWeight.bold),)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
