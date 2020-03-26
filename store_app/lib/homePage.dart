import 'package:flutter/material.dart';
import 'package:store_app/Helpers/mockData.dart';
import 'package:store_app/Widgets/menuDrawer.dart';
import 'package:store_app/searchPage.dart';

import 'Widgets/itemView.dart';
import 'Widgets/newItemAdded.dart';
import 'aboutUsPage.dart';
import 'cartPage.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, @required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState(){
    MockData.seedMockData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[IconButton(icon: Icon(Icons.shopping_cart), onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage(title: 'Shopping Cart')));},),],
      ),
      body: new SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              new GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUsPage(title: 'About Us'))),
                child: new Image(image: new AssetImage('assets/images/movieLogo.png'),),
              ),
              new Padding(padding: EdgeInsets.only(top: 15),),
              new RaisedButton(
                onPressed: () => {
                  showDialog(
                    context: context, 
                    barrierDismissible: false,
                    builder: (context){
                    return AlertDialog(
                      title: Text("Success! Your poster is now listed"),
                      content: ItemView(item: MockData.items[0]),
                      actions: <Widget>[
                        FlatButton(
                          child: Text("Submit Updated"),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                      elevation: 24.0,
                    );
                  })
                },//Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage(title: 'Search'))),
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Icon(Icons.search),
                    const Text('Search Posters'),
                  ],
                ),
              ),
              new Padding(padding: EdgeInsets.only(top: 15),),
              new ItemView(item: MockData.items[30], showDescription: true,),
              new ItemView(item: MockData.items[31], showDescription: true,),
              new ItemView(item: MockData.items[34], showDescription: true,),
              new ItemView(item: MockData.items[35], showDescription: true,),
              new ItemView(item: MockData.items[40], showDescription: true,),
              new Padding(padding: EdgeInsets.only(top: 15),),
              new RaisedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage(title: 'Search'))),
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                child: new Text('More')
              ),
              new Padding(padding: EdgeInsets.only(top: 45),),
            ],
          ),
        ),
      ), 
      drawer: MenuDrawer()
    );
  }
}
