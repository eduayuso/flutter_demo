import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rest_demo/config/constants.dart';
import 'package:flutter_rest_demo/ui/models/LoginModel.dart';
import 'package:flutter_rest_demo/ui/widgets/LoginHeader.dart';
import 'package:flutter_rest_demo/config/styles.dart' as Styles;

import 'View.dart';

class LoginView extends StatefulWidget {

  @override
  LoginViewState createState() => LoginViewState();
}

class LoginViewState extends State<LoginView> {

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return View<LoginModel>(
      builder: (context, model, child) => Scaffold(
        backgroundColor: Styles.backgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LoginHeader(
                validationMessage: model.errorMessage,
                controller: _controller
            ),
            model.status == ViewStatus.Busy
                ? CircularProgressIndicator()
                : FlatButton(
              color: Colors.white,
              child: Text(
                'Login',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () async {
                bool loginSuccess = await model.login(_controller.text, _controller.text);
                if(loginSuccess){
                  Navigator.pushNamed(context, '/');
                }
              },
            )
          ],),
      ),
    );
  }
}