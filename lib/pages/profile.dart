import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Profil';

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            radius: 50.0,
            backgroundImage: AssetImage('images/avatar.png'),
          ),
          Text(
            'OSM Mapper',
            style: TextStyle(
              fontFamily: 'Source Sans Pro',
              color: Colors.teal.shade900,
              fontSize: 20.0,
              letterSpacing: 2.5,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20.0,
            width: 150.0,
            child: Divider(
              color: Colors.teal.shade100,
            ),
          ),
          Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  color: Colors.teal,
                ),
                title: Text(
                  'Hamburg, Germany',
                  style: TextStyle(
                    color: Colors.teal.shade900,
                    fontFamily: 'Source Sans Pro',
                    fontSize: 20.0,
                  ),
                ),
              )),
          Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  color: Colors.teal,
                ),
                title: Text(
                  'user.name@email.com',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.teal.shade900,
                      fontFamily: 'Source Sans Pro'),
                ),
              ))
        ],
      )),
    );
  }
}
