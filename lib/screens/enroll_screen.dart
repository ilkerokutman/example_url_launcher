import 'dart:io';

import 'package:flutter/material.dart';

import '../settings/data.dart';

class Img {
  bool isPicked;
  String name;
  File file;

  Img({
    this.isPicked = false,
    this.name = "Seçiniz",
    this.file,
  });
}

class EnrollScreen extends StatefulWidget {
  static const routeName = "/enroll";
  EnrollScreen({Key key}) : super(key: key);

  @override
  _EnrollScreenState createState() => _EnrollScreenState();
}

class _EnrollScreenState extends State<EnrollScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          brightness: Brightness.light,
          title: Text(PAGENAME_2),
        ),
        body: Center(
          child: Text('removed due to privacy terms'),
        ));
  }
}
