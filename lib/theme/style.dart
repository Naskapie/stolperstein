import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    primarySwatch: Colors.grey,
    buttonColor: Colors.white,
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.white,
      textTheme: ButtonTextTheme.normal,
    ),
    iconTheme: IconThemeData(color: Colors.white),
  );
}
