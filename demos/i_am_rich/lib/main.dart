import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'i am rich',
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('I Am Rich')
          ),
          backgroundColor: Colors.red,
          
        )
      )
    );
  }
}


