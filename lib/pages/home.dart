import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'camera.dart';
import 'map.dart';
import 'profile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, @required this.camera}) : super(key: key);

  final CameraDescription camera;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static const int explore = 0;
  static const int contribute = 1;
  static const int uploads = 2;

  void _onItemTapped(int index) {
    setState(
      () {
        _selectedIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          IndexedStack(
            index: _selectedIndex,
            children: <Widget>[
              MapPage(),
              Navigator(
                onGenerateRoute: (route) => MaterialPageRoute<void>(
                  settings: route,
                  builder: (context) => CameraPage(
                    camera: widget.camera,
                  ),
                ),
              ),
              ProfilePage(),
            ],
          ),
        ],
      ),
      bottomNavigationBar:
          // Visibility(
          //   visible: _selectedIndex != contribute,
          // child:
          BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 50,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            title: Text('Explore'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.control_point),
            title: Text('Contribute'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.file_upload),
            title: Text('Uploads'),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      // ),
    );
  }
}
