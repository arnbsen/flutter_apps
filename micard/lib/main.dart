import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.teal,
      body:
      SafeArea(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            backgroundImage: AssetImage('images/icybay.jpg'),
            radius: 50.0,
            ),
            Text(
              'Icy Bay',
              style: TextStyle (
                fontSize: 40.0, 
                color: Colors.white,
                fontWeight: FontWeight.w500
                ),
            ),
            Text(
              'Sample Description',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0

              ),
            ),
            SizedBox(
              width: 150,
              height: 25,
              child: Divider(
                color: Colors.teal.shade100,
                thickness: 2,
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 5
              ),
              child: ListTile(
                leading: Icon(
                      Icons.navigation,
                      color: Colors.teal,
                      size: 40.0,
                    ),
                title: Text(
                      '-141.518167, 60.089917',
                      style: TextStyle(color: Colors.teal, fontSize: 20.0),
                  )
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 5
              ),
              child: ListTile(
                leading: Icon(
                      Icons.info,
                      color: Colors.teal,
                      size: 40.0,
                    ),
                title: Text(
                      'St. Elias National Park and Preserve',
                       style: TextStyle(color: Colors.teal, fontSize: 20.0),
                    )
              ),
            ),

        ],
      ),
      ), 
    ),
  )

);

