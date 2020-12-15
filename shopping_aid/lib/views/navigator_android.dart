import 'dart:async';

import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
// import 'package:vector_math/vector_math_64.dart' as vector;
import 'package:flutter_3d_obj/flutter_3d_obj.dart';
import 'package:compasstools/compasstools.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geomag/geomag.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:location/location.dart' hide LocationAccuracy;

// ignore: must_be_immutable
class ArCoreNavigator extends StatefulWidget {

  var data;
  var latitude;
  var longitude;
  ArCoreNavigator({this.data, this.latitude, this.longitude});

  @override
  _ArCoreNavigatorState createState() => _ArCoreNavigatorState(data, latitude, longitude);
}
class _ArCoreNavigatorState extends State<ArCoreNavigator> {
  
  var cords;
  ArCoreController arCoreController;
  var bearing;
  int _haveSensor;
  String sensorType;
  var direction;
  var _declination ;
  var azimuth;
  var data;
  var index = 0;
  var latitude;
  var longitude;
  var latitudeDouble;
  var longitudeDouble;
  var distance = "nog aan het berekenen";
  bool visible = false;
  StreamSubscription _locationSubscription;
  Location _locationTracker = new Location();


  _ArCoreNavigatorState(this.data, this.latitude, this.longitude);

  void printData() {
    print(data);
  }

  Future<double> _getDeclination(latitude, longitude, altitude) async {

    // ignore: await_only_futures
    final result = await GeoMag().calculate(
      latitude, longitude, altitude * 3.28084
    ); // m -> ft
    return result.dec;
  }

  void getLiveLocation() {

    if (_locationSubscription != null) {
      _locationSubscription.cancel(); 
    }
    _locationSubscription = _locationTracker.onLocationChanged.listen((locationData) {
      var distanceToGoal = Geolocator.distanceBetween(locationData.latitude, locationData.longitude, latitudeDouble, longitudeDouble);
      print("Afstand tot doel: $distanceToGoal");
    
      if(distanceToGoal <= 2) {
        print("uw product bevindt zich binnen een straal van 2 meter ");
      }else {
        print("nog eventjes zoeken");
      }
      // print(visible);
      print("-----------------------------------");
      
    });
  }

  void _getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    // print(position);
    latitudeDouble = double.parse(data['latitude']);
    longitudeDouble = double.parse(data['longitude']);
    print(latitudeDouble);
    print(longitudeDouble);
    
    bearing = Geolocator.bearingBetween(position.latitude, position.longitude, latitudeDouble, longitudeDouble);
    print(bearing);  
    cords= position;
    print(cords);
    
    _getDeclination(position.latitude, position.longitude, position.latitude).then((dec) {
      setState(() {
        _declination = dec;
      });
    });
  }


  void _checkIfNull() {
    if(azimuth == null || direction == null || _declination == null) {
      print("berekening is nog bezig");
    }
  }

  @override
  void initState() {
    super.initState();
      checkDeviceSensors();
      _checkIfNull();
      _getCurrentLocation();
      getLiveLocation();
  }

  Future<void> checkDeviceSensors() async {
    int haveSensor;
    try {
      haveSensor = await Compasstools.checkSensors;
      switch (haveSensor) {
        case 0:{
          sensorType = "No sensors for compass!";
        }
        break;
        case 1:{
          sensorType = "Accelerometer + Magnetometer!";
        }
        break;
        case 2:{
          sensorType = "Gyroscope!";
        }
        break;
        default:{
          sensorType = "Error!";
        }
        break;
      }
    } on Exception {}

    if (!mounted) return;

    setState(() {
      _haveSensor = haveSensor;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
    ]);
    return 
    SplashScreen(
      seconds: 5,
        navigateAfterSeconds:
        Scaffold(
          backgroundColor: Colors.blueGrey[800],
          body: Stack(
            children: [
              // ArCoreView(
              //   onArCoreViewCreated: _onArCoreViewCreated,
              // ),
              Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50, left: 10),
                      child: IconButton(
                        icon: Icon(Icons.arrow_back,
                          size: 30,
                          color: Colors.white,  
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Container(
                      child: StreamBuilder(
                        stream: _locationTracker.onLocationChanged,
                        builder: (BuildContext context, AsyncSnapshot locationShot){
                          if(locationShot.hasData){

                            var distanceStream = Geolocator.distanceBetween(locationShot.data.latitude, locationShot.data.longitude, latitudeDouble, longitudeDouble);
                            var distanceStreamRounded = double.parse((distanceStream).toStringAsFixed(0));

                            return Container(
                              width: MediaQuery.of(context).size.width,
                              alignment: Alignment.center,
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(10),
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  color: Colors.blueGrey[900],
                                ), 
                                child: Text(distanceStreamRounded.toString()+' meter', style: 
                                  TextStyle(
                                    color: Colors.white
                                  ),
                                )
                              )
                            );
                          }else 
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.center,
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(10),
                              width: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                color: Colors.blueGrey[900],
                              ), 
                              child: Text('Distance is being calculated', style: 
                                TextStyle(
                                  color: Colors.white
                                ),
                              )
                            )
                          );
                        },
                      )
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  child: StreamBuilder(
                    stream: Compasstools.azimuthStream,
                    builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                      if (snapshot.hasData) {

                      azimuth = _declination + snapshot.data;
                      direction = azimuth - bearing;
                      var directHeading = double.parse((direction).toStringAsFixed(12));

                      return Padding(
                        padding: EdgeInsets.all(20),
                        child: Center(
                            child: new RotationTransition(
                              turns: new AlwaysStoppedAnimation(-directHeading/360),
                              child: Object3D(
                                size: Size(10, 10),
                                path: "assets/file.obj",
                                asset: true,
                              ),
                            )
                        ),
                      );
                    } 
                      return Text("Error in stream");
                    },
                  )
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 25),
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                          color: Colors.grey,
                        ),
                        child:Row(
                          children: [
                            Image(
                              width: 75,
                              image: AssetImage("assets/images/producten/"+data['image']),  
                            ),
                            // Text(product['name']),
                            Text('Text'),
                            RaisedButton(
                              child: Icon(Icons.done),
                              onPressed: () {
                                // updateProduct();
                              })
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ),
        title: Text('Calculating direction',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Colors.white
          ),
        ),
        backgroundColor: Colors.blueGrey[900],
        styleTextUnderTheLoader: new TextStyle(),
        onClick: ()=>print("Flutter Egypt"),
        loaderColor: Colors.blueGrey[700]
    );
    
  }
}