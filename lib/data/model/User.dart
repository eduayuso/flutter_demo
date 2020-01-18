import 'package:flutter_rest_demo/data/model/IResource.dart';
import 'dart:convert';

class User implements IResource {

  int id;
  String email;
  String password;
  String role;
  String firstName;
  String lastName;

  User({this.id, this.email, this.firstName, this.lastName});

  factory User.init() {
    return User(
      id: 0,
      email: "",
      firstName: "",
      lastName: "",
    );
  }

  factory User.fromJson(String stringJson) {

    Map<String, dynamic> jsonObj = json.decode(stringJson);

    return User(
      id: jsonObj['id'],
      email: jsonObj['email'],
      firstName: jsonObj['firstName'],
      lastName: jsonObj['lastName'],
    );
  }
}