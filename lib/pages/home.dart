import 'package:flutter/material.dart';

import 'package:Stolperstein/widgets/map_widget.dart';
import 'package:Stolperstein/widgets/drawer_widget.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stolperstein'),
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(Icons.layers),
            tooltip: 'Map types',
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                value: 1,
                child: Text('Default'),
              ),
              PopupMenuItem(
                value: 2,
                child: Text('Satellite'),
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
            padding: const EdgeInsets.only(bottom: 10),
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
              Navigator.pushNamed(context, '/camera');
            },
            child: Icon(Icons.photo_camera),
          ),
        ],
      ),
    );
  }
}
