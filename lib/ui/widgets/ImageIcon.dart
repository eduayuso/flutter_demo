import 'package:flutter/material.dart';

class ImageIcon extends StatelessWidget {

  final String filename;

  ImageIcon({this.filename});

  @override
  Widget build(BuildContext context) {
    return Hero(
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 38.0,
        child: Image(image: AssetImage(this.filename)),
      ),
    );
  }
}