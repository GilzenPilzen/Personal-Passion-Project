import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State {
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
        body: Row(
          children: <Widget>[ 
              Builder(
                builder: (context) => FlatButton(
                  child: Text("open overlay"),
                  onPressed: (){
                    _sheetOverlay(context);
                  }
                )
              ) 
            ]
          )
        ) 
      );
  }

}

 void _sheetOverlay(context) {
  showModalBottomSheet(context: context, builder: (BuildContext bc) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child:  Wrap(
        children: <Widget>[
          Text("This is the sheet overlay"),
        ]
      )
    );
  });
}




