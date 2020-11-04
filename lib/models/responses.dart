import 'package:flutter/material.dart';

class BaseResponse {
  bool success;
  String message;
  dynamic data;

  BaseResponse({
    @required this.success,
    this.message = "",
    this.data,
  });

  factory BaseResponse.fromJson(dynamic j) {
    return BaseResponse(
      success: j["Success"],
      message: j["Message"],
      data: j["Data"],
    );
  }
}
