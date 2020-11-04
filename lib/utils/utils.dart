import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class Utils {
  Utils._privateConstructor();
  static final Utils instance = Utils._privateConstructor();

  Future<bool> isConnected() async {
    try {
      final result = await InternetAddress.lookup("example.com");
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      return false;
    }
  }

  void showToast(BuildContext context, String message) {
    Toast.show(message, context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
  }

  Future<String> toBase64(String imagePath) async {
    final bytes = await File(imagePath).readAsBytes();
    String encodedImage = base64.encode(bytes);
    debugPrint("path of image: $imagePath");
    debugPrint("length of encoded Image : ${encodedImage.length}");
    return encodedImage;
  }
}
