import 'package:flutter_rest_demo/data/model/IResource.dart';
import 'dart:convert';

class User implements IResource {

  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  User({this.id, this.email, this.firstName, this.lastName, this.avatar});

  factory User.init() {
    return User(
      id: 0,
      email: "",
      firstName: "",
      lastName: "",
      avatar: ""
    );
  }

  factory User.fromJson(var data) {

    return User(
      id: data['id'],
      email: data['email'],
      firstName: data['first_name'],
      lastName: data['last_name'],
      avatar: data['avatar'],
    );
  }
}