import 'dart:async';
import 'dart:html';

import 'package:flutter/material.dart';

//build List screen
class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //header bar properties
        appBar: AppBar(
          title: Text(
            'World\'s Most Reliable Password Manager - LOGIN',
            style: TextStyle(fontFamily: 'Mono'),
          ),
          centerTitle: true,
          backgroundColor: Colors.deepPurple[300],
        ),

        //Login Screen
        body: Column(children: <Widget>[
          Row(),
          Container(
            alignment: Alignment.center,
            child: Text(
                "Please enter your username and password(username:username, password:password)"),
          ),
          //username field
          Container(
            alignment: Alignment.center,
            width: 500,
            child: TextFormField(
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(), labelText: 'Username'),
            ),
          ),
          //password field
          Container(
            alignment: Alignment.center,
            width: 500,
            child: TextFormField(
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(), labelText: 'Password'),
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
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
