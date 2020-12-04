

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:compasstools/compasstools.dart';
//import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
 _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {

int _haveSensor;
  String sensorType;
  var data;

  void checkAziumthStream(){
    setState(() {
      print(Compasstools.azimuthStream);
      print(data);
    });
  }

  // ignore: cancel_subscriptions
  StreamSubscription<int> gryscope = Compasstools.azimuthStream.listen((event) {
    print(event);
  });
 

 @override
 void initState() {
  super.initState();
  checkDeviceSensors();
  checkAziumthStream();
 }
 
  Future<void> checkDeviceSensors() async {
    int haveSensor;


    try {
      haveSensor = await Compasstools.checkSensors;


      switch (haveSensor) {
        case 0:
          {
            sensorType = "No sensors for compass!";
          }
          break;


        case 1:
          {
            sensorType = "Accelerometer + Magnetometer!";
          }
          break;


        case 2:
          {
            sensorType = "Gyroscope!";
          }
          break;


        default:
          {
            sensorType = "Error!";
          }
          break;
      }
    } on Exception {


    }
    if (!mounted) return;

    setState(() {
      _haveSensor = haveSensor;
    });
  }

  

@override
 Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Compass App!'),
        ),
        body: new Container(
          child: Column(
            children: <Widget>[StreamBuilder(
              stream: Compasstools.azimuthStream,
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                if (snapshot.hasData) {
                  data = snapshot.data;
                  return Padding(
                    padding: EdgeInsets.all(20),
                    child: Center(
                        child: new RotationTransition(
                          turns: new AlwaysStoppedAnimation(
                              -snapshot.data / 360),
                          child: Image.asset("assets/images/compass.png"),
                        )
                    ),
                  );
                }
                else
                  return Text("Error in stream!");
              },
            ),
            Text("SensorType " + sensorType),
            RaisedButton(
              onPressed: () {
                checkAziumthStream();
              },
              child: Text('Druk op de knop'),
            )  
            ],
          ),
        ),
      )
    );
  }
}