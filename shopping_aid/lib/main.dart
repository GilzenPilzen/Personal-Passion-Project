import 'package:flutter/material.dart';
// import 'views/shoppinglist.dart';
import 'views/homepage.dart';

// HEAD FUNCTION
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shoppina',
      home: HomePageView()
    );
  }
}
