import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  final src = 'https://picsum.photos/250?image=9';
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Shoppina',
      home: Scaffold(
        backgroundColor: Colors.blueGrey[800],
        appBar: AppBar(
          title: Padding(
            padding: EdgeInsets.fromLTRB(5, 15, 5, 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Shoppina'),
                Text('€12,34')
              ] 
            ),
          ),
          backgroundColor: Colors.blueGrey[700],
          
        ),
        body: 
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Container(
                      child: ListView(
                        children: <Widget> [
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Card(  
                              color: Colors.blueGrey[900],
                              child: ListTile(
                                leading: FlutterLogo(size: 56.0),
                                title: Text("Dit is lijst item", style: 
                                  TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                subtitle: Text("2 pakken", style: 
                                  TextStyle(
                                    color: Colors.grey[400],
                                    fontWeight: FontWeight.normal
                                  ),
                                ),
                                trailing: 
                                    Wrap(
                                      alignment: WrapAlignment.center,
                                      spacing: 12,
                                      children: <Widget>[
                                        Text('€12,00', style: 
                                          TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        Icon(Icons.delete_forever_rounded, color: Colors.red),    
                                      ],
                                    ),    
                                ) 
                              )
                             ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
    );
  }
}


