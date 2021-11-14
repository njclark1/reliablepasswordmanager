import 'dart:async';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:myapp/accountList.dart';

//build List screen
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  String correctUser = "nande";
  String correctPass = "09791929";
  String givenUser = "";
  String givenPass = "";
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
        //header bar properties
        appBar: AppBar(
          title: Text(
            'Login',
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
                  controller: usernameController,
                  onChanged: (String value) =>
                      givenUser = usernameController.text,
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: 'both of us',
                      labelText: 'Username'),
                ),
              ),
              //password field
              Container(
                alignment: Alignment.center,
                width: 500,
                child: TextFormField(
                  controller: passwordController,
                  onChanged: (String value) =>
                      givenPass = passwordController.text,
                  obscureText: true,
                  onFieldSubmitted: (String value) {
                    setState(() {
                      if (givenUser == correctUser &&
                          givenPass == correctPass) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => accountList()));
                      }
                    });
                  },
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: 'both of us',
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
                        setState(() {
                          if (givenUser == correctUser &&
                              givenPass == correctPass) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => accountList()));
                          }
                        });
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
