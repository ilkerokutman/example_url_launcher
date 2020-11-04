import 'package:flutter/material.dart';

class AppSettings {
  final String id;
  final String name;
  final String website;
  final String phone;
  final String mainImage;
  final String logoAsset;
  final double logoWidth;
  final double logoHeight;
  final double logoPaddingStart;
  final double logoPaddingTop;
  final Color buttonTextColor;
  final ThemeData themeData;
  final int notificationId;
  final String notificationChannelName;
  final String notificationChannelDesc;
  final String urlNewActivation;
  final String urlCheckActivation;
  final String urlApiBase;
  final String apiUsername;
  final String apiPassword;

  AppSettings({
    @required this.id,
    @required this.name,
    @required this.website,
    @required this.phone,
    @required this.mainImage,
    @required this.logoAsset,
    @required this.logoWidth,
    @required this.logoHeight,
    @required this.logoPaddingStart,
    @required this.logoPaddingTop,
    @required this.buttonTextColor,
    @required this.themeData,
    @required this.notificationId,
    @required this.notificationChannelName,
    @required this.notificationChannelDesc,
    @required this.urlNewActivation,
    @required this.urlCheckActivation,
    @required this.urlApiBase,
    @required this.apiUsername,
    @required this.apiPassword,
  });

  static AppSettings get() {
    //REMOVED IRRELEVANT CODE
    return example();
  }
  static AppSettings example() {
    return AppSettings(
      id: "EXAMPLE",
      name: "Example App Name",
      website: "https://example.com",
      phone: "+904440375",
      mainImage: "assets/images/test.jpg",
      logoAsset: "assets/images/test.svg",
      logoWidth: 206,
      logoHeight: 48.22,
      logoPaddingStart: 21,
      logoPaddingTop: 48,
      buttonTextColor: Colors.black,
      themeData: ThemeData(
        primarySwatch: Colors.yellow,
        primaryColor: const Color.fromRGBO(249, 207, 10, 1),
        accentColor: const Color.fromRGBO(249, 207, 10, 1),
        canvasColor: const Color.fromRGBO(255, 255, 255, 1),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: ThemeData.light()
            .textTheme
            .copyWith(
              bodyText1: TextStyle(fontSize: 14),
            )
            .apply(
              bodyColor: Color.fromRGBO(65, 65, 65, 1),
              displayColor: Color.fromRGBO(65, 65, 65, 1),
            ),
      ),
      notificationId: 3011,
      notificationChannelName: "Example",
      notificationChannelDesc: "Example Notifications",
      urlNewActivation:
          "https://example.com/testApi",
      urlCheckActivation:
          "https://example.com/testApi2",
      urlApiBase: "https://example.com/testApi3",
      apiUsername: "exampleUsername",
      apiPassword: "hiddenPassword",
    );
  }

}
