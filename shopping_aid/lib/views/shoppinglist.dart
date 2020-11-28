import 'package:flutter/material.dart';
import 'allproducts.dart';

// ignore: must_be_immutable
class ShoppingListView extends StatelessWidget{
  var data;

  ShoppingListView({this.data});
  
  void printData() {
    print(data);
  }
  
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
              child: ListView.builder(
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
                            title: Text(data[index]["name"], style: 
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
                      ] 
                    )
                  );
                },
                itemCount: data  == null ? 0 : data.length,
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
                    child: Icon(Icons.local_activity),
                    // onPressed: (){
                    //   _productsOverlay(context);
                    // }
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AllProductsView()),
                      );
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
    );
  }
}

// class  extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
      
//     );
//   }
// }