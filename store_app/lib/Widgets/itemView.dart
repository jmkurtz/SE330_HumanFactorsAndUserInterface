import 'package:flutter/material.dart';
import 'package:store_app/Helpers/itemModel.dart';
import 'package:store_app/Helpers/mockData.dart';

class ItemView extends StatefulWidget {
  ItemView({Key key, @required this.item, this.showDescription = false}) : super(key: key);
  
  final bool showDescription;
  final Item item;

  @override
  _ItemViewState createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        if(widget.showDescription == true){
          showDialog(
            context: context,
            child: new AlertDialog(
              content: new SingleChildScrollView(
                child: new Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Center(
                        child: Text(widget.item.itemName, 
                        style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                      )
                    ),
                    new Container(
                      padding: EdgeInsets.all(8),
                      child: new Image(
                        image: new AssetImage(widget.item.imagePath),
                        height: 300,
                        width: 150,
                      ),
                    ),
                    new Text('\$' + widget.item.unitPrice.toString(),
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    new Text(widget.item.description),
                    new Text('Genre: ' + widget.item.genre),
                    new Text('Condition: ' + (widget.item.isUsed ? 'Used' : 'New'))
                  ],
                )
              ),
              actions: <Widget>[
                new FlatButton(
                  onPressed: () {
                    MockData.shoppingCart.add(widget.item.id);
                    Navigator.of(context).pop();
                  },
                  textColor: Theme.of(context).primaryColor,
                  child: new Row(
                    children: <Widget>[
                      new Icon(Icons.shopping_cart),
                      const Text('Add to Cart'),
                    ],
                  ),
                ),
              ],
            ),
          )
        }
      },
      child: Column(
        children: <Widget>[
          Center(
            child: Container(
              width: 395,
              height: 205,
              child: Row(
                children: <Widget>[
                  new Flexible(
                    child: new Padding(
                      padding: EdgeInsets.only(left: 50, right: 10),
                      child: Image(
                        image: new AssetImage(widget.item.imagePath),
                        height: 270,
                        width: 125,
                      ),
                    )
                  ),
                  new Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text(
                          widget.item.itemName,
                          overflow: TextOverflow.fade, 
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        new Text('Genre: ' + widget.item.genre),
                        new Text('Price: ' + widget.item.unitPrice.toString()),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Divider(thickness: 1,indent: 10,endIndent: 10,),
          new Padding(padding: EdgeInsets.only(bottom: 10),)
        ],
      ),
    );
  }
}