import 'IResource.dart';
import 'dart:convert';

class Auth implements IResource {

  String token;

  Auth({this.token});

  factory Auth.fromJson(String stringJson) {

    Map<String, dynamic> jsonObj = json.decode(stringJson);

    return Auth(
      token: jsonObj['token'],
    );
  }
}