import 'dart:convert';

import 'package:flutter_rest_demo/data/model/IResource.dart';
import "package:flutter_rest_demo/config/constants.dart" as Constants;

class Account implements IResource {

  String token; // encoded in JWT

  int id;
  String email;
  String role;
  int user;

  Account({this.token, this.id, this.email, this.role, this.user});

  factory Account.fromJson(String stringJson) {

    Map<String, dynamic> jsonObj = json.decode(stringJson);

    String token = jsonObj['token'];
    int id = 1; // token.decode().get("ACCOUNT_ID");
    String email = "test@test.com"; // token.decode().get("EMAIL");
    String role = Constants.ROLE_ADMINISTRATOR;; // token.decode().get("ROLE");
    int user = 1; // token.decode().get("USER_ID");

    return Account(
      token: token,
      id: id,
      email: email,
      role: role,
      user: user
    );
  }
}