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
    var data = jsonObj["data"];

    return User(
      id: data['id'],
      firstName: data['first_name'],
      lastName: data['last_name'],
    );
  }
}