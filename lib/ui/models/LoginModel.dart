import 'package:flutter_rest_demo/config/constants.dart';
import 'package:flutter_rest_demo/data/model/User.dart';
import 'package:flutter_rest_demo/data/services/UsersService.dart';

import '../../main.dart';
import 'ViewModel.dart';

class LoginModel extends ViewModel {

  final UsersService usersService = locator<UsersService>();

  Future<User> login(String email, String password) async {

    this.setStatus(ViewStatus.Busy);
    email = "eve.holt@reqres.in";
    password = "cityslicka";
    User user = await this.usersService.login(email, password);
    this.setStatus(ViewStatus.Idle);
    return user;
  }
}