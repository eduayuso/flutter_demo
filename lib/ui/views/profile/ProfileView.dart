import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rest_demo/data/model/User.dart';
import 'package:flutter_rest_demo/ui/models/ProfileModel.dart';

import '../View.dart';
import 'ProfileImageWidget.dart';

class ProfileView  extends StatefulWidget {

  int userId;

  ProfileView({this.userId});

  @override
  ProfileState createState() => ProfileState(userId:this.userId);
}

class ProfileState extends State<ProfileView> {

  final String _status = "Software Developer";
  final String _bio = "\"Hi, I am a Freelance developer working for hourly basis. If you wants to contact me to build your product leave a message.\"";
  final String _followers = "173";
  final String _posts = "24";
  final String _scores = "450";

  int userId;

  ProfileState({this.userId});

  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;

    return
      View<ProfileModel>(
        onModelReady: (model) => model.fetchUser(this.userId),
        builder: (context, model, child) =>
          Scaffold(
            appBar:
              AppBar(title: Text("User profile")),
            body:
              model.user == null
              ? Center(child: CircularProgressIndicator())
              : Stack(
                  children: <Widget>[
                  CoverImageWidget(screenSize),
                  SafeArea(
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: screenSize.height / 6.4),
                          ProfileImageWidget(model.user.avatar),
                          FullNameWidget(model.user.firstName + " " + model.user.lastName),
                          StatusWidget(context),
                          StatContainerWidget(),
                          BioWidget(context),
                          SeparatorWidget(screenSize),
                          SizedBox(height: 10.0),
                          GetInTouchWidget(context, model.user.firstName + " " + model.user.lastName),
                          SizedBox(height: 8.0),
                          ButtonsWidget(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
          )
      );
  }

  Widget FullNameWidget(String name) {

    TextStyle _nameTextStyle = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.black,
      fontSize: 28.0,
      fontWeight: FontWeight.w700,
    );

    return Text(
      name,
      style: _nameTextStyle,
    );
  }

  Widget StatusWidget(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Text(
        _status,
        style: TextStyle(
          fontFamily: 'Spectral',
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }

  Widget StatItemWidget(String label, String count) {

    TextStyle _statLabelTextStyle = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.black,
      fontSize: 16.0,
      fontWeight: FontWeight.w200,
    );

    TextStyle _statCountTextStyle = TextStyle(
      color: Colors.black54,
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          count,
          style: _statCountTextStyle,
        ),
        Text(
          label,
          style: _statLabelTextStyle,
        ),
      ],
    );
  }

  Widget StatContainerWidget() {

    return Container(
      height: 60.0,
      margin: EdgeInsets.only(top: 8.0),
      decoration: BoxDecoration(
        color: Color(0xFFEFF4F7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          StatItemWidget("Followers", _followers),
          StatItemWidget("Posts", _posts),
          StatItemWidget("Scores", _scores),
        ],
      ),
    );
  }

  Widget BioWidget(BuildContext context) {

    TextStyle bioTextStyle = TextStyle(
      fontFamily: 'Spectral',
      fontWeight: FontWeight.w400,//try changing weight to w500 if not thin
      fontStyle: FontStyle.italic,
      color: Color(0xFF799497),
      fontSize: 16.0,
    );

    return Container(

      color: Theme.of(context).scaffoldBackgroundColor,
      padding: EdgeInsets.all(8.0),
      child: Text(
        _bio,
        textAlign: TextAlign.center,
        style: bioTextStyle,
      ),
    );
  }

  Widget SeparatorWidget(Size screenSize) {

    return Container(
      width: screenSize.width / 1.6,
      height: 2.0,
      color: Colors.black54,
      margin: EdgeInsets.only(top: 4.0),
    );
  }

  Widget GetInTouchWidget(BuildContext context, String name) {

    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: EdgeInsets.only(top: 8.0),
      child: Text(
        "Get in Touch with ${name.split(" ")[0]},",
        style: TextStyle(fontFamily: 'Roboto', fontSize: 16.0),
      ),
    );
  }

  Widget ButtonsWidget() {

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: InkWell(
              onTap: () => print("followed"),
              child: Container(
                height: 40.0,
                decoration: BoxDecoration(
                  border: Border.all(),
                  color: Color(0xFF404A5C),
                ),
                child: Center(
                  child: Text(
                    "FOLLOW",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 10.0),
          Expanded(
            child: InkWell(
              onTap: () => print("Message"),
              child: Container(
                height: 40.0,
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "MESSAGE",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

