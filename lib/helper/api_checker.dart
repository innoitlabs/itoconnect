import 'package:flutter/material.dart';
import 'package:i2connect/data/model/response/base/api_response.dart';
import 'package:i2connect/main.dart';
import 'package:i2connect/provider/auth_provider.dart';
//import 'package:i2connect/provider/profile_provider.dart';
//import 'package:i2connect/view/screen/auth/auth_screen.dart';
import 'package:provider/provider.dart';

class ApiChecker {
  static void checkApi(ApiResponse apiResponse) {
    if(apiResponse.error is! String && apiResponse.error.errors[0].message == 'Unauthorized.') {
      //Provider.of<ProfileProvider>(Get.context!,listen: false).clearHomeAddress();
      //Provider.of<ProfileProvider>(Get.context!,listen: false).clearOfficeAddress();
      Provider.of<AuthProvider>(Get.context!,listen: false).clearSharedData();
      //Navigator.of(Get.context!).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const AuthScreen()), (route) => false);
    }else {
      if (apiResponse.error is String) {
      } else {
      }
    }
  }
}