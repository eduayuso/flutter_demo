import 'package:flutter_rest_demo/config/constants.dart';
import 'package:flutter_rest_demo/data/model/User.dart';
import 'package:flutter_rest_demo/data/services/UsersService.dart';

import '../../main.dart';
import 'ViewModel.dart';

class ProfileModel extends ViewModel {

  final UsersService usersService = locator<UsersService>();
  User user;

  Future<User> fetchUser(int id) async {

    this.setStatus(ViewStatus.Busy);
    this.user = await this.usersService.fetch(id);
    this.setStatus(ViewStatus.Idle);
    return this.user;
  }

  Future<bool> save(User user) async {

    //TODO: save user profile
  }
}