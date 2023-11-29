import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../crud.dart';
import '../linksapi.dart';
import '../models/colors.dart';
import '../widgets/desktop_widgets/users_manage_desktop/users_desktop_widget.dart';

class ColorsManageController extends GetxController {
  TextEditingController nameColor = TextEditingController();
  TextEditingController codeColor = TextEditingController();
  String nameTheColor = "0";
  String codeTheColor = "0";

  RxBool editTheColors = false.obs;

  RxBool isWantAddColor = false.obs;
  getViewColors() async {
    var response = await crud.postRequest(AppLinksApi.getAllColors, {});

    return response;
  }

  getAllDataColors() async {
    var response = await getViewColors();
    return response;
  }

  final color = Colorsn();

  Crud crud = Crud();

  RxBool editTheAccounts = false.obs;

  RxBool showOptions = false.obs;
  deleteColor(String idColor) async {
    var response = await crud.postRequest(AppLinksApi.deleteColors, {
      'id_color': idColor.toString(),
    });
    if (response['status'] == "success") {
    } else {}

    return response;
  }

  addTheColors(
    String name,
    String code,
  ) async {
    var response = await crud.postRequest(AppLinksApi.addColors, {
      'color_name': name.toString(),
      'color': code.toString(),
    });

    return response;
  }

  editNewTheColors(
    String id,
    String name,
    String code,
  ) async {
    var response = await crud.postRequest(AppLinksApi.editTheColors, {
      'id_color': id.toString(),
      'color_name': name.toString(),
      'color': code.toString(),
    });

    return response;
  }
}
