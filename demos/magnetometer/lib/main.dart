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

  @override
  void initState(){
    super.initState();
    checkDeviceSensors();
  }

  Future<void> checkDeviceSensors()  async{
    int haveSensor;

    // try{
    //   haveSensor = await Compasstools.checkSensors;

    //   switch(haveSensor) {
    //     case 0: {
    //       sensorType="No sensor for compass";
    //     }
    //     break;
    //     case 1: {
    //       sensorType="Accelerometer + Magnetometer";
    //     }
    //     break;
    //     case 2: {
    //       sensorType="Gyroscope";
    //     }
    //     break;
    //     default: {
    //       sensorType="Error";
    //     }
    //     break;
    //   }


    // } on Exception {

    // }

    if(!mounted) return {
      setState(() async {
        _haveSensor = haveSensor;

        try{
          haveSensor = await Compasstools.checkSensors;

          switch(haveSensor) {
            case 0: {
              sensorType="No sensor for compass";
            }
            break;
            case 1: {
              sensorType="Accelerometer + Magnetometer";
            }
            break;
            case 2: {
              sensorType="Gyroscope";
            }
            break;
            default: {
              sensorType="Error";
            }
            break;
          }


        } on Exception {

        }
      })
    };
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Magnetometer',
      home: Scaffold(
        backgroundColor: Colors.blueGrey[800],
        appBar: AppBar(
          title: Center(
            child: Text('Magnetometer')
          ),
          backgroundColor: Colors.blueGrey[900],
          
        ),
        body: Container(
            child: Column(
              children: <Widget>[
                StreamBuilder(
                  stream: Compasstools.azimuthStream,
                  builder: (BuildContext context, AsyncSnapshot<int> snapshot){
                    if(snapshot.hasData){
                      return Padding (
                        padding: EdgeInsets.all(20),
                        child: Center(
                          child: RotationTransition(
                            turns: AlwaysStoppedAnimation(
                              snapshot.data /360,
                            ),
                            child: Image.asset('assets/images/compass.png'),
                          )
                        ),
                      );
                    } else {
                      return Text("Error in stream");
                    }
                  },
                ),
               Text("Sensortype: $sensorType" )
              ],
            ),
          ),
        )  
      );
  }
}


