import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:store_app/Helpers/notificationHelper.dart';
import 'package:store_app/Widgets/menuDrawer.dart';
import 'package:store_app/confirmationPage.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key, @required this.title}) : super(key: key);

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
                    value: NotificationsHelper.notificationsOnOff,
                    onChanged: (value) {
                      setState(() {
                        NotificationsHelper.notificationsOnOff = value;
                      });
                    },
                    activeTrackColor: Theme.of(context).primaryColor,
                    activeColor: Colors.lightGreen,
                  )
                ]
              ),
            ),
          ]
        ),
      ),
      drawer: MenuDrawer()
    );
  }
}