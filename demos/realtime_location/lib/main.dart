
import 'package:flutter/material.dart';
//import 'package:i_am_rich/models/user_location.dart';
//import 'package:location_service/services/location_service.dart';
//import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'i am rich',
      home: Scaffold(
        backgroundColor: Colors.blueGrey[800],
        appBar: AppBar(
          title: Center(
            child: Text('I Am Rich')
          ),
          backgroundColor: Colors.blueGrey[900],
          
        ),
        body: Container(
          // child: StreamProvider<UserLocation>
        )  
      )
    );
  }
}


