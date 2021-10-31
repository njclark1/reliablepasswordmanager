import 'dart:async';
import 'dart:html';

import 'package:flutter/material.dart';

//build List screen
class Passwords extends StatelessWidget {
  const Passwords({Key? key}) : super(key: key);

  @override
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
            ]));
  }
}
