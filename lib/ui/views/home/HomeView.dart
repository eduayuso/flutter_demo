import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rest_demo/ui/models/HomeModel.dart';
import 'package:flutter_rest_demo/config/styles.dart' as Styles;

import '../View.dart';
import 'HomeAppBar.dart';
import 'HomeDrawer.dart';
import 'UserListView.dart';

class HomeView extends StatefulWidget {

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {

  @override
  Widget build(BuildContext context) {

    return
      View<HomeModel>(
        onModelReady: (model) => model.fetchUsers(),
        builder: (context, model, child) =>
          Scaffold(
            backgroundColor: Styles.backgroundColor,
            appBar:
              HomeAppBar(model),
            drawer:
              HomeDrawer(model),
            body:
              model.users.isEmpty
              ? Center(child: CircularProgressIndicator())
              : UserListView(model:model),
          ),
      );
  }
}