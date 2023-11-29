import 'package:get/get.dart';

import '../crud.dart';
import '../linksapi.dart';
import '../models/celebs.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class CelebsManageController extends GetxController {
  RxBool showTheOptions = false.obs;
  RxBool showEditOptions = false.obs;

  /////////////////////////////////////////////allEdit//////////////////
  final ImagePicker pickerOne = ImagePicker();
  String urlImageOne = "0";
  File? imagePickerOne;
  Uint8List webImageOne = Uint8List(8);

  RxBool waitUploadimage = false.obs;
  RxBool isUploadimage = false.obs;

  RxBool isAddIntoDatabase = false.obs;

  ///
  TextEditingController nameCelebsAr = TextEditingController();
  TextEditingController nameCelebsEn = TextEditingController();
  String nameAr = "";
  String nameEn = "";

  editTheCelebs(
    String nameCelebsArNew,
    String nameCelebsEnNew,
    String image,
    String id,
  ) async {
    var response = await crud.postRequest(AppLinksApi.editCelebs, {
      'name_celebrities': nameCelebsArNew.toString(),
      'name_celebrities_en': nameCelebsEnNew.toString(),
      'image_celebrities': image.toString(),
      'id_celebrities': id.toString(),
    });

    return response;
  }

  chooseImageOne() async {
    waitUploadimage.value = true;
    // ignore: deprecated_member_use
    XFile? image = await pickerOne.pickImage(source: ImageSource.gallery);
    if (kIsWeb) {
      imagePickerOne = File('a');
      var f = await image!.readAsBytes();

      webImageOne = f;
      Reference _reference =
          FirebaseStorage.instance.ref().child('${Path.basename(image.path)}');
      await _reference
          .putData(
        await image.readAsBytes(),
        SettableMetadata(contentType: 'image/jpeg'),
      )
          .whenComplete(() async {
        await _reference.getDownloadURL().then((value) {
          urlImageOne = value;

          celebs.image_celebrities = value;
          waitUploadimage.value = false;
          isUploadimage.value = true;
        });
      });
    }
  }

  //////////////////
  getViewCelebs() async {
    var response = await crud.postRequest(AppLinksApi.getCelebs, {});

    return response;
  }

  getAllDataCelebs() async {
    var response = await getViewCelebs();
    return response;
  }

  final celebs = Celebs();

  Crud crud = Crud();

  deleteCeleb(String idCeleb) async {
    var response = await crud.postRequest(AppLinksApi.deleteCelebs, {
      'id_celebrities': idCeleb.toString(),
    });
    if (response['status'] == "success") {
    } else {}

    return response;
  }
  ///////////////////////
}
