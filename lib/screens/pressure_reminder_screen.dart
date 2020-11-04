import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';

import '../settings/data.dart';
import '../models/received_notification.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

final BehaviorSubject<ReceivedNotification> didReceiveLocalNotificationSubject =
    BehaviorSubject<ReceivedNotification>();

final BehaviorSubject<String> selectNotificationSubject = BehaviorSubject<String>();

NotificationAppLaunchDetails notificationAppLaunchDetails;

class PressureReminderScreen extends StatefulWidget {
  static const routeName = "/pressure";
  final String payload;
  PressureReminderScreen(this.payload);

  @override
  _PressureReminderScreenState createState() => _PressureReminderScreenState();
}

class _PressureReminderScreenState extends State<PressureReminderScreen> {
  final MethodChannel platform = MethodChannel('crossingthestreams.io/resourceResolver');
  bool _isSubmitButtonDisabled;

  var now = DateTime.now().toLocal();

  @override
  Widget build(BuildContext context) {
    //final PressureReminderScreen args = ModalRoute.of(context).settings.arguments;

    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          brightness: Brightness.light,
          title: Text(PAGENAME_SAMPLE_6),
        ),
        body: Center(
          child: Text('removed due to privacy policy'),
        ));
  }
}
