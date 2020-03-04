import 'dart:math';

import 'package:flutter/material.dart';
import 'package:store_app/databaseHelper.dart';
import 'package:store_app/menuDrawer.dart';

class CartPage extends StatefulWidget {
  CartPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;


  @override
  _CartPageState createState() => _CartPageState();
}


class _CartPageState extends State<CartPage> {
  
  List<CartItem> cartItems;
  var database = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title)
      ),
      body: Column(
        children: [
          Container(
            child: RaisedButton(
              onPressed: () {
                _insert();
                setState(() {
                  _updateCart();
                });
              },
              child: Text('Insert', style: TextStyle(fontSize: 16),),
            ),
          ),
          Expanded(
            child: 
              FutureBuilder(
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        CartItem item = snapshot.data[index];
                        return ListTile(
                          leading: Image(image: new AssetImage(item.imagePath)),
                          title: Text(item.itemName, style: TextStyle(fontSize: 24),),
                          subtitle: Text("Price: ${item.unitPrice} x ${item.quantity}", style: TextStyle(fontSize: 18),),
                          trailing: IconButton(icon: Icon(Icons.delete), onPressed: () {
                            database.deleteItemById(item.id);
                            setState(() {
                              _updateCart();
                            });
                          }),
                        );
                      },
                    );
                  }
                  else {
                    return Center(
                      child: new CircularProgressIndicator(),
                    );
                  }
                },
                future: _updateCart(),
              ),
          ),
        ],
        
      ),

      
      drawer: MenuDrawer()

      
    );
  }

  Future _updateCart() async {
    cartItems = await database.getCart();
    return cartItems;
  }
  
  void _insert() async {
    var inItem = new CartItem(
      itemName: "Sonic Poster",
      unitPrice: 14.99,
      quantity: Random().nextInt(20),
      imagePath: "assets/posters/sonicthehedgehogposter.jpg",
    );

    database.insertItem(inItem);
    //cartItems = await database.getCart();
  }

  void _deleteAll() async {
    List<CartItem> items = await DatabaseHelper.instance.getCart();

    for (int i =0; i < items.length; i++) {
      database.deleteItemByItem(items[i]);
    }
  }

}
