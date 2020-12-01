import 'package:flutter/material.dart';
import 'shoppinglist.dart';
import 'allproducts.dart';


class HomePageView extends StatefulWidget {

  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[800],
        title: Padding(
          padding: EdgeInsets.fromLTRB(5, 15, 5, 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child:Text('Shoppina'),
              )
            ] 
          ),
        ),
      ),
      body: Container(
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     begin: Alignment.topCenter,
        //     end: Alignment.bottomCenter,
        //     colors: [Colors.blueGrey[800], Colors.blueGrey[900]]
        //   )
        // ),
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 50,bottom:50),
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    Text('Welkom bij Shoppina', style: 
                      TextStyle(
                        fontSize: 30,
                        color: Colors.white, 
                      ),
                    ),
                  ],
                )
              ),
              Column(
                children: <Widget>[
                  Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.blueGrey[900].withOpacity(0.75),
                          blurRadius: 10,
                          offset: Offset(5,5)
                        )
                      ]
                    ),
                    margin: EdgeInsets.all(20),
                    child: SizedBox(
                      width: 250,
                      height: 250,
                      child: RaisedButton(
                        color: Colors.blueGrey[900],
                        padding: EdgeInsets.all(20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        onPressed: () {
                          Navigator.push(context, 
                            MaterialPageRoute(
                              builder: (context) => ShoppingListView()
                            )
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(bottom: 25),
                              child: Icon(
                                Icons.shopping_bag, 
                                size: 65,
                                color: Colors.white,
                              )
                            ),
                            Text('Je boodschappenlijstje'.toUpperCase(), style: 
                              TextStyle(
                                color: Colors.white
                              ),
                            )
                          ]
                        )
                      ),
                    )
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.blueGrey[900].withOpacity(0.75),
                          blurRadius: 10,
                          offset: Offset(5,5)
                        )
                      ]
                    ),
                    child: SizedBox(
                      width: 250,
                      height: 250,
                      child: RaisedButton(
                        color: Colors.blue,
                        padding: EdgeInsets.all(20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        onPressed: () {
                          Navigator.push(context, 
                            MaterialPageRoute(
                              builder: (context) => AllProductsView()
                            )
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(bottom: 25),
                              child: Icon(
                                Icons.shopping_cart_rounded, 
                                size: 65,
                                color: Colors.white,
                              )
                            ),
                            Text('Bekijk alle producten'.toUpperCase(), style: 
                              TextStyle(
                                color: Colors.white
                              ),
                            )
                          ]
                        )
                      ),
                    )
                  ),
                ]
              )
            ],
          ),
        ),
      )
    );
  }
}
