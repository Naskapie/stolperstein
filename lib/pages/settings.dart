import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Settings'),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.account_circle),
              title: const Text('Storage'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: const Text('Map'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.info_outline),
              title: const Text('Select theme'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.lightbulb_outline),
              title: const Text('Credits'),
              onTap: () {
                Navigator.pushNamed(context, '/credits');
              },
            ),
            ListTile(
              leading: Icon(Icons.crop_square),
              title: const Text('About Stolpersteine'),
              onTap: () async {
                const url = 'http://www.stolpersteine.eu/en/';
                if (await canLaunch(url)) {
                  await launch(
                    url,
                    forceSafariVC: false,
                  );
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: const Text('Authorise OSM access'),
              onTap: () async {
                const url = 'https://www.openstreetmap.org/login';
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
