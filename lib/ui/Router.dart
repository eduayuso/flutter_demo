import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rest_demo/ui/views/HomeView.dart';
import 'package:flutter_rest_demo/ui/views/LoginView.dart';
import "package:flutter_rest_demo/config/constants.dart" as Constants;
import 'views/UserProfileView.dart';

const String initialRoute = "login";

class Router {

  static Route<dynamic> generateRoute(RouteSettings settings) {

    switch (settings.name) {

      case Constants.PAGE_LOGIN:
        return MaterialPageRoute(builder: (_) => LoginView());

      case Constants.PAGE_HOME:
        return MaterialPageRoute(builder: (_) => HomeView());

      case Constants.PAGE_USER_PROFILE:
        return MaterialPageRoute(builder: (_) => UserProfileView());

    /*  case 'post':
        var post = settings.arguments as Post;
        return MaterialPageRoute(builder: (_) => PostView(post: post));*/
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            ));
    }
  }
}