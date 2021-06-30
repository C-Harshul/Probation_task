import 'package:flutter/material.dart';
import 'package:probation_task/pages/home.dart';
import 'package:probation_task/pages/register.dart';
import './login.dart';
import '../routes.dart';

class Hub extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Register()),
                  );
                },
                child: Text('Sign Up'),
              ),
            ),
            Center(
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
                child: Text('Sign in'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
