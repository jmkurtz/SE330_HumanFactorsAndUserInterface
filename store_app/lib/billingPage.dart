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
  final String totalPrice;

  @override
  _BillingPageState createState() => _BillingPageState();
}

class _BillingPageState extends State<BillingPage> {

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
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
                      'Your total is ${widget.totalPrice}',  textAlign: TextAlign.center,),),
                  new Container( width: 325, child: new Text(
                      'Please enter your billing information',  textAlign: TextAlign.center,),),
                  new Container( width: 325, child: new Text(
                      '___________________________________________________', textAlign: TextAlign.center,),),
                  new Padding(padding: EdgeInsets.only(top: 30),),
                  InputBox(
                    hintText: "Enter the name", 
                    labelText: "Name", 
                    errorText: "Please enter the name on the card",
                  ),
                  new Padding(padding: EdgeInsets.only(top: 30),),
                  InputBox(
                    hintText: "Enter your credit card number", 
                    labelText: "Card No.", 
                    errorText: "Please enter in a credit card number",
                  ),
                  new Padding(padding: EdgeInsets.only(top: 30),),
                  InputBox(
                    hintText: "Enter your CVV number", 
                    labelText: "CVV", 
                    errorText: "Please enter in a valid CVV",
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric( vertical: 16.0 ),
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ShippingPage(title: 'Shipping', totalPrice: '\$10.23',)),
                        );
                      },
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      child: Text('Next'),
                    ),
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