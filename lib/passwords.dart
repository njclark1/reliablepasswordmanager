import 'dart:async';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:myapp/passwords.dart';

//build List screen
class List extends StatelessWidget {
  const List({Key? key}) : super(key: key);

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
        //Homescreen Image
        body: Container(
          //body container properties
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/locks.jpeg'), fit: BoxFit.cover)),
        ));
  }
}
