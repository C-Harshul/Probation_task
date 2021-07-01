import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import './home.dart';

class Register extends StatefulWidget {
  static String routename = '/register';
  String name;
  String password;
  String profession;
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneNumberController = TextEditingController();
  String profession; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          TextField(
              controller: nameController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Enter your name',
              )),
          TextField(
              controller: emailController,
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
          TextField(
              controller: phoneNumberController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Enter your phone number',
              )),
          DropdownButton<String>(
            items: <String>['Scientist', 'Pilot', 'Artist', 'Lawyer'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: new Text(value),
              );
            }).toList(),
            onChanged: (val) {
              setState(() {
                              profession = val;
                            });
            },
          ),

          FlatButton(
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                Map user = {};
                setState(() {
                  user = {
                    "name": nameController.text,
                    "emailid" : emailController.text,
                    "password": passwordController.text,
                    "phoneNumber": phoneNumberController.text,
                    "proffesion" : profession
                  };
                });
                print(user);
                await prefs.setString(emailController.text, json.encode(user));
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Text('Save'))
        ],
      ),
    ));
  }
}
