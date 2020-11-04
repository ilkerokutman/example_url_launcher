import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/app_settings.dart';
import '../widgets/home_button_widget.dart';
import '../screens/enroll_screen.dart';
import '../screens/pressure_reminder_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/query_screen.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/";
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final appSettings = AppSettings.get();
  final bool androidFusedLocation = false;

  //IRRELEVANT CODE REMOVED

  @override
  void initState() {
    super.initState();
  }

  _launchWeb() async {
    if (await canLaunch(appSettings.website)) {
      try {
        var res = await launch(appSettings.website);
      } catch (ex) {
        // 
      }
    }
  } 

  _launchCall() async {
    try {
      if (await canLaunch("tel:${appSettings.phone}")) {
        var res = await launch("tel:${appSettings.phone}");
        Toast.show(res.toString(), context);
      } else {
        Toast.show("could not dial ${appSettings.phone}", context);
      }
    } catch (ex) {
      Toast.show("${ex.toString()}", context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Column(
          children: [
            Flexible(
              flex: 1,
              fit: FlexFit.loose,
              child: Container(
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: Image.asset(
                        appSettings.mainImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(appSettings.logoPaddingStart, appSettings.logoPaddingTop, 0, 0),
                      child: SvgPicture.asset(
                        appSettings.logoAsset,
                        width: appSettings.logoWidth,
                        height: appSettings.logoHeight,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 270,
              child: Column(
                children: [
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Row(
                      children: [
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: HomeButtonWidget(
                            title: "CALL\nPHONE",
                            iconPath: "assets/images/icon_call.svg",
                            callBack: _launchCall,
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: HomeButtonWidget(
                            title: "SAMPLE\nPAGE",
                            iconPath: "assets/images/icon_enroll.svg",
                            callBack: () {
                              Get.toNamed(EnrollScreen.routeName);
                            },
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: HomeButtonWidget(
                            title: "SAMPLE\nPAGE",
                            iconPath: "assets/images/icon_query.svg",
                            callBack: () {
                              Get.toNamed(QueryScreen.routeName);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Row(
                      children: [
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: HomeButtonWidget(
                            title: "${appSettings.id}\nWEBSITE",
                            iconPath: "assets/images/icon_link.svg",
                            callBack: _launchWeb,
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: HomeButtonWidget(
                            title: "SAMPLE\nPAGE",
                            iconPath: "assets/images/icon_profile.svg",
                            callBack: () {
                              Get.toNamed(ProfileScreen.routeName);
                            },
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: HomeButtonWidget(
                            title: "SAMPLE\nPAGE",
                            iconPath: "assets/images/icon_pressure_reminder.svg",
                            callBack: () {
                              Get.toNamed(PressureReminderScreen.routeName);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
