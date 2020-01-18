import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rest_demo/data/access/DataManager.dart';
import 'package:flutter_rest_demo/data/model/User.dart';
import 'package:flutter_rest_demo/config/constants.dart' as Constants;

class LoginPage extends StatefulWidget {

  final DataManager data;

  LoginPage({this.data});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {

  Future<User> user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(36.0),
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(36.0),
                child: LoginIcon()
            ),
            LoginField(title: "Nombre de usuario"),
            LoginField(title: "Contraseña"),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 36.0),
              child: RaisedButton(

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
                onPressed: () => loginAction("a", "b"),
                padding: EdgeInsets.all(18),
                color: Colors.lightGreen,
                child: Text('Acceder', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }


  void loginAction(String username, String password) async {

    User user = await widget.data.remote.users.login(username, password);
    print(user.firstName);
  }
}

class LoginIcon extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 38.0,
        child: Image(image: AssetImage(Constants.APP_ICON_FILENAME)),
      ),
    );
  }
}

class LoginField extends StatelessWidget {

  final String title;

  LoginField({this.title});

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      decoration: InputDecoration(
          labelText: this.title
      ),
    );
  }
}