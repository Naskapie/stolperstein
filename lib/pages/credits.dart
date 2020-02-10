import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CreditsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Credits'),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.map),
              title: Text('OpenStreetMap contributors'),
              onTap: () async {
                final url = 'https://www.openstreetmap.org/copyright';
                if (await canLaunch(url)) {
                  await launch(
                    url,
                    forceSafariVC: false,
                  );
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.add_location),
              title: Text('Mapbox API'),
              onTap: () async {
                final url = 'https://www.mapbox.com/';
                if (await canLaunch(url)) {
                  await launch(
                    url,
                    forceSafariVC: false,
                  );
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.spa),
              title: Text('JavaScript library Leaflet'),
              onTap: () async {
                final url = 'https://leafletjs.com/';
                if (await canLaunch(url)) {
                  await launch(
                    url,
                    forceSafariVC: false,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
