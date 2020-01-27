import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget ProfileImageWidget(String url) {

  return Center(
    child: Container(
      width: 140.0,
      height: 140.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: CachedNetworkImageProvider(url),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(80.0),
        border: Border.all(
          color: Colors.white,
          width: 10.0,
        ),
      ),
    ),
  );
}

Widget CoverImageWidget(Size screenSize) {

  return Container(
    height: screenSize.height / 3.2,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/cover.jpg'),
        fit: BoxFit.cover,
      ),
    ),
  );
}