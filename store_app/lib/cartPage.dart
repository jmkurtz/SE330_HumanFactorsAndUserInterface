import 'dart:math';

import 'package:flutter/material.dart';
import 'package:store_app/Helpers/databaseHelper.dart';
import 'package:store_app/Widgets/menuDrawer.dart';

import 'Helpers/itemModel.dart';
import 'billingPage.dart';

class CartPage extends StatefulWidget {
  CartPage({Key key, @required this.title}) : super(key: key);

  final String title;

  @override
  _CartPageState createState() => _CartPageState();
}


class _CartPageState extends State<CartPage> {
  
  List<Item> cartItems;
  var database = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
          Container(
            child: RaisedButton(
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BillingPage(title: 'Billing', totalPrice: '\$10.23',)),);
              },
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              child: Text('Confirm Purchase'),
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
                        Item item = snapshot.data[index];
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
    cartItems = await database.getCartItems();
    return cartItems;
  }
  
  void _insert() async {
    var inItem = new Item(
      itemName: "Sonic Poster",
      unitPrice: 14.99,
      quantity: Random().nextInt(20),
      description: "Sonic tries to navigate the complexities of life on Earth with his newfound best friend -- a human named Tom Wachowski. They must soon join forces to prevent the evil Dr. Robotnik from capturing Sonic and using his powers for world domination.",
      genre: 'action',
      isVerified: true,
      isUsed: false,
      imagePath: "assets/posters/sonic_the_hedgehog.jpg",
    );

    database.insertItem(inItem);
  }

  void _deleteAll() async {
    List<Item> items = await DatabaseHelper.instance.getCartItems();

    for (int i =0; i < items.length; i++) {
      database.deleteItemByItem(items[i]);
    }
  }

}

