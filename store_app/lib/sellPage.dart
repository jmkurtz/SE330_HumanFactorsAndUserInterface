import 'package:flutter/material.dart';
import 'package:store_app/Widgets/menuDrawer.dart';

class SellPage extends StatefulWidget {
  SellPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _SellPageState createState() => _SellPageState();
}

class _SellPageState extends State<SellPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title)
      ),
      body: Center(
        child: Column(
        ),
      ),
      drawer: MenuDrawer()
    );
  }
}