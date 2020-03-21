import 'package:flutter/material.dart';
import 'package:store_app/Helpers/mockData.dart';
import 'package:store_app/Widgets/itemView.dart';
import 'package:store_app/Widgets/menuDrawer.dart';

import 'Helpers/itemModel.dart';
import 'cartPage.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key, @required this.title}) : super(key: key);

  final String title;

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Widget getTextWidget(List<Item> items){
    return new Row(children: items.map((item) => new Text(item.itemName)).toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[IconButton(icon: Icon(Icons.shopping_cart), onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage(title: 'Shopping Cart')));},),],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              for(var item in MockData.items) new ItemView(item: item, showDescription: true,)
            ],
          ),
        ),
      ),
      drawer: MenuDrawer()
    );
  }
}