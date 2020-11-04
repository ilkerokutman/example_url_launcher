import 'package:flutter/material.dart';

class Profile {
  String id;
  String fullName;
  String email;
  String phone;
  String licensePlate;

  Profile({
    @required this.id,
    @required this.fullName,
    @required this.email,
    @required this.phone,
    @required this.licensePlate,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "fullName": fullName,
      "email": email,
      "phone": phone,
      "licensePlate": licensePlate,
    };
  }
}
