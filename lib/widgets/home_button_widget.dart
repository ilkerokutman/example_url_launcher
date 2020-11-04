import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/app_settings.dart';

class HomeButtonWidget extends StatelessWidget {
  final String title;
  final String iconPath;
  final GestureTapCallback callBack;
  HomeButtonWidget({
    @required this.title,
    @required this.iconPath,
    @required this.callBack,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: FlatButton(
        color: Theme.of(context).primaryColor,
        onPressed: callBack,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconPath,
              width: 32,
              height: 32,
              color: AppSettings.get().buttonTextColor,
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                color: AppSettings.get().buttonTextColor,
                fontSize: 10,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
