import 'package:flutter/material.dart';
import 'package:store_app/Widgets/menuDrawer.dart';

import 'cartPage.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key, @required this.title}) : super(key: key);

  final String title;

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

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