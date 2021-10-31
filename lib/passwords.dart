import 'dart:async';
import 'dart:html';

import 'package:flutter/material.dart';

abstract class password {
  String serviceValue = "";
  String usernameValue = "";
  String passwordValue = "";
}

//build List screen
class Passwords extends StatefulWidget {
  const Passwords({Key? key}) : super(key: key);

  @override
  State<Passwords> createState() => _PasswordsState();
}

class _PasswordsState extends State<Passwords> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //header bar properties
      appBar: AppBar(
        title: Text(
          'Passwords',
          style: TextStyle(fontFamily: 'Mono'),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple[300],
      ),
      body: Container(
          child: Container(
              alignment: Alignment.center,
              child: ElevatedButton.icon(
                  //styling for button
                  style: ElevatedButton.styleFrom(
                      primary: Colors.deepPurple[300],
                      fixedSize: const Size(500, 150),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      )),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          createNewPassword(context),
                    );
                  },
                  //styling for button icon
                  icon: const Icon(
                    Icons.lock_open,
                    color: Colors.white,
                    size: 70,
                  ),
                  //button text
                  label: Text(
                    'Create New Password',
                    style: TextStyle(fontSize: 50),
                  )))),
    );
  }
}

Widget createNewPassword(BuildContext context) {
  return new AlertDialog(
    title: const Text('New Password'),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[Text("hi")],
    ),
  );
}
