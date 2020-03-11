import 'package:flutter/material.dart';
import 'package:store_app/Widgets/menuDrawer.dart';

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