import 'package:flutter/material.dart';
import 'package:store_app/homepage.dart';
import 'package:store_app/searchPage.dart';
import 'package:store_app/sellPage.dart';
import 'package:store_app/settingsPage.dart';
//import 'package:store_app/promoPage.dart';

import '../aboutUsPage.dart';
import '../contactUsPage.dart';

class MenuDrawer extends StatefulWidget {
  MenuDrawer({Key key}) : super(key: key);
  
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
                  image: new AssetImage('assets/images/movieLogo.PNG'),
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
            // ListTile(
            //   title: Text('Promotions'),
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => PromoPage(title: 'Promotions')),
            //     );
            //   }
            // ),
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
              title: Text('Settings'),
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