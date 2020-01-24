import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rest_demo/config/constants.dart';
import 'package:flutter_rest_demo/data/model/User.dart';
import 'package:flutter_rest_demo/ui/models/LoginModel.dart';
import 'package:flutter_rest_demo/ui/widgets/CustomTextFormField.dart';
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

class LoginFormState extends State<LoginForm> {

  final TextEditingController emailController = TextEditingController(text:"aaaaa");
  final TextEditingController passwordController = TextEditingController(text:"bbbbbbb");
  final formKey = GlobalKey<FormState>();
  LoginModel model;

  LoginFormState({this.model});

  @override
  Widget build(BuildContext context) {

    return
      Padding(
        padding: EdgeInsets.all(40.0),
        child:
          Form(
            key: this.formKey,
            child:
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CustomTextFormField(
                    controller: this.emailController,
                    hint: "Enter your email",
                    icon: Icons.mail,
                    validator: (value) {
                      if (value.isEmpty) return "Enter a valida email";
                      return null;
                    }
                  ),
                  CustomTextFormField(
                    controller: this.passwordController,
                    hint: "Enter your password",
                    icon: Icons.lock,
                    validator: (value) {
                      if (value.length < 6) return "Enter a valid password (6 characters at least)";
                      return null;
                    }
                  ),
                  LoginButton(context, this.model.status)
                ],
            ),
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
              loginAction(context);
            },
          )
      );
  }

  void loginAction(BuildContext context) async {

    if (!this.formKey.currentState.validate()) return;

    String username = this.emailController.text;
    String password = this.passwordController.text;

    User loggedUser = await model.login(username, password);

    String userName = "";
    if (loggedUser != null) userName = loggedUser.firstName;
    else userName = "Nooooo!";

    final snackBar = SnackBar(content: Text('Logged! $userName'));
    Scaffold.of(context).showSnackBar(snackBar);

    Navigator.pushNamed(context, Constants.PAGE_HOME);
  }
}
