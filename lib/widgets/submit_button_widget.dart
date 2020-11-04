import 'package:flutter/material.dart';
import '../models/app_settings.dart';

class SubmitButtonWidget extends StatelessWidget {
  SubmitButtonWidget({@required this.title, @required this.onPressed});
  final GestureTapCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        width: double.infinity,
        height: 40,
        child: RaisedButton(
          color: Theme.of(context).primaryColor,
          onPressed: onPressed,
          child: Text(
            title,
            maxLines: 1,
            style: TextStyle(
              color: AppSettings.get().buttonTextColor,
            ),
          ),
        ),
      ),
    );
  }
}
