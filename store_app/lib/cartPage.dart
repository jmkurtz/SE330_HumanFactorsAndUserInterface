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

  String cartPriceString;
  Color priceColor = Colors.black;

  int quantityUpdate = 1;
  
  bool discountActivated = false;
  double cartTotal = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Container(
            child: _validationText(),
          ),
           new Divider(
            thickness: 1,
            indent: 20,
            endIndent: 20,
            color: Colors.black87,
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
                          onTap: () {
                            setState(() {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("Change quantity?"),
                                    content: dialogContents(item),
                                    actions: <Widget>[
                                      FlatButton(
                                        child: Text("OK"),
                                        onPressed: () {
                                          editSubmit(item, quantityUpdate);
                                          
                                          Navigator.of(context).pop();

                                          setState(() {
                                            _updateCart();
                                          });
                                        },
                                      ),
                                    ],
                                  );
                                }
                              );
                            });
                          },
                          trailing: IconButton(icon: Icon(Icons.delete), onPressed: () {
                            database.deleteItemById(item.id);
                            setState(() {
                              log(cartTotal);
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
          Container(
            color: Colors.grey[300],
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    //child: Text( "\$ $cartTotal", style: TextStyle(fontSize: 24)),
                    child: FutureBuilder(
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return Text( "\$ $cartPriceString", style: TextStyle(fontSize: 24, color: priceColor));
                        }
                        else {
                          return Center(
                            child: new CircularProgressIndicator(),
                          );
                        }
                      },
                      future: _updateCart(),
                    ),
                    padding: EdgeInsets.all(10),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => BillingPage(title: 'Billing', totalPrice: cartTotal,)),);
                      },
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      child: Text('Confirm Purchase'),
                      ),
                    padding: EdgeInsets.all(10),
                  ),
                ),
              ]
            ),
          ),
          
        ],
      ),
      drawer: MenuDrawer()
    );
  }

  Container dialogContents(Item item) {
    return Container(
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Quantity",
        ),
        keyboardType: TextInputType.number,
        onChanged: (String value) {
          setState(() {
            quantityUpdate = int.parse(value);
          });
        },
      ),
    );
  }

  void editSubmit(Item item, int newValue) {
    Item updatedItem = new Item(
      id: item.id,
      itemName: item.itemName,
      unitPrice: item.unitPrice,
      quantity: newValue,
      description: item.description,
      genre: item.genre,
      isUsed: item.isUsed,
      isVerified: item.isVerified,
      imagePath: item.imagePath,
    );

    database.insertItem(updatedItem);
    _updateCart();
  }

  Future _updateCart() async {
    cartItems = await database.getCartItems();
    
    double discount = .85;
    priceColor = Colors.black;

    cartTotal = 0;
    for (int i = 0; i < cartItems.length; i++) {
        cartTotal += cartItems[i].unitPrice * cartItems[i].quantity;
    }
    log(cartTotal);

    if (discountActivated) {
      cartTotal = cartTotal * discount;
      priceColor = Colors.green;
    }

    cartPriceString = cartTotal.toStringAsFixed(2);

    return cartItems;
  }

  final _formKey = new GlobalKey<FormState>();

  String _activePromo = "None";
  bool _hasPromo = false;

  _submit(){
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
    }
  }

  Widget _validationText(){
    return new Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left:15, top:10,bottom: 5),
              child: new Align(
                alignment: Alignment.centerLeft,
                child: new Text.rich(
                  TextSpan(
                    text:  'Active Discount: ',
                    children: <TextSpan>[
                      TextSpan(
                        text: '$_activePromo', 
                        style: _hasPromo 
                         ? TextStyle( fontWeight: FontWeight.bold, color: Colors.green)
                         : TextStyle( fontWeight: FontWeight.normal, color: Colors.grey)
                      ),
                    ]
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Container(
              height: 25,
              width: 25,
              margin: EdgeInsets.only(top:10, right: 10),
              child: 
                new FloatingActionButton(
                  heroTag: "RemovePromo",
                  onPressed: () {
                    setState(() {
                      _hasPromo = false;
                      _activePromo = "None";
                      discountActivated = false;
                    });
                  },
                  child: new Icon(Icons.remove),
                  backgroundColor: Colors.red,
                ),
            ),
          ],
        ),
        new Divider(
          thickness: 1,
          indent: 20,
          endIndent: 20,
        ),
        new Row(
          children: <Widget>[
            new Expanded(
              child: new Form( 
                key: _formKey,
                child: new Container(
                  height: 50,
                  margin: EdgeInsets.only(left:10, right: 10, bottom: 10, top: 5),
                  child: new TextFormField(
                    decoration: new InputDecoration(
                      labelText: "Promo Code:",
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0), borderSide: BorderSide(),
                        ),
                    ),
                    validator: (val){ 
                      if(val == "Trevor15"){
                        setState(() {
                          _hasPromo = true;
                          _activePromo = val;
                          discountActivated = true;
                        });
                        return null;
                      }
                      else{
                        return "The promotional code you entered is not valid.";
                      }
                 
                    },
                  ),
                ),
              ),
            ),
            new Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(right: 10),
              height: 30,
              width: 30,
              child: 
                new FloatingActionButton(
                  heroTag: "AddPromo",
                  onPressed: () {
                    _submit();
                  },
                  child: new Icon(Icons.check)
                ),
            ),
          ]
        ),
      ]
    );
  }

}

