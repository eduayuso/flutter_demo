import 'package:flutter_rest_demo/data/access/cache/ICache.dart';
import 'package:flutter_rest_demo/data/model/User.dart';

class UsersCache implements ICache<User> {

  Map<int, User> data;

  @override
  User get(int id) {

    return this.data[id];
  }

  @override
  List<User> getAll() {

    return data.values;
  }


}