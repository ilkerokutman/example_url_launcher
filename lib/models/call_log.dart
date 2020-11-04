import 'package:flutter/material.dart';
import '../models/profile.dart';

class CallLog {
  Profile profile;
  List<double> location;
  CallLog({
    @required this.profile,
    this.location = const [0, 0],
  });

  Map<String, dynamic> toJson() {
    return {
      "profile": profile.toJson(),
      "location": location,
    };
  }

  void setCoords(double lat, double lng) {
    this.location = [lat, lng];
  }
}
