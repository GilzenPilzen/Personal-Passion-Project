

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';



void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var position;
  var longitude = 0.0000; 
  var latitude = 0.0000; 
  var positionString;
  var bearing;

  // checkVariable(){
  //   setState(() {
  //     positionString = position;
  //     print(positionString);
      
  //     bearing = Geolocator.bearingBetween(latitude, longitude, 52.3546274, 4.8285838);
  //     print(bearing);
  //   });
  // }

  

  void _getCurrentLocation() async {
    position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    print(position);

    setState(() {
      bearing = Geolocator.bearingBetween(position.latitude, position.longitude, 52.3546274, 4.8285838);
      print("bearing: $bearing");  
    });

    
  
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
        body: 
        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              Text(position.toString()),
              Text("Bearing "+ bearing.toString()),
              RaisedButton(
                child: Text('Controleer de positie'),
                onPressed: () {
                  // checkVariable();
                  _getCurrentLocation();
                }
              ),
            ],
          )
        )
      )
    );
  }
}

