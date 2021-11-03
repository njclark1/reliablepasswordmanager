import 'dart:async';
import 'dart:developer';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:myapp/main.dart';
import 'accountClass.dart';

// list of accounts
List<account> accounts = [];

//build List screen
class accountList extends StatefulWidget {
  const accountList({Key? key}) : super(key: key);

  @override
  State<accountList> createState() => _accountListState();
}

class _accountListState extends State<accountList> {
  @override

  //variables

  Widget build(BuildContext context) {
    return Scaffold(
      //header bar properties
      appBar: AppBar(
        title: Text(
          'Accounts',
          style: TextStyle(fontFamily: 'Mono'),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple[300],
        actions: <Widget>[
          IconButton(
              padding: EdgeInsets.only(right: 50),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => createNewPassword(context),
                );
              },
              icon: Icon(Icons.add))
        ],
      ),

      body: ListView.builder(
          itemCount: accounts.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        showAccountDetails(context, index),
                  );
                },
                title: Text(accounts[index].service),
              ),
            );
          }),
    );
  }
}

//display account details
Widget showAccountDetails(BuildContext context, index) {
  return new AlertDialog(
    title: const Text('Account Details:'),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(accounts[index].service),
        Text(accounts[index].username),
        Text(accounts[index].password),
        Padding(padding: const EdgeInsets.all(20)),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.deepPurple[300],
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => accountList()));
              print(accounts);
            },
            child: const Text("return to list")),
      ],
    ),
  );
}

//new password form
Widget createNewPassword(BuildContext context) {
  String newServiceValue = "";
  String newUsername = "";
  String newPassword = "";
  TextEditingController newServiceController = new TextEditingController();
  TextEditingController newUsernameController = new TextEditingController();
  TextEditingController newPasswordController = new TextEditingController();

  return new AlertDialog(
    title: const Text('New service'),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        TextFormField(
          controller: newServiceController,
          onChanged: (String value) =>
              newServiceValue = newServiceController.text,
          obscureText: false,
          decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              hintText: 'enter name of service',
              labelText: 'Service'),
        ),
        Padding(padding: const EdgeInsets.all(20)),
        TextFormField(
          controller: newUsernameController,
          onChanged: (String value) => newUsername = newUsernameController.text,
          obscureText: false,
          decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              hintText: 'enter username',
              labelText: 'Username'),
        ),
        Padding(padding: const EdgeInsets.all(20)),
        TextFormField(
          controller: newPasswordController,
          onChanged: (String value) => newPassword = newPasswordController.text,
          obscureText: true,
          decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              hintText: 'enter password',
              labelText: 'Password'),
        ),
        Padding(padding: const EdgeInsets.all(20)),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.deepPurple[300],
            ),
            onPressed: () {
              accounts.add(account(newServiceValue, newUsername, newPassword));
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => accountList()));
              print(accounts);
            },
            child: const Text("Submit")),
      ],
    ),
  );
}
