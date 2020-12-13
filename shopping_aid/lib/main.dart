import 'package:flutter/material.dart';
// import 'views/shoppinglist.dart';
import 'views/homepage.dart';
import 'package:splashscreen/splashscreen.dart';

// HEAD FUNCTION
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shoppina',
      home:
      SplashScreen(
        seconds: 5,
        navigateAfterSeconds: HomePageView(),
        title: Text('Welcome to Shoppina',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Colors.white
          ),
        ),
        backgroundColor: Colors.blueGrey[800],
        styleTextUnderTheLoader: new TextStyle(),
        onClick: ()=>print("Flutter Egypt"),
        loaderColor: Colors.transparent
      )
      
      
    );
  }
}
