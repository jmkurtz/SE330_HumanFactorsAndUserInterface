import 'package:flutter/material.dart';
import 'package:store_app/Widgets/menuDrawer.dart';
import 'package:store_app/shippingPage.dart';

import 'Widgets/Inputs/descriptionBox.dart';
import 'Widgets/Inputs/emailBox.dart';
import 'Widgets/Inputs/inputBox.dart';
import 'homePage.dart';

class BillingPage extends StatefulWidget {
  BillingPage({Key key, @required this.totalPrice, @required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  final double totalPrice;

  @override
  _BillingPageState createState() => _BillingPageState();
}

class _BillingPageState extends State<BillingPage> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    String price = widget.totalPrice.toStringAsFixed(2);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title)
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Image(
                    image: new AssetImage('assets/images/billing.png')
                  ),
                  new Container(width: 325, child: new Text(
                      '___________________________________________________', textAlign: TextAlign.center,),),
                  new Padding(padding: EdgeInsets.only(top: 5),),
                  new Container( width: 325, child: new Text(
                      'Your total is \$${price}',  textAlign: TextAlign.center,),),
                  new Container( width: 325, child: new Text(
                      'Please enter your billing information',  textAlign: TextAlign.center,),),
                  new Container( width: 325, child: new Text(
                      '___________________________________________________', textAlign: TextAlign.center,),),
                  new Padding(padding: EdgeInsets.only(top: 30),),
                  new Container( width: 325, child: 
                    new TextFormField(
                      decoration: new InputDecoration(labelText: 'Name', hintText: 'Enter the name', fillColor: Colors.white,
                        border: new OutlineInputBorder(borderRadius: new BorderRadius.circular(25.0), borderSide: BorderSide(),),),
                      validator: (value) {
                        if(value.isEmpty){
                          return 'Please enter the name on the card';
                        }
                        return null;
                      },
                    )
                  ),
                  new Padding(padding: EdgeInsets.only(top: 30),),
                  new Container( width: 325, child: 
                    new TextFormField(
                      decoration: new InputDecoration(labelText: 'Card No.', hintText: 'Enter your credit card number', fillColor: Colors.white,
                        border: new OutlineInputBorder(borderRadius: new BorderRadius.circular(25.0), borderSide: BorderSide(),),),
                      validator: (value) {
                        if(value.isEmpty || value.length != 16){
                          return "Please enter a valid credit card number";
                        }
                        return null;
                      },
                      maxLength: 16,
                      keyboardType: TextInputType.number,
                    )
                  ),
                  new Padding(padding: EdgeInsets.only(top: 15),),
                  new Container( width: 325, child: 
                    new TextFormField(
                      decoration: new InputDecoration(labelText: 'CVV', hintText: 'Enter your CVV number', fillColor: Colors.white,
                        border: new OutlineInputBorder(borderRadius: new BorderRadius.circular(25.0), borderSide: BorderSide(),),),
                      validator: (value) {
                        if(value.isEmpty || value.length != 3){
                          return 'Please enter in a valid CVV';
                        }
                        return null;
                      },
                      maxLength: 3,
                      keyboardType: TextInputType.number,
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric( vertical: 16.0 ),
                    child: RaisedButton(
                      onPressed:() async{
                        if(_formKey.currentState.validate()){
                          Navigator.push(context,MaterialPageRoute(builder: (context) => ShippingPage(title: 'Shipping', totalPrice: '\$${price}',)),);
                        }
                      },
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      child: Text('Next'),
                    ),
                  ),
                  Container(
                    child: Text("Copyright 2020 - Movie Poster Unlimited", style: TextStyle(fontSize: 14, color: Colors.grey),),
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                  ),
                ],
              ),
            ),
          ),
      ),
      drawer: MenuDrawer()
    );
  }
}