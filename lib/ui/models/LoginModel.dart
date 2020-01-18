import 'package:flutter_rest_demo/config/constants.dart';
import 'package:flutter_rest_demo/data/services/UsersService.dart';

import '../../main.dart';
import 'ViewModel.dart';

class LoginModel extends ViewModel {

  final UsersService usersService = locator<UsersService>();

  String errorMessage;

  Future<bool> login(String email, String password) async {

    this.setStatus(ViewStatus.Busy);
    bool success = await this.usersService.login(email, password);
    this.setStatus(ViewStatus.Idle);
    return success;
  }
}