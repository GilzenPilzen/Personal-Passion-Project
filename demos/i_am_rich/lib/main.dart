import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  final src = 'images/homer.png';
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                  image: AssetImage(src),
                ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(25.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text('Yoo',
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.white
                        )
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(25.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Yoo',
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.white
                        )
                      ),
                    ),
                  ),
                ]
              )
            ]
          ),
        )  
      )
    );
  }
}


