import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer timer;
  @override
  void initState() {
    timer = Timer(Duration(seconds: 1),
        () => Navigator.pushReplacementNamed(context, '/home'));
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Container(
              height: 144,
              child: Image.asset('images/splash.png'),
            ),
          ),
        ],
      ),
    );
  }
}
