import 'dart:async';
import 'dart:html';

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Home()));

//build home screen
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
                  image: AssetImage('images/vault.jpeg'), fit: BoxFit.cover)),
          //button properties
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => List()));
                  },
                  //styling for button icon
                  icon: const Icon(
                    Icons.lock_open,
                    color: Colors.white,
                    size: 70,
                  ),
                  //button text
                  label: Text(
                    'Let\'s Get Started!',
                    style: TextStyle(fontSize: 50),
                  ))),
        ));
  }
}

//build List screen
class List extends StatelessWidget {
  const List({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //header bar properties
        appBar: AppBar(
          title: Text(
            'World\'s Greatest Password Manager',
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
                  image: AssetImage('images/lock.jpeg'), fit: BoxFit.cover)),
        ));
  }
}
