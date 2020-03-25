import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_app/Widgets/menuDrawer.dart';


class PromoView extends StatefulWidget{
  PromoView({Key key}) : super(key: key);
  
  @override
  _PromoViewState createState() => _PromoViewState();
}


class _PromoViewState extends State<PromoView>{

  final _formKey = new GlobalKey<FormState>();

  String _activePromo = "None";
  bool _hasPromo = false;

  _submit(){
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
    }
  }

  // Widget Declarations
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

@override 
  Widget build(BuildContext context){
    return _validationText();
  }
  // @override 
  // Widget build(BuildContext context){
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text(widget.title)
  //     ),
  //     body: Center(
  //       child: Column(
  //         children: [
  //           new Container(
  //             width: double.infinity,
  //             height: 500,
  //             child: _validationText(),
  //           ),
  //         ]
  //       ),
  //     ),
  //   );
  
}

