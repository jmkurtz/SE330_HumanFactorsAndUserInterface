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
   Icon cusIcon = Icon(Icons.search);
   Widget cusBarTitle= Text("");
  
  @override
  Widget build(BuildContext context) {
    this.cusBarTitle = Text(widget.title);
    return Scaffold(
      appBar: AppBar(
        title: cusBarTitle,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              showSearch(context: context, delegate: DataSearch());
             
            },
            ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () { 
              Navigator.push(
                context, MaterialPageRoute(
                  builder: (context) => CartPage(title: 'Shopping Cart'))
                  );
            },
          ),
        ], 
      ),  
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              for(var item in MockData.items) new ItemView(item: item, showDescription: true,),
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

class DataSearch extends SearchDelegate<String>{
  var selectedItem= new Item();
  @override
  List<Widget> buildActions(BuildContext context) {
    
    return [IconButton(icon: Icon(Icons.clear), onPressed: (){
      query="";
    })];
  }

  @override
  Widget buildLeading(BuildContext context) {
    
    
        return IconButton(
          icon: AnimatedIcon(icon: AnimatedIcons.menu_arrow, progress: transitionAnimation
          ),
          onPressed: (){
            close(context, null);
          },
      );
  }

  @override
  Widget buildResults(BuildContext context) {
    
    return Scaffold(       
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
               if(selectedItem.imagePath == null)
                  new Column(
                    children: <Widget>[
                      new Padding(padding: EdgeInsets.only(top: 30),),
                      Text("Does not exist"),
                    ])
               else
                  new ItemView(item: selectedItem, showDescription: true,)
              
            ],
          ),
        ),
      ),
      drawer: MenuDrawer()
    );
  }
  @override
  Widget buildSuggestions(BuildContext context) {
      var suggestionList = query.isEmpty
      ? MockData.tempItems
      : MockData.items.where((p)=>p.itemName.toLowerCase().startsWith(query.toLowerCase())).toList();
    return ListView.builder(itemBuilder: (context,index)=> ListTile(
      onTap: (){
        selectedItem = suggestionList.isEmpty ? null : suggestionList[index];
        showResults(context);
      }, 
      title: RichText(
        text: TextSpan(
          
          text: suggestionList[index].itemName.substring(0,query.length),
          style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold),
          children: [TextSpan(
            
            text: suggestionList[index].itemName.substring(query.length),
            style: TextStyle(color: Colors.grey))]
          )
        ),
      
      ),
      
      itemCount: suggestionList.length,
    );
  }
  
}
