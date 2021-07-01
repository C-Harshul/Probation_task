import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import './home.dart';

class Login extends StatefulWidget {
  static String routename = '/register';
  String name;
  String password;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final mailidController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          TextField(
              controller: mailidController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Enter your mailid',
              )),
          TextField(
              controller: passwordController,
              obscureText: true,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Enter your password',
              )),
          FlatButton(
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                Map user = {};
                setState(() {
                  user = {
                    "name": mailidController.text,
                    "password": passwordController.text
                  };
                });
                var storedObject = prefs.getString(mailidController.text);
                print(storedObject);
                if (storedObject != null) {
                  var temp = json.decode(storedObject);
                  print(temp);
                  if (temp['password'] == passwordController.text) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Incorrect password'),
                    ));
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('No such user'),
                    ));
                }
              },
              child: Text('Login'))
        ],
      ),
    ));
  }
}
