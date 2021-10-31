import 'dart:async';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:myapp/passwords.dart';

//build List screen
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  String correctUser = "password";
  String correctPass = "username";
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
        //header bar properties
        appBar: AppBar(
          title: Text(
            'World\'s Most Reliable Password Manager',
            style: TextStyle(fontFamily: 'Mono'),
          ),
          centerTitle: true,
          backgroundColor: Colors.deepPurple[300],
        ),

        //Login Screen
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
              //username field
              Container(
                alignment: Alignment.center,
                width: 500,
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: 'username is password',
                      labelText: 'Username'),
                ),
              ),
              //password field
              Container(
                alignment: Alignment.center,
                width: 500,
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: 'password is username',
                      labelText: 'Password'),
                ),
              ),
              //login submit button
              Container(
                  margin: EdgeInsets.all(50),
                  alignment: Alignment.center,
                  child: ElevatedButton.icon(
                      //styling for button
                      style: ElevatedButton.styleFrom(
                          primary: Colors.deepPurple[300],
                          fixedSize: const Size(300, 100),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          )),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Passwords()));
                      },
                      //styling for button icon
                      icon: const Icon(
                        Icons.lock_open,
                        color: Colors.white,
                        size: 30,
                      ),
                      //button text
                      label: Text(
                        'Login',
                        style: TextStyle(fontSize: 25),
                      )))
            ]));
  }
}
