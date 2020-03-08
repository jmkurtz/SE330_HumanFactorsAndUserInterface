import 'package:flutter/material.dart';
import 'package:store_app/Widgets/menuDrawer.dart';
import 'package:store_app/homePage.dart';

class ConfirmationPage extends StatefulWidget {
  ConfirmationPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ConfirmationPageState createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title)
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('__________________________________________'),
            new Padding(padding: EdgeInsets.only(top: 5),),
            Text('Thank you for your purchase!'),
            Text('You order will arrive shortly'),
            Text('__________________________________________'),
            const SizedBox(height: 8),
            RaisedButton(
              child: Text('Home'),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(title: 'Homepage'))),
            )
          ]
        ),
      ),
      drawer: MenuDrawer()
    );
  }
}