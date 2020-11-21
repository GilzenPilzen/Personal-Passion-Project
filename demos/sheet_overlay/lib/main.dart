import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sheet overlay',
      home: Scaffold(
        backgroundColor: Colors.blueGrey[800],
        appBar: AppBar(
          title: Center(
            child: Text('Sheet overlay')
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
  showModalBottomSheet(
    context: context, 
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),),
    isScrollControlled: true, 
    backgroundColor: Colors.grey[800],
    builder: (BuildContext bc) {
    
    return (
      Container(
        padding: EdgeInsets.all(15),
        height: 715,
        child: (
          Column(
            children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 25),
                  decoration: BoxDecoration(
                    borderRadius:BorderRadius.all(Radius.circular(25)),
                    color: Colors.grey[700],
                  ),
                  height: 8,
                  width: 80,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius:BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
                    color: Colors.grey[800],
                  ),
                  child:  Wrap(
                    children: <Widget>[
                      Column(
                        children: [
                          Container(
                            child: Text("This is the sheet overlay"),   
                          ),
                          Container(
                            child: Text("This is the sheet overlay"),   
                          ),
                          Container(
                            child: Text("This is the sheet overlay"),   
                          ),
                          Container(
                            child: Text("This is the sheet overlay"),   
                          ),
                        ],
                      )
                    ]
                  )
                )
              ]
          )
        ),
      )
    );
  });
}




