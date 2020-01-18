import 'dart:async';
import 'dart:convert';

import 'package:flutter_rest_demo/data/model/User.dart';
import 'package:flutter_rest_demo/config/constants.dart' as Constants;
import 'package:http/http.dart' as http;

import 'IRepository.dart';

class UsersRepository implements IRepository<User>{

  @override
  String getTag() {
    return Constants.REPOSITORY_USERS;
  }

  /*
   * Testeando la api
   */
  Future<User> login(String username, String password) async {

    final String url = "https://jsonplaceholder.typicode.com/users/?username=Bret";
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));

    } else {
      throw Exception('Failed to load user');
    }
  }

  @override
  Future<User> fetch(int id) {
    // TODO: implement fetch
    return null;
  }

  @override
  Future<List<User>> fetchAll() {
    // TODO: implement fetchAll
    return null;
  }

  @override
  Future<User> post(User user) {
    // TODO: implement post
    return null;
  }

  @override
  Future<User> put(User user) {
    // TODO: implement put
    return null;
  }
}