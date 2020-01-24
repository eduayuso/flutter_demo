import 'package:flutter/material.dart';
import 'package:flutter_rest_demo/ui/Router.dart';
import 'package:flutter_rest_demo/ui/models/HomeModel.dart';
import 'package:flutter_rest_demo/ui/models/LoginModel.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'data/model/User.dart';
import 'data/services/UsersService.dart';

GetIt locator = GetIt.I;

void setupLocator() {

  locator.registerLazySingleton(() => UsersService());

  locator.registerFactory(() => LoginModel());
  locator.registerFactory(() => HomeModel());
}

void main() {

  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return StreamProvider<User>(
      initialData:User.init(),
      create: (context) => locator<UsersService>().loggedUser.stream,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(),
        initialRoute: 'login',
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}