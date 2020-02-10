import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'map_widget.dart';
import 'drawer_widget.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stolperstein'),
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(Icons.layers),
            tooltip: 'Map types',
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                value: 1,
                child: Text("Default"),
              ),
              PopupMenuItem(
                value: 2,
                child: Text("Satellite"),
              ),
            ],
          ),
        ],
      ),
      drawer: NavDrawer(),
      body: Center(
        child: MapWidget(),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: FloatingActionButton(
              tooltip: 'Location',
              heroTag: 'btn1',
              onPressed: () {
                print('tip');
              },
              child: Icon(Icons.my_location),
            ),
          ),
          FloatingActionButton(
            heroTag: 'btn2',
            onPressed: () {
              Navigator.pushNamed(context, '/pictureScanner');
            },
            child: Icon(Icons.photo_camera),
          ),
        ],
      ),
    );
  }
}
