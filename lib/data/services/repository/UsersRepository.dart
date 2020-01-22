import 'dart:async';
import 'dart:io';
import 'package:flutter_rest_demo/data/model/Account.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_rest_demo/data/model/User.dart';
import 'package:flutter_rest_demo/config/constants.dart' as Constants;
import 'dart:convert';
import 'ApiRepository.dart';

class UsersRepository extends ApiRepository<User>{

  @override
  String getApiResourceTag() {

    return Constants.REST_API_USERS;
  }

  @override
  User decodeJson(String stringJson) {

    return User.fromJson(stringJson);
  }

  @override
  List<User> decodeJsonList(String stringJsonList) {

    List jsonResponse = json.decode(stringJsonList);
    return jsonResponse.map((job) => new User.fromJson(job)).toList();
  }

  Future<Account> login(String email, String password) async {

    final String url = Constants.REST_API_ROOT + Constants.REST_API_LOGIN;
    final dynamic bodyRequest = {
      "email": email,
      "password": password
    };
    final response = await http.post(url, body: bodyRequest);

    if (response.statusCode == HttpStatus.ok) {
      return Account.fromJson(response.body);

    } else {
      return null;
    }
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