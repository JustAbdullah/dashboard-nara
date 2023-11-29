import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

import '../crud.dart';
import '../linksapi.dart';

class AddBrandsController extends GetxController {
  ///
  final ImagePicker pickerOne = ImagePicker();
  String urlImageOne = "0";
  File? imagePickerOne;
  Uint8List webImageOne = Uint8List(8);

  RxBool waitUploadimage = false.obs;
  RxBool isUploadimage = false.obs;

  RxBool isAddIntoDatabase = false.obs;

  ///
  TextEditingController nameBrandAr = TextEditingController();
  TextEditingController nameBrandEn = TextEditingController();
  String nameAr = "";
  String nameEn = "";
  Crud crud = Crud();

  addTheBrands(
    String nameBrandArNew,
    String nameBrandEnNew,
  ) async {
    var response = await crud.postRequest(AppLinksApi.addBrand, {
      'name_brand_ar': nameBrandArNew.toString(),
      'name_brand_en': nameBrandEnNew.toString(),
      'image_brand': urlImageOne.toString(),
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
          waitUploadimage.value = false;
          isUploadimage.value = true;
        });
      });
    }
  }
}
