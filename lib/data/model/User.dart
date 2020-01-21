import 'package:flutter_rest_demo/data/model/IResource.dart';
import 'dart:convert';

class User implements IResource {

  int id;
  String firstName;
  String lastName;

  User({this.id, this.firstName, this.lastName});

  factory User.init() {
    return User(
      id: 0,
      firstName: "",
      lastName: "",
    );
  }

  factory User.fromJson(String stringJson) {

    Map<String, dynamic> jsonObj = json.decode(stringJson);

    return User(
      id: jsonObj['id'],
      firstName: jsonObj['firstName'],
      lastName: jsonObj['lastName'],
    );
  }
}