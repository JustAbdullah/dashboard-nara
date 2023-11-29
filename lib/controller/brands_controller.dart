import 'package:get/get.dart';

import '../crud.dart';
import '../linksapi.dart';
import '../models/brands.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class BrandsManageController extends GetxController {
  final brands = Brands();

  Crud crud = Crud();

  RxBool showTheOptions = false.obs;

  RxBool showEditOptions = false.obs;

//////////Edit all////////////////////////
  final ImagePicker pickerOne = ImagePicker();
  String urlImageOne = "0";
  File? imagePickerOne;
  Uint8List webImageOne = Uint8List(8);

  RxBool waitUploadimage = false.obs;
  RxBool isUploadimage = false.obs;

  RxBool isAddIntoDatabase = false.obs;

  ///
  TextEditingController nameBrandsAr = TextEditingController();
  TextEditingController nameBrandsEn = TextEditingController();
  String nameAr = "";
  String nameEn = "";

  editTheBrands(
    String nameBrandsAr,
    String nameBrandsEn,
    String image,
    String id,
  ) async {
    var response = await crud.postRequest(AppLinksApi.addCelebs, {
      'name_brand_ar': nameBrandsAr.toString(),
      'name_brand_en': nameBrandsEn.toString(),
      'image_brand': image.toString(),
      'id_brand ': id.toString(),
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

          brands.image_brand = value;
          waitUploadimage.value = false;
          isUploadimage.value = true;
        });
      });
    }
  }

  //////////////////
///////////////////
  getViewBrands() async {
    var response = await crud.postRequest(AppLinksApi.getBrands, {});

    return response;
  }

  getAllDataBrands() async {
    var response = await getViewBrands();
    return response;
  }

  deleteBrand(String idTheBrand) async {
    var response = await crud.postRequest(AppLinksApi.deleteBrand, {
      'id_brand': idTheBrand.toString(),
    });
    if (response['status'] == "success") {
    } else {}

    return response;
  }
}
