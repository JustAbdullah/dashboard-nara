import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../crud.dart';
import '../linksapi.dart';
import '../screens/home_dashboard.dart';
import '../widgets/desktop_widgets/home/home_desktop.dart';

class LoginController extends GetxController {
  TextEditingController theName = TextEditingController();
  TextEditingController thePassword = TextEditingController();

  String name = "";
  String password = "";

  RxBool isError = false.obs;

  Crud crud = Crud();

  login(String name, String password) async {
    var response = await crud.postRequest(AppLinksApi.loginAdimn, {
      'name_admin': name.toString(),
      'password_admin': password.toString(),
    });
    if (response['status'] == "success") {
      Get.offAll(HomeDashBoard());
    } else {
      isError.value = true;
    }

    return response;
  }
}
