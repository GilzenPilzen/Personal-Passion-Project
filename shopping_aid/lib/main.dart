import 'package:flutter/material.dart';
import 'shoppinglist.dart';


// HEAD FUNCTION
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shoppina',
      home: ShoppingListView(context)
    );
  }
}
