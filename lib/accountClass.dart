import 'dart:async';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:myapp/login.dart';
import 'package:myapp/accountList.dart';

class account {
  String service = "";
  String username = "";
  String password = "";

  account(String service, String username, String password) {
    this.service = service;
    this.username = username;
    this.password = password;
  }
}
