import 'package:flutter/material.dart';
import 'package:store_app/Widgets/menuDrawer.dart';

import 'cartPage.dart';

class AboutUsPage extends StatefulWidget {
  AboutUsPage({Key key, @required this.title}) : super(key: key);
  final String title;

  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[IconButton(icon: Icon(Icons.shopping_cart), onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage(title: 'Shopping Cart')));},),],
      ),
      body: Center(
        child: Column(
        ),
      ),
      drawer: MenuDrawer()
    );
  }
}