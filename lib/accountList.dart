import 'dart:async';
import 'dart:developer';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:myapp/main.dart';
import 'accountClass.dart';

// list of accounts
List<account> accounts = [account('test', 'test', 'test')];

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
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  color: Colors.red,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          deleteAccount(context, index),
                    );
                  },
                ),
              ),
            );
          }),
    );
  }
}

//display account details
Widget deleteAccount(BuildContext context, index) {
  return ButtonBarTheme(
      data: ButtonBarThemeData(alignment: MainAxisAlignment.center),
      child: AlertDialog(
        actionsAlignment: MainAxisAlignment.center,
        titlePadding: EdgeInsets.all(20),
        title: Text('Are you sure you would like to delete this account?'),
        actions: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.20,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple[300],
                  ),
                  child: new Text(
                    'Yes',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    accounts.removeAt(index);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => accountList()));
                    print(accounts);
                  },
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.01,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.20,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple[300],
                  ),
                  child: new Text(
                    'No',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => accountList()));
                    print(accounts);
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
            ],
          )
        ],
      ));
}

//display account details
Widget showAccountDetails(BuildContext context, index) {
  return new AlertDialog(
    title: const Text('Account Details:'),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text('\nService:\n' + accounts[index].service),
        Text('\nUsername:\n' + accounts[index].username),
        Text('\nPassword:\n' + accounts[index].password),
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
