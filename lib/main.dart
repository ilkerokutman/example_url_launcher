import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';
import 'package:get/get.dart';

import './models/app_settings.dart';
import './models/received_notification.dart';
import './screens/splash_screen.dart';
import './screens/home_screen.dart';
import './screens/pressure_reminder_screen.dart';
import './screens/profile_screen.dart';
import './screens/query_screen.dart';
import './screens/enroll_screen.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
final BehaviorSubject<ReceivedNotification> didReceiveLocalNotificationSubject =
    BehaviorSubject<ReceivedNotification>();
final BehaviorSubject<String> selectNotificationSubject =
    BehaviorSubject<String>();
NotificationAppLaunchDetails notificationAppLaunchDetails;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  notificationAppLaunchDetails =
      await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    _configureDidReceiveLocalNotificationSubject();
    _configureSelectNotificationSubject();
  }

  void _configureDidReceiveLocalNotificationSubject() {
    didReceiveLocalNotificationSubject.stream
        .listen((ReceivedNotification receivedNotification) async {
      await showDialog(
          context: context,
          builder: (BuildContext context) => CupertinoAlertDialog(
                title: receivedNotification.title != null
                    ? Text(receivedNotification.title)
                    : null,
                content: receivedNotification.body != null
                    ? Text(receivedNotification.body)
                    : null,
                actions: [
                  CupertinoDialogAction(
                    isDefaultAction: true,
                    child: Text('Tamam'),
                    onPressed: () async {
                      Navigator.of(context, rootNavigator: true).pop();
                      await Navigator.pushNamed(
                          context, PressureReminderScreen.routeName,
                          arguments: PressureReminderScreen(
                              receivedNotification.payload));
                    },
                  )
                ],
              ));
    });
  }

  void _configureSelectNotificationSubject() {
    selectNotificationSubject.stream.listen((String payload) async {
      await Navigator.pushNamed(context, PressureReminderScreen.routeName,
          arguments: PressureReminderScreen(payload));
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppSettings.get().name,
      theme: AppSettings.get().themeData,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (ctx) => SplashScreen(),
        HomeScreen.routeName: (ctx) => HomeScreen(),
        PressureReminderScreen.routeName: (ctx) => PressureReminderScreen(null),
        ProfileScreen.routeName: (ctx) => ProfileScreen(),
        QueryScreen.routeName: (ctx) => QueryScreen(),
        EnrollScreen.routeName: (ctx) => EnrollScreen(),
      },
    );
  }
}
