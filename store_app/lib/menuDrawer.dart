import 'package:flutter/material.dart';
import 'package:store_app/homepage.dart';
import 'package:store_app/searchPage.dart';
import 'package:store_app/sellPage.dart';
import 'package:store_app/settingsPage.dart';

import 'aboutUsPage.dart';
import 'contactUsPage.dart';

class MenuDrawer extends StatefulWidget {
  MenuDrawer({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MenuDrawerState createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(''),
              decoration: BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage('assets/images/movieLogo.png'),
                  fit: BoxFit.cover,
                ),
                color: Colors.green,
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage(title: 'Homepage')),
                );
              }
            ),
            ListTile(
              title: Text('Search'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchPage(title: 'Search')),
                );
              }
            ),
            ListTile(
              title: Text('Sell'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SellPage(title: 'Sell')),
                );
              }
            ),
            ListTile(
              title: Text('About Us'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutUsPage(title: 'About Us')),
                );
              }
            ),
            ListTile(
              title: Text('Contact Us'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContactUsPage(title: 'Contact Us')),
                );
              }
            ),
            ListTile(
              title: Text('Setting'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage(title: 'Settings')),
                );
              }
            ),
          ],
        ),
    );
  }
}