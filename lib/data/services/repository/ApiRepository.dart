import 'dart:io';

import 'package:flutter_rest_demo/data/model/IResource.dart';
import 'package:flutter_rest_demo/config/constants.dart' as Constants;
import 'package:http/http.dart' as http;

/*
 * This class represents a RESTful API resource.
 */
abstract class ApiRepository<T extends IResource> {

  String getApiResourceTag();
  T decodeJson(String stringJson);
  List<T> decodeJsonList(String stringJsonList);

  Future<T> fetch(int id) async {

    final String url = Constants.REST_API_ROOT + this.getApiResourceTag() + "/" + id.toString();
    final response = await http.get(url);

    if (response.statusCode == HttpStatus.ok) {
      return this.decodeJson(response.body);

    } else {
      throw Exception('Failed to fetch ' + this.getApiResourceTag() + " with id " + id.toString());
    }
  }

  Future<List<T>> fetchAll() async {

    final String url = Constants.REST_API_ROOT + this.getApiResourceTag();
    final response = await http.get(url);

    if (response.statusCode == HttpStatus.ok) {
      return this.decodeJsonList(response.body);

    } else {
      throw Exception('Failed to fetch list of ' + this.getApiResourceTag());
    }
  }

  Future<T> post(T item);

  Future<T> put(T item);
}