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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Container( // Main image
                child: Image(
                  image: new AssetImage('assets/images/movieLogo.PNG'),
                  fit: BoxFit.scaleDown,
                ),
                padding: EdgeInsets.fromLTRB(20, 30, 20, 80),
              ),
              Container( // Our Beginning Text
                child: Text("OUR BEGINNING", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                padding: EdgeInsets.fromLTRB(20, 0, 20, 30),
              ),
              Container( // Beginning body
                child: Text(
                  "Founded in 2010 by a young boy named Jeffery Kurtz. His dream was to provide high qulaity movie posters to people across the world. The company's mission is to give every child an opportunity to own a post of their favorite movie.", 
                  style: TextStyle(fontSize: 18, ), textAlign: TextAlign.center,),
                padding: EdgeInsets.fromLTRB(20, 0, 20, 100),
              ),
              Container(
                child: Text("Jeff Kurtz", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
              ),
              Container(
                child: Text("CEO", style: TextStyle(fontSize: 24),),
                padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
              ),
              Container( // Main image
                child: Image(
                  image: new AssetImage('assets/images/Jeffff.PNG'),
                  fit: BoxFit.scaleDown,
                ),
                padding: EdgeInsets.fromLTRB(20, 0, 20, 80),
              ),
              Container(
                child: Text("Conner Jurrens", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
              ),
              Container(
                child: Text("CFO", style: TextStyle(fontSize: 24),),
                padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
              ),
              Container( // Main image
                child: Image(
                  image: new AssetImage('assets/images/Conner.jpg'),
                  fit: BoxFit.scaleDown,
                ),
                padding: EdgeInsets.fromLTRB(20, 0, 20, 80),
              ),
              Container(
                child: Text("Trevor Lambert", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
              ),
              Container(
                child: Text("Lead Software Developer", style: TextStyle(fontSize: 24),),
                padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
              ),
              Container( // Main image
                child: Image(
                  image: new AssetImage('assets/images/Trevor.PNG'),
                  fit: BoxFit.scaleDown,
                ),
                padding: EdgeInsets.fromLTRB(20, 0, 20, 80),
              ),
              Container(
                child: Text("Philip Zamora", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
              ),
              Container(
                child: Text("Janitor", style: TextStyle(fontSize: 24),),
                padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
              ),
              Container( // Main image
                child: Image(
                  image: new AssetImage('assets/images/Phillip.PNG'),
                  fit: BoxFit.scaleDown,
                ),
                padding: EdgeInsets.fromLTRB(20, 0, 20, 80),
              ),
              Container(
                child: Text("Copyright 2020 - Movie Poster Unlimited", style: TextStyle(fontSize: 14, color: Colors.grey),),
                padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
              ),
            ],
          ),
        ),
      ), 
        
      drawer: MenuDrawer()
    );
  }
}