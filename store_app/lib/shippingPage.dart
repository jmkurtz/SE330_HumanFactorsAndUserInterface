import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:store_app/Widgets/menuDrawer.dart';

import 'Helpers/notificationHelper.dart';
import 'Widgets/Inputs/descriptionBox.dart';
import 'Widgets/Inputs/emailBox.dart';
import 'Widgets/Inputs/inputBox.dart';
import 'confirmationPage.dart';
import 'homePage.dart';

class ShippingPage extends StatefulWidget {
  ShippingPage({Key key, @required this.payload, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  final String payload;

  @override
  _ShippingPageState createState() => _ShippingPageState();
}

class _ShippingPageState extends State<ShippingPage> {
  final notifications = FlutterLocalNotificationsPlugin();
  final notificationsHelper = NotificationsHelper();
    
  @override
  void initState() {
    super.initState();

    final settingAndroid = AndroidInitializationSettings('app_icon');
    final settingIOS = IOSInitializationSettings(
      onDidReceiveLocalNotification: (id, title, body, payload) =>
        onSelectNotification(payload));

    notifications.initialize(
      InitializationSettings(settingAndroid, settingIOS),
      onSelectNotification: onSelectNotification);
  }
  Future onSelectNotification(String payload) => Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ConfirmationPage(title: 'Confirmation Page')),
  );

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title)
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Image(
                    image: new AssetImage('assets/images/shipping.jpg')
                  ),
                  new Container(width: 325, child: new Text(
                      '___________________________________________________', textAlign: TextAlign.center,),),
                  new Padding(padding: EdgeInsets.only(top: 5),),
                  new Container( width: 325, child: new Text(
                      'Please fill out your shipping information',  textAlign: TextAlign.center,),),
                  new Container( width: 325, child: new Text(
                      '___________________________________________________', textAlign: TextAlign.center,),),
                  new Padding(padding: EdgeInsets.only(top: 30),),
                  InputBox(
                    hintText: "Enter your name", 
                    labelText: "Name", 
                    errorText: "Please enter in a name",
                  ),
                  new Padding(padding: EdgeInsets.only(top: 30),),
                  InputBox(
                    hintText: "Enter your address", 
                    labelText: "Address", 
                    errorText: "Please enter in a valid address",
                  ),
                  new Padding(padding: EdgeInsets.only(top: 30),),
                  InputBox(
                    hintText: "Enter the city", 
                    labelText: "City", 
                    errorText: "Please enter a city",
                  ),
                  new Padding(padding: EdgeInsets.only(top: 30),),
                  InputBox(
                    hintText: "Enter the state", 
                    labelText: "State", 
                    errorText: "Please enter a state",
                  ),
                  new Padding(padding: EdgeInsets.only(top: 30),),
                  InputBox(
                    hintText: "Enter the zip code", 
                    labelText: "Zip Code", 
                    errorText: "Please enter a zip code",
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric( vertical: 16.0 ),
                    child: RaisedButton(
                      onPressed: () {
                        notificationsHelper.showOngoingNotification(notifications, title: 'Purchase Confirmation', body: 'Your purchase total is ${widget.payload}.');
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ConfirmationPage(title: 'Confirmation')),
                        );
                      },
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      child: Text('Confirm'),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ),
      drawer: MenuDrawer()
    );
  }
}