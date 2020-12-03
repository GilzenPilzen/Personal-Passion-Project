

import 'dart:async';
//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';



void main() => runApp(MyApp());

// class MyApp extends StatefulWidget {

//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   var positionStream = Geolocator.getPositionStream(locationOptions).listen(
//   (Position position) {
//       print(position == null ? 'Unknown' : position.latitude.toString() + ', ' + position.longitude.toString());
//   });

//   @override
//   Widget build(BuildContext context) {

//     return MaterialApp(
//       title: 'Get Location',
//       home: Scaffold(
//         backgroundColor: Colors.blueGrey[800],
//         appBar: AppBar(
//           title: Center(
//             child: Text('Get Location')
//           ),
//           backgroundColor: Colors.blueGrey[900],
          
//         ),
//         body: Container(
//          child: Center(
//            child: FlatButton(
//              onPressed: () {
//               //  _getCurrentLocation();
//              },
//              color: Colors.green,
//              child: Text('Find location'),)
//          ),
//         )  
//       )
//     );
//   }
// }


class MyApp extends StatefulWidget {
  
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // ignore: cancel_subscriptions
  StreamSubscription<Position> positionStream = Geolocator.getPositionStream(desiredAccuracy: LocationAccuracy.best, distanceFilter: 1).listen(
    (Position position) {
      print(position);
      print('latitude:' + position.latitude.toString());
      print('longitude:' + position.longitude.toString());
      print(position == null ? 'unknown' : position.latitude.toString() + ', ' + position.longitude.toString());
  });
  
  // void _getCurrentLocation() async {
  //   final position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  //   print(position);
  // }
  
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
        body: RaisedButton(
          child: Text('Controleer de positie'),
          onPressed: () {}
        )
      )
    );
  }
}

