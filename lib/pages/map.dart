import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:user_location/user_location.dart';
import 'package:Stolperstein/services/config.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final MapController _mapController = MapController();
  final List<Marker> _markers = [];
  final StreamController<LatLng> _markerlocationStream =
      StreamController.broadcast();
  UserLocationOptions userLocationOptions;

  @override
  Widget build(BuildContext context) {
    _markerlocationStream.stream.listen((LatLng onData) {});

    userLocationOptions = UserLocationOptions(
        moveToCurrentLocationFloatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.my_location),
        ),
        context: context,
        mapController: _mapController,
        markers: _markers,
        // onLocationUpdate: (LatLng pos) =>
        //     print('onLocationUpdate ${pos.toString()}'),
        updateMapLocationOnPositionChange: false,
        showMoveToCurrentLocationFloatingActionButton: false,
        zoomToCurrentLocationOnLoad: true,
        fabBottom: 50,
        fabRight: 50,
        verbose: false);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Stolperstein'),
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(Icons.layers),
            tooltip: 'Map types',
            itemBuilder: (context) => [
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
      extendBodyBehindAppBar: true,
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(53.55, 9.99),
          zoom: 10.0,
          plugins: [
            UserLocationPlugin(),
          ],
        ),
        layers: [
          TileLayerOptions(
            urlTemplate:
                'https://api.mapbox.com/styles/v1/$MAPBOX_ID{z}/{x}/{y}@2x?access_token=$MAPBOX_ACCESS_TOKEN',
          ),
          MarkerLayerOptions(markers: _markers),
          userLocationOptions
        ],
        mapController: _mapController,
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: FloatingActionButton(
          tooltip: 'Location',
          heroTag: 'btn1',
          onPressed: () {
            print('tip');
          },
          child: Icon(Icons.my_location),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
  // @override
  // void dispose() => _markerlocationStream.close();
}
