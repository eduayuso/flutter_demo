import 'package:flutter_rest_demo/data/model/Auth.dart';
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

  Future<bool> login(String email, String password) async {

    Auth auth = await this.repository.login(email, password);

    // TODO: decode auth.token and get user/account id

    User user = await this.repository.fetch(2);

    if (user != null) {
      this.loggedUser.add(user);
      return true;

    } else {
      return false;
    }
  }
}