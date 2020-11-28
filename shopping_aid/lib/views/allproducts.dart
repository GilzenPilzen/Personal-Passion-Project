import 'dart:convert';
import 'package:flutter/material.dart';


var myAddedProducts = [];

class AllProductsView extends StatefulWidget {

  @override
  _AllProductsViewState createState() => _AllProductsViewState();
}

class _AllProductsViewState extends State<AllProductsView> {
  final _searchKey = GlobalKey<FormState>();
  final _addProductKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[800],
        title: Padding(
          padding: EdgeInsets.fromLTRB(5, 15, 5, 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Products'),
            ] 
          ),
        ),
      ),

      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.blueGrey[700]),
            padding: EdgeInsets.fromLTRB(25, 15, 25, 15),
            margin: EdgeInsets.only(bottom: 25),
            child: Center(
              child: Form(
                key: _searchKey,
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(5),
                      child:Icon(Icons.search,
                      color: Colors.white,),
                    ),
                    Expanded(
                      child: TextFormField(
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent
                            )
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                        ),
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    )
                  ],
                )
              ),
            )
          ),
          
          Expanded(
            child: FutureBuilder(
              future: DefaultAssetBundle.of(context).loadString('assets/data/products.json'),
              builder: (context,snapshot) {
                var products = json.decode(snapshot.data.toString());
                // var price = double.parse(products[index][price"]);
                return (
                  ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      
                      //Products card
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.blueGrey[900],
                          borderRadius:BorderRadius.all(Radius.circular(20)),
                        ),
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        margin: EdgeInsets.fromLTRB(8, 0, 8, 15),
                        child: Center(
                          child: Row(
                            children: <Widget>[
                              // Image
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius:BorderRadius.all(Radius.circular(15)),
                                  color: Colors.white,
                                ),
                                padding: EdgeInsets.all(.8),
                                margin: EdgeInsets.only(right: 15),
                                child: Builder(
                                  builder: (context) => FlatButton(
                                    child: Image(
                                      width: 125,
                                      image: AssetImage("assets/images/cola.jpg"),
                                    ),
                                    onPressed: (){
                                      _productsOverlay(context, products[index], _addProductKey);
                                    }
                                  )
                                )
                              ),

                              //
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.only(top:15, bottom: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(products[index]["name"].toUpperCase(),
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        )
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 15, bottom: 25),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("€ "+products[index]["unitprice"],
                                              style: TextStyle(
                                                color: Colors.grey[500]
                                              )
                                            ),
                                            Text(products[index]["amount"]+" x "+products[index]["weight"]+" "+products[index]["unit"],
                                              style: TextStyle(
                                                color: Colors.grey[500]
                                              )
                                            ),
                                          ],  
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: <Widget>[
                                          Text("€ "+products[index]["price"],
                                            style: TextStyle(
                                              color:Colors.blue,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold
                                            ),
                                          )   
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )  
                            ]
                          ) 
                        )
                      );
                    },
                    itemCount: products == null ? 0 : products.length,
                  )
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


//PRODUCT DETAIL VIEW

void _productsOverlay(context, products, productKey) {
  var product = products;
  print(products);
  showModalBottomSheet(
    context: context, 
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),),
    isScrollControlled: true, 
    backgroundColor: Colors.grey[800],
    builder: (BuildContext bc) {
    
    return
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
              Container(
                decoration: BoxDecoration(
                  borderRadius:BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
                  color: Colors.grey[800],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 15, right: 15),
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
                                width: 150,
                                image: AssetImage("assets/images/cola.jpg"),
                              )
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(products["name"].toUpperCase(), 
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                  )
                                ),
                                Text("€ "+products["price"].toUpperCase(), 
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                  )
                                ),
                              ],
                            ),
                          ],
                        ) 
                      )
                    )
                  ],
                )
              ),
              Container(
                height: 350,
                child: Padding(
                  padding: const EdgeInsets.only(top: 25, bottom: 25),
                  child: Text('Yoo'),
                )
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.bottomCenter, 
                  child:Center(
                    child: SizedBox(
                      width: 330,
                      height: 60,
                    
                      child: RaisedButton(
                        color: Colors.blue,
                        padding: EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        textColor: Colors.white,
                        onPressed: () {
                          if(myAddedProducts.contains(product)){
                            print("Dit product zit al in de lijst");
                          }else {
                            myAddedProducts.add(product);
                          }
                          print(myAddedProducts);
                        }, 
                        child: Text("product toevoegen".toUpperCase(),
                        style: TextStyle(
                            fontSize: 16
                          ),
                        ),
                      ),
                    )
                  ),
                ),
              )
            ],
          )
        ),
      );
    }
  );
}
