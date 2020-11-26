import 'package:flutter/material.dart';

class AllProductsView extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

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
                key: _formKey,
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
            child: GridView.count(
              childAspectRatio: 16/7,
              crossAxisCount: 1,
              children: List.generate(3, (index) {
                return Container(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: _ProductQuickView()
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductQuickView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey[900],
        borderRadius:BorderRadius.all(Radius.circular(25)),
      ),
      padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
      margin: EdgeInsets.only(bottom: 15),
      child: Center(
        child: Row(
          children: <Widget>[
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
                  _productsOverlay(context);
                  }
                )
              )
            ),
            Padding(
              padding: const EdgeInsets.only(top:15, bottom: 10),
              child: Column(
                children: [
                  Text("Coco-Cola Light".toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    )
                  ),   
                ],
              ),
            )  
          ]
        ) 
      )
    );
  }
}

//PRODUCT DETAIL VIEW

void _productsOverlay(context) {
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
                      _ProductDetails(),
                    ],
                  )
                ),
              ]
          )
        ),
      );
    }
  );
}


class _ProductDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                Text("Coca-cola Light".toUpperCase(), 
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16
                  )
                ),
                Text("€12,34".toUpperCase(), 
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  )
                ),
                Text("€12,34".toUpperCase(), 
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  )
                ),
              ],
            ) // style:  
          ]
        ) 
      )
    );  
  }
}
