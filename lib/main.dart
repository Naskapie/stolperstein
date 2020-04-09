import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

import 'pages/camera.dart';
import 'pages/credits.dart';
import 'pages/home.dart';
import 'pages/profile.dart';
import 'pages/settings.dart';
import 'theme/style.dart';

Future<void> main() async {
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => MyHomePage(
              camera: firstCamera,
            ),
        '/camera': (context) => CameraPage(
              camera: firstCamera,
            ),
        '/profile': (context) => ProfilePage(),
        '/settings': (context) => SettingsPage(),
        '/credits': (context) => CreditsPage()
      },
    ),
  );
}
