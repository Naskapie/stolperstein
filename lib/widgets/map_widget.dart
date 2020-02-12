import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:user_location/user_location.dart';
import 'package:Stolperstein/services/config.dart';

class MapWidget extends StatefulWidget {
  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  MapController _mapController = MapController();
  List<Marker> _markers = [];
  StreamController<LatLng> _markerlocationStream = StreamController.broadcast();
  UserLocationOptions userLocationOptions;

  @override
  Widget build(BuildContext context) {
    _markerlocationStream.stream.listen((onData) {});

    userLocationOptions = UserLocationOptions(
        moveToCurrentLocationFloatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.my_location),
        ),
        context: context,
        mapController: _mapController,
        markers: _markers,
        onLocationUpdate: (LatLng pos) =>
            print("onLocationUpdate ${pos.toString()}"),
        updateMapLocationOnPositionChange: false,
        showMoveToCurrentLocationFloatingActionButton: false,
        zoomToCurrentLocationOnLoad: true,
        fabBottom: 50,
        fabRight: 50,
        verbose: false);

    return Scaffold(
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
    );
  }

  void dispose() => _markerlocationStream.close();
}
