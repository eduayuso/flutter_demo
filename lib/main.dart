import 'package:flutter/material.dart';
import 'data/access/DataManager.dart';
import 'ui/LoginPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Dieta Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(data: DataManager()),
    );
  }
}
