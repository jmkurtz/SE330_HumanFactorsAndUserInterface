import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

NotificationDetails get _ongoing {
  final androidChannelSpecifics = AndroidNotificationDetails(
    'your channel id',
    'your channel name',
    'your channel description',
    importance: Importance.Max,
    priority: Priority.High,
    ongoing: true,
    autoCancel: false,
  );
  final iOSChannelSpecifics = IOSNotificationDetails();
  return NotificationDetails(androidChannelSpecifics, iOSChannelSpecifics);
}

class NotificationsHelper{
  
  static var notificationsOnOff = true;
  static var scheduledOnOff = true;

  Future showOngoingNotification(
    FlutterLocalNotificationsPlugin notifications, {
      @required String title,
      @required String body,
      int id = 0,
    }) => notificationsOnOff ? _showNotification(notifications, title: title, body: body, id: id, type: _ongoing) : null;

  Future _showNotification(
    FlutterLocalNotificationsPlugin notifications, {
      @required String title,
      @required String body,
      @required NotificationDetails type,
      int id = 0
    }) => notifications.show(id, title, body, type);

  static scheduledNotification() async {
    var notifications = FlutterLocalNotificationsPlugin();

    //var scheduledNotifiactionDateTime = DateTime.now().add(Duration(seconds: 15));
    var androidPlatformChannelSpecifies = AndroidNotificationDetails('your other channel id', 'your other channel name', 'your other channel description');
    var iOSPlatformChannelSpecifies = IOSNotificationDetails();
    NotificationDetails platformChannelSpecifies = NotificationDetails(androidPlatformChannelSpecifies, iOSPlatformChannelSpecifies);
    if(scheduledOnOff)
      await notifications.periodicallyShow(0, "Movie Posters Unlimited", "NEW SALE: 20% all action films", RepeatInterval.EveryMinute, platformChannelSpecifies);
  }
}


