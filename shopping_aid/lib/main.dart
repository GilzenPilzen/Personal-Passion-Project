import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final src = 'https://picsum.photos/250?image=9';

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
          backgroundColor: Colors.blueGrey[800],
          
        ),
        body: Column(
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
            Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.fromLTRB(0, 0, 10, 20) ,
                    child: Builder(
                      builder: (context) => FloatingActionButton(
                        child: Icon(Icons.local_activity),
                        onPressed: (){
                          _productsOverlay(context);
                        }
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      child: BottomNavigationBar(
                        unselectedItemColor: Colors.white,
                        backgroundColor: Colors.blueGrey[700],
                        showUnselectedLabels: true,
                        type: BottomNavigationBarType.fixed,
                        items: [
                          BottomNavigationBarItem(
                            backgroundColor: Colors.white,
                            icon: Icon(Icons.local_activity,
                              color: Colors.white
                            ),
                            label: "Aardappel",
                          ),
                          BottomNavigationBarItem(
                            backgroundColor: Colors.white,
                            icon: Icon(Icons.local_activity,
                              color: Colors.white
                            ),
                            label: "Aardappel",
                          ), 
                          BottomNavigationBarItem(
                            backgroundColor: Colors.white,
                            icon: Icon(Icons.local_activity,
                              color: Colors.white
                            ),
                            label: "Aardappel",
                          ) ,
                          BottomNavigationBarItem(
                            backgroundColor: Colors.white,
                            icon: Icon(Icons.local_activity,
                              color: Colors.white
                            ),
                            label: "Aardappel",
                          ) 
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],  
          ),
        )  
    );
  }
}

void _productsOverlay(context) {
  showModalBottomSheet(
    context: context, 
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),),
    isScrollControlled: true, 
    backgroundColor: Colors.grey[800],
    builder: (BuildContext bc) {
    
    return (
      Container(
        width: MediaQuery.of(context).size.width,
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
                Container(height: 50),

                Container(
                  decoration: BoxDecoration(
                    borderRadius:BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
                    color: Colors.grey[800],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      _productQuickView()
                    ],
                  )
                )
              ]
          )
        ),
      )
    );
  });
}

// ignore: camel_case_types
class _productQuickView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius:BorderRadius.all(Radius.circular(25)),
                color: Colors.white
              ),
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.only(bottom: 35),
              child: Image(
                width: 300,
                image: AssetImage("assets/images/cola.jpg"),
              )
            ),
            Text("This is the sheet overlay", 
              // style:  
            ),
          ]
        ) 
      )
    );  
  }
}



