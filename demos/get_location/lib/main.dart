import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  void _getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Get Location',
      home: Scaffold(
        backgroundColor: Colors.blueGrey[800],
        appBar: AppBar(
          title: Center(
            child: Text('Get Location')
          ),
          backgroundColor: Colors.blueGrey[900],
          
        ),
        body: Container(
         child: Center(
           child: FlatButton(
             onPressed: () {
               _getCurrentLocation();
             },
             color: Colors.green,
             child: Text('Find location'),)
         ),
        )  
      )
    );
  }
}


