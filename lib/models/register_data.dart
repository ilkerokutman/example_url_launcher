import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_guid/flutter_guid.dart';
import '../utils/utils.dart';
import '../models/app_settings.dart';

class RegisterData {
  String id;
  String fullName;
  String email;
  String phone;
  String licensePlate;
  int modelYear;
  File licensePicture;
  File invoicePicture;
  bool termsAccepted;

  RegisterData({
    this.id,
    @required this.fullName,
    @required this.email,
    @required this.phone,
    @required this.licensePlate,
    @required this.modelYear,
    @required this.licensePicture,
    @required this.invoicePicture,
    this.termsAccepted = true,
  });

  Map<String, dynamic> toJson() {
    if (id == null || id.isEmpty) id = Guid.newGuid.toString();
    return {
      "id": id,
      "fullName": fullName,
      "email": email,
      "phone": phone,
      "licensePlate": licensePlate,
      "modelYear": modelYear,
      "termsAccepted": termsAccepted,
    };
  }

  Future<Map<String, dynamic>> toPost() async {
    String brand = AppSettings.get().id;
    String licenseImage = await Utils.instance.toBase64(licensePicture.path);
    String invoiceImage = await Utils.instance.toBase64(invoicePicture.path);
    Map<String, dynamic> data = {
      "fullName": fullName,
      "phone": phone,
      "email": email,
      "licensePlate": licensePlate,
      "brand": brand,
      "modelYear": modelYear,
      "invoiceImage": "data:image/png;base64,$invoiceImage",
      "licenseImage": "data:image/png;base64,$licenseImage",
      "contactOptIn": termsAccepted
    };
    return data;
  }
}
