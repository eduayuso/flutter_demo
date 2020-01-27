import 'package:flutter/material.dart';
import 'package:flutter_rest_demo/ui/models/HomeModel.dart';

Widget HomeAppBar(HomeModel model) {

  return
    AppBar(
      title: Text("User list"),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          tooltip: 'Search',
          onPressed: null,
        ),
      ],
    );
}