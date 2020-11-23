import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';
//import 'package:flutter/services.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _gyroscopeValues = [];

  @override
  void initState() {
    super.initState();
    gyroscopeEvents.listen((GyroscopeEvent event) {
      setState(() {
        _gyroscopeValues = <double>[event.x, event.y, event.z];
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Magnetometer',
      home: Scaffold(
        backgroundColor: Colors.blueGrey[800],
        appBar: AppBar(
          title: Center(
            child: Text('Gyroscoop')
          ),
          backgroundColor: Colors.blueGrey[900],
          
        ),
        body: Container(
            child: Text('$_gyroscopeValues')
          ),
        )  
      );
  }
}


