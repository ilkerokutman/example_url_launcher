import 'dart:async';
import '../models/register_data.dart';
import '../models/responses.dart';
import '../models/profile.dart';

class NetworkHelper {
  NetworkHelper._privateConstructor();
  static final NetworkHelper instance = NetworkHelper._privateConstructor();

  Future<bool> saveProfile(Profile profile) async {
    //REMOVED DUE TO PRIVACY TERMS
    return false;
  }

  Future<bool> callLog() async {
    //REMOVED DUE TO PRIVACY TERMS
    return false;
  }

  Future<String> query(String plate) async {
    //REMOVED DUE TO PRIVACY TERMS
    return "NO RECORD FOUND";
  }

  Future<BaseResponse> register(RegisterData data) async {
    //REMOVED DUE TO PRIVACY TERMS
    return BaseResponse(success: false);
  }
}
