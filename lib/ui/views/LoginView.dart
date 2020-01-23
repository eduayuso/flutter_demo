import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rest_demo/config/constants.dart';
import 'package:flutter_rest_demo/data/model/User.dart';
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

class LoginForm extends StatefulWidget {

  final LoginModel model;

  LoginForm({this.model});

  @override
  LoginFormState createState() => LoginFormState(model:this.model);
}

class LoginFormState extends State<StatefulWidget> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  LoginModel model;

  LoginFormState({this.model});

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
              icon: Icons.mail,
              errorText: "Enter a valid email",
              validation: this.model.emailValidation,
            ),
            CustomTextField(
              controller: this.passwordController,
              hint: "password",
              icon: Icons.lock,
              errorText: "Enter a valid password (3 characters at least)",
              validation: this.model.passwordValidation,
            ),
            LoginButton(context, this.model.status)
          ],
        ),
      );
  }

  Widget LoginButton(BuildContext context, ViewStatus status) {

    return
      Container(
        height:64,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top:40.0),
        child:
          FlatButton(
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
            ),
            color: Colors.lightGreen,
            child:
              status == ViewStatus.Busy
              ? CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.white))
              : Text('Login', style: TextStyle(color: Colors.white)),
            onPressed: () async {
              if (status == ViewStatus.Busy) return null;
              String username = this.emailController.text;
              String password = this.passwordController.text;
              loginAction(context, username, password);
            },
          )
      );
  }

  void loginAction(BuildContext context, String username, String password) async {

    /*final snackBar = SnackBar(content: Text('User $username, Pass $password'));
    Scaffold.of(context).showSnackBar(snackBar);*/

    User loggedUser = await model.login(username ,password);
    if (loggedUser != null) {
      //Navigator.pushNamed(context, '/');
      var userName = loggedUser.firstName;
      final snackBar = SnackBar(content: Text('Logged! $userName'));
      Scaffold.of(context).showSnackBar(snackBar);
    } else if (this.model.emailValidation && this.model.passwordValidation) {
      final snackBar = SnackBar(content: const Text('Noooo!'));
      Scaffold.of(context).showSnackBar(snackBar);
    }
    this.emailController.text = username;
    this.passwordController.text = password;
  }
}
