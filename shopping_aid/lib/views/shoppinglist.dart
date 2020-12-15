import 'package:flutter/material.dart';
import 'addproducts.dart';
import 'navigator_android.dart';
import 'navigator_ios.dart';
import 'dart:io' show Platform;


class ShoppingListView extends StatefulWidget{
  @override
  _ShoppingListViewState createState() => _ShoppingListViewState();
}

class _ShoppingListViewState extends State<ShoppingListView> {
  var products = [];
  var prices = [];
  var totalPrice = 0.0;
  var totalPriceString = '0,0';
  var color;
  var textColor;

  _removePrice(index, price) {
    setState(() {
      prices.removeAt(index);
      print(prices);
      _updatePrices();
    }); 
  }
  _printPrices() {
    setState(() {
      print(prices);
    });
    
  }
  _updatePrices() {
    setState(() {
      totalPrice = 0.0;
      for(int i = 0; i < prices.length; i++){
        if(!prices.contains(i)) {
          totalPrice += prices[i];
        }else {
        }
      }
      var totalPriceRounded = double.parse((totalPrice).toStringAsFixed(2));
      var parsetoString = totalPriceRounded.toString(); 
      var changePoint = parsetoString.replaceFirst(".", ",");
      totalPriceString = changePoint;

      print(totalPriceString);
    });
  }
  void _checkColor() {
    setState(() {
      if(products.length == 0) {
        color = Colors.transparent;
      }else if(products.length != 0){
        color = Colors.blue;
      }  
    });
    
  }

  void initState() {
    super.initState();
    _checkColor();
  }
   
  // _printPrices() {
  //     for(int i = 0; i < products.length; i++){
  //       String price = products[i]["price"];

  //       var changeKomma = price.replaceFirst(",", ".");
  //       print(changeKomma);
        
  //       var doublePrice = double.parse(changeKomma);
  //       prices.add(doublePrice);
  //       print(prices);
  //   }
  // }

  @override
  Widget build(BuildContext context) { 
   return Scaffold(
    backgroundColor: Colors.blueGrey[800],
    appBar: AppBar(
      title: Padding(
        padding: EdgeInsets.fromLTRB(5, 15, 5, 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Shoppina'),
            Row(
              children: [
                Text('€ $totalPriceString'),
                IconButton(
                  icon: Icon(Icons.refresh), 
                  onPressed: () { 
                    _updatePrices();
                    _printPrices();
                  },
                )
              ],
            )
          ] 
        ),   
      ),
      backgroundColor: Colors.blueGrey[800],
      
    ),
    body: Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Container(
              child: 
              ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius:BorderRadius.all(Radius.circular(10)),
                          color: Colors.blueGrey[900]
                        ),
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Wrap(
                                  alignment: WrapAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius:BorderRadius.all(Radius.circular(5)),
                                        color: Colors.white
                                      ),
                                      padding: EdgeInsets.all(15),
                                      child: Image(
                                        width: 75,
                                        image: AssetImage("assets/images/producten/" + products[index]['image']),
                                      ),
                                    ),
                                    Container(
                                      height: 110,
                                      width: 170,
                                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                      alignment: Alignment.centerLeft,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget> [
                                          Text(products[index]["name"], style: 
                                            TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          Text(products[index]['ail']+" | Plank: "+products[index]['plank'], style: 
                                            TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ]
                                      ),
                                    ),
                                    Container(
                                      width: 90,
                                      alignment: Alignment.centerRight,
                                      height: 110,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: <Widget>[
                                          Text('€ ' + products[index]['price'], 
                                          textAlign: TextAlign.right,
                                          style: 
                                            TextStyle(
                                              fontSize: 20.0,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ]
                                      )
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  SizedBox(
                                    width: 310,
                                    height: 45,
                                    child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      color: Colors.blue,
                                      child: Text('Navigate to product'.toUpperCase(), style: 
                                        TextStyle(
                                          color: Colors.white,
                                        )
                                      ,),
                                      onPressed: () {
                                         if(Platform.isAndroid) {
                                          Navigator.push(context, 
                                            MaterialPageRoute(
                                              builder: (context) => ArCoreNavigator(
                                                data: products[index],
                                                latitude: products[index]['latitude'],
                                                longitude: products[index]['longitude'],
                                              )
                                            )
                                          );
                                        }else if (Platform.isIOS) {
                                          Navigator.push(context, 
                                            MaterialPageRoute(
                                              builder: (context) => ArKitNavigator() 
                                            )
                                          );
                                        }
                                      }
                                    ),
                                  ),
                                  SizedBox(
                                    width: 50,
                                    height: 45,
                                    child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      padding: EdgeInsets.all(0),
                                      color: Colors.red,
                                      child: Icon(Icons.delete_forever_rounded, color: Colors.white),   
                                      onPressed: () {
                                        _removePrice(index, products[index]["price"]);
                                        _removeProduct(products[index]);
                                      }
                                    ),
                                  )
                                ]
                              ),
                            )
                          ],
                        )
                      )
                    ],
                  );
                },
                itemCount: products == null ? 0 : products.length,
              )
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
                    backgroundColor: Colors.blueGrey[600],
                    child: Icon(Icons.add_rounded,
                      size: 35
                    ),
                    onPressed: (){
                      _printPrices();
                      _awaitReturnProducts(context);
                    }
                  ),
                ),
              ),

              // Container(
              //   padding: EdgeInsets.fromLTRB(10, 0, 10, 20),
              //   // child: ClipRRect(
              //   //   borderRadius: BorderRadius.all(Radius.circular(50)),
              //   //   child: 
              //   // ),
              //   child: SizedBox(
              //     width: MediaQuery.of(context).size.width,
              //     child: RaisedButton(
              //       color: color,
              //       padding: EdgeInsets.all(20),
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(10),
              //       ),
              //       onPressed: () {
              //         if(products.length == 0){
              //           color = Colors.transparent;
              //           textColor = Colors.transparent;
              //           return null;
              //         } else {
              //           color = Colors.blue;
              //           textColor = Colors.white;
              //           if(Platform.isAndroid) {
              //             Navigator.push(context, 
              //               MaterialPageRoute(
              //                 builder: (context) => ArCoreNavigator()
              //               )
              //             );
              //           }else if (Platform.isIOS) {
              //             Navigator.push(context, 
              //               MaterialPageRoute(
              //                 builder: (context) => ArKitNavigator() 
              //               )
              //             );
              //           }
              //         }
              //       },
              //       child: Text('Start met winkelen'.toUpperCase(), style: 
              //         TextStyle(
              //           color: Colors.white
              //         ),
              //       )
              //     ),
              //   )
              // ),
            ],
          ),
        ],  
      ),
    );
  }
  void _awaitReturnProducts(BuildContext context) async {
    final data = await Navigator.push(context, 
      MaterialPageRoute(
        builder: (context) => AddProductsView()
      )
    );
    
    setState(() {
      if(data != null) {

        products.add(data);

        String price = data["price"];
        var changeKomma = price.replaceFirst(",", ".");
        print(changeKomma);
        
        var doublePrice = double.parse(changeKomma);
        prices.add(doublePrice);
      } else {
        print("er zijn geen producten toegevoegd");
      }

      _updatePrices();
    });
  }

  void _removeProduct(product){
    setState(() {
      products.remove(product);
    });
  }
}