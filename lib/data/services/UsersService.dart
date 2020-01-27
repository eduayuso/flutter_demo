import 'package:flutter_rest_demo/data/model/Account.dart';
import 'package:flutter_rest_demo/data/model/User.dart';
import 'package:flutter_rest_demo/data/services/repository/UsersRepository.dart';
import 'dart:async';

import 'DataService.dart';

class UsersService extends DataService<UsersRepository> {

  StreamController<User> loggedUser;
  StreamController<List<User>> users;

  UsersService() {
    this.repository = UsersRepository();
    this.loggedUser = StreamController<User>();
    this.users = StreamController<List<User>>();
  }

  Future<User> login(String email, String password) async {

    Account account = await this.repository.login(email, password);
    if (account == null) return null;

    int userId = account.user;
    User user = await this.repository.fetch(userId); // fetch user with id == account.user
    this.loggedUser.add(user);
    return user;
  }

  Future<List<User>> fetchAll() async {

    List<User> users = await this.repository.fetchAll();
    return users;
  }

  Future<User> fetch(int id) async {

    User user = await this.repository.fetch(id);
    return user;
  }
}