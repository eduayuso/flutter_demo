import 'package:flutter_rest_demo/config/constants.dart';
import 'package:flutter_rest_demo/data/model/User.dart';
import 'package:flutter_rest_demo/data/services/UsersService.dart';

import '../../main.dart';
import 'ViewModel.dart';

class HomeModel extends ViewModel {

  final UsersService usersService = locator<UsersService>();
  List<User> users = List<User>();

  Future<List<User>> fetchUsers() async {

    this.setStatus(ViewStatus.Busy);
    this.users = await this.usersService.fetchAll();
    this.setStatus(ViewStatus.Idle);
    return users;
  }
}