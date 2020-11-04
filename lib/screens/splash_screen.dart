import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../models/app_settings.dart';
import '../screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = "/splash";
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final appSettings = AppSettings.get();

  @override
  void initState() {
    super.initState();
    _startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Stack(
          children: [
            Container(
              color: Theme.of(context).primaryColor,
              child: Padding(
                padding: EdgeInsets.all(64),
                child: SvgPicture.asset(
                  appSettings.logoAsset,
                  // color: Colors.white,
                  width: double.infinity,
                ),
              ),
            ),
            Container(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 300),
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _startTime() async {
    return Timer(Duration(seconds: 2), () {
      _openHome();
    });
  }

  _openHome() {
    Get.offAllNamed(HomeScreen.routeName);
  }
}
