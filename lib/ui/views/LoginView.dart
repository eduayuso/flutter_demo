import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rest_demo/config/constants.dart';
import 'package:flutter_rest_demo/ui/models/LoginModel.dart';
import 'package:flutter_rest_demo/ui/widgets/CustomTextField.dart';
import 'package:flutter_rest_demo/config/styles.dart' as Styles;
import 'package:flutter_rest_demo/config/constants.dart' as Constants;

import 'View.dart';

class LoginView extends StatefulWidget {

  @override
  LoginViewState createState() => LoginViewState();
}

class LoginViewState extends State<LoginView> {

  @override
  Widget build(BuildContext context) {

    return
      View<LoginModel>(
        builder: (context, model, child) =>
          Scaffold(
            backgroundColor: Styles.backgroundColor,
            body: LoginForm(model: model),
          ),
      );
  }
}

class LoginForm extends StatelessWidget {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final LoginModel model;

  LoginForm({this.model});

  @override
  Widget build(BuildContext context) {

    return
      Padding(
        padding: EdgeInsets.all(40.0),
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomTextField(
              controller: this.emailController,
              hint: "email",
              icon: Icons.mail
            ),
            CustomTextField(
              controller: this.passwordController,
              hint: "password",
              icon: Icons.lock
            ),
            model.status == ViewStatus.Busy
            ? CircularProgressIndicator()
            : LoginButton(context),
          ],
        ),
      );
  }

  Widget LoginButton(BuildContext context) {

    return
      Padding(
        padding: EdgeInsets.only(top:40.0),
        child: RaisedButton(
          color: Colors.white,
          child: Text(
            'Logiasaxxxxaadfn',
            style: TextStyle(color: Colors.black),
          ),
          onPressed: () async {
            String username = this.emailController.text;
            String password = this.passwordController.text;
            loginAction(context, username, password);
          }
        ),
      );
  }

  void loginAction(BuildContext context, String username, String password) async {

    final snackBar = SnackBar(content: Text('User $username, Pass $password'));
    Scaffold.of(context).showSnackBar(snackBar);
    /*
    bool loginSuccess = await model.login(_controller.text, _controller.text);
    if(loginSuccess){
      Navigator.pushNamed(context, '/');
    }*/
  }
}
