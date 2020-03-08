import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:store_app/Helpers/notificationHelper.dart';
import 'package:store_app/Widgets/menuDrawer.dart';
import 'package:store_app/confirmationPage.dart';

import 'homePage.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title)
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            new Container(
              width: 325,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Purchase Confirmation Notifications'),
                  Switch(
                    value: notificationsHelper.notificationsOnOff,
                    onChanged: (value) {
                      setState(() {
                        notificationsHelper.notificationsOnOff = value;
                      });
                    },
                    activeTrackColor: Theme.of(context).primaryColor,
                    activeColor: Colors.lightGreen,
                  )
                ]
              ),
            ),
            new Container(
              width: 325,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Scheduled Notifications'),
                  Switch(
                    value: notificationsHelper.scheduled,
                    onChanged: (value) {
                      setState(() {
                        notificationsHelper.scheduled = value;
                      });
                    },
                    activeTrackColor: Theme.of(context).primaryColor,
                    activeColor: Colors.lightGreen,
                  )
                ]
              ),
            )
          ]
        ),
      ),
      drawer: MenuDrawer()
    );
  }
}