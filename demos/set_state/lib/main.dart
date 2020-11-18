import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'setSate demo',
      home: Scaffold(
        backgroundColor: Colors.blueGrey[800],
        appBar: AppBar(
          title: Center(
            child: Text('setSate demo')
          ),
          backgroundColor: Colors.blueGrey[900],
          
        ),
        body: Center(
          child: UpdateText()
        )
        
      ),
      
    );
  }
}

class UpdateText extends StatefulWidget {
  @override
  _UpdateTextStateState createState() => _UpdateTextStateState();
}

class _UpdateTextStateState extends State {

  String wordOne = 'Yoo';

  changeState() {
    setState(() {
        wordOne = 'Goodbye';
    
    });
  }
  Widget build(BuildContext context) {
    return Container(
      child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image(
              //     image: AssetImage("assets/images/Homer_Simpson.jpg"),
              //   ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(25.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text('$wordOne',
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.white
                        )
                      ),
                    ),
                  ),

                  FlatButton(
                    onPressed: () => changeState(),
                    child: Text('Dit is de button',
                      style: TextStyle(fontSize: 20.0),),
                  )
                ]
              )
            ]
          ),
    );
  }
}




