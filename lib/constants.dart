import 'package:flutter/material.dart';

const kThemeColor = Color(0xFF6A00FF);

const kLogoAsset = AssetImage('assets/mascot.png');

const kIconColor = Colors.purpleAccent;

const kContainerThemeDecoration = BoxDecoration(
  image: DecorationImage(
    image: AssetImage(
      "assets/home.png",
    ),
    fit: BoxFit.cover,
    alignment: Alignment.center,
  ),
);
