import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
// import 'package:vector_math/vector_math_64.dart' as vector;
import 'package:flutter_3d_obj/flutter_3d_obj.dart';
import 'package:compasstools/compasstools.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geomag/geomag.dart';

class ArCoreNavigator extends StatefulWidget {

  @override
_ArCoreNavigatorState createState() => _ArCoreNavigatorState();
}

class _ArCoreNavigatorState extends State<ArCoreNavigator> {
  var cords;
  ArCoreController arCoreController;
  var bearing;
  int _haveSensor;
  String sensorType;
  var direction;
  double _declination;
  var azimuth;

  

  Future<double> _getDeclination(latitude, longitude, altitude) async {
    // ignore: await_only_futures
    final result = await GeoMag().calculate(
      latitude, longitude, altitude * 3.28084
    ); // m -> ft
    return result.dec;
  }

  void _getInitialPositionWithDeclination() async {
    final pos = await Geolocator.getLastKnownPosition() ?? await Geolocator.getCurrentPosition();

    if (pos == null) return null;

    _getDeclination(pos.latitude, pos.longitude, pos.latitude).then((dec) {
      setState(() {
        _declination = dec;
      });
    });
  }
  void _getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    // print(position);

    setState(() {
      bearing = Geolocator.bearingBetween(position.latitude, position.longitude, 52.3546274, 4.8285838);
      print(bearing);  
      cords= position;
      print(cords);
      print('azimuth: $azimuth');
      _getDeclination(position.latitude, position.longitude, position.latitude).then((dec) {
        setState(() {
          _declination = dec;
        });
      });
    });
  }

  @override
  void initState() {
    super.initState();
    checkDeviceSensors();
    _getCurrentLocation();
    _getInitialPositionWithDeclination();
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

  _onArCoreViewCreated(ArCoreController _arcoreController) {
    arCoreController = _arcoreController;
    // _addSphere(arCoreController);
    // _addCylinder(arCoreController);
  } 
  
  void dispose() {
    arCoreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) { 
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      backgroundColor: Colors.transparent,
      // appBar: AppBar(
      //   title: Text('Winkel navigator'),
      //   backgroundColor: Colors.transparent,
      // ),
      body: Stack(
        children: [
          ArCoreView(
            onArCoreViewCreated: _onArCoreViewCreated,
            enableTapRecognizer: true,  
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
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
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              child: StreamBuilder(
                stream: Compasstools.azimuthStream,
                builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                  if (snapshot.hasData) {
                    // print(snapshot.data);
                azimuth = _declination + snapshot.data;
                direction = azimuth - bearing;

                  return Padding(
                    padding: EdgeInsets.all(20),
                    child: Center(
                        child: new RotationTransition(
                          turns: new AlwaysStoppedAnimation(-direction/360),
                          child: Object3D(
                            size: Size(10, 10),
                            path: "assets/file.obj",
                            asset: true,
                            angleZ: 500,
                          ),
                        )
                    ),
                  );
                }
                else
                  return Text("Error in stream!");
                },
              )
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(left: 15, right: 15, bottom: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.blue,
                    ),
                    child:Row(
                      children: [
                        Text('Ververs de hoek'),
                        RaisedButton(
                          child: Text('Klik om te verversen'),
                          onPressed: () {
                            _getCurrentLocation();
                          }
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}

