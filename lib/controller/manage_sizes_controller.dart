import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../crud.dart';
import '../linksapi.dart';
import '../models/colors.dart';
import '../models/sizes.dart';
import '../widgets/desktop_widgets/users_manage_desktop/users_desktop_widget.dart';

class SizesManageController extends GetxController {
  TextEditingController size = TextEditingController();
  String nameTheSize = "0";

  RxBool editTheSize = false.obs;

  RxBool isWantAddSize = false.obs;
  getViewSize() async {
    var response = await crud.postRequest(AppLinksApi.getAllSizes, {});

    return response;
  }

  getAllDataSizes() async {
    var response = await getViewSize();
    return response;
  }

  final sizes = Sizes();

  Crud crud = Crud();

  RxBool editTheAccounts = false.obs;

  RxBool showOptions = false.obs;
  deleteSize(String id) async {
    var response = await crud.postRequest(AppLinksApi.deleteSize, {
      'id_size': id.toString(),
    });
    if (response['status'] == "success") {
    } else {}

    return response;
  }

  addTheSize(
    String name,
  ) async {
    var response = await crud.postRequest(AppLinksApi.addSizes, {
      'size': name.toString(),
    });

    return response;
  }

  editNewTheSize(
    String id,
    String name,
  ) async {
    var response = await crud.postRequest(AppLinksApi.editSize, {
      'id_size': id.toString(),
      'size': name.toString(),
    });

    return response;
  }
}
