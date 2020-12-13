import 'package:flutter/material.dart';
import 'addproducts.dart';
import 'navigator_android.dart';
import 'navigator_ios.dart';
import 'dart:io' show Platform;


class ShoppingListView extends StatefulWidget{
  

  // ShoppingListView({this.data});
  // void printData() {
  //   print(data);
  // }
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
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Container(
              child: 
              ListView.builder(
                itemBuilder: (BuildContext context, int index){
                  return(
                    Column(
                      children: <Widget> [
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Card(  
                          color: Colors.blueGrey[900],
                          child: ListTile(
                            leading: FlutterLogo(size: 56.0),
                            title: Text(products[index]["name"], style: 
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
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(products[index]['price'], style: 
                                        TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.delete_forever_rounded, color: Colors.red),    
                                    onPressed: () {
                                      _removePrice(index, products[index]["price"]);
                                      _removeProduct(products[index]);
                                    }
                                  )
                                ],
                              ),    
                            ) 
                          )
                        ),
                      ] 
                    )
                  );
                },
                itemCount: products  == null ? 0 : products.length,
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

              Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 20),
                // child: ClipRRect(
                //   borderRadius: BorderRadius.all(Radius.circular(50)),
                //   child: 
                // ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: RaisedButton(
                    color: color,
                    padding: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onPressed: () {
                      if(products.length == 0){
                        color = Colors.transparent;
                        textColor = Colors.transparent;
                        return null;
                      } else {
                        color = Colors.blue;
                        textColor = Colors.white;
                        if(Platform.isAndroid) {
                          Navigator.push(context, 
                            MaterialPageRoute(
                              builder: (context) => ArCoreNavigator(data: products)
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
                    },
                    child: Text('Start met winkelen'.toUpperCase(), style: 
                      TextStyle(
                        color: Colors.white
                      ),
                    )
                  ),
                )
              ),
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
    });
  }

  void _removeProduct(product){
    setState(() {
      products.remove(product);
    });
  }
}