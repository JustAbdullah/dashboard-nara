import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../crud.dart';
import 'package:path/path.dart' as Path;

import '../linksapi.dart';
import '../models/offers.dart';

class OffersManageController extends GetxController {
  RxBool waitUploadimage = false.obs;
  RxBool isUploadimage = false.obs;
  RxBool isWantAddOffer = false.obs;
  RxBool isAddIntoDatabase = false.obs;
  RxInt countImage = 1.obs;
  File? imagePickerOne;
  File? imagePickerTwo;
  File? imagePickerThree;
  File? imagePickerFour;
  RxBool waitUploadImage = false.obs;
  RxBool editTheColors = false.obs;
  RxBool showOptions = false.obs;

  RxBool isWantAddColor = false.obs;
  String urlImageOne = "0";
  RxBool isUploadImageOne = false.obs;

  final ImagePicker pickerOne = ImagePicker();
  final offer = Offers();

  Uint8List webImageOne = Uint8List(8);
  Crud crud = Crud();
  chooseImageOne() async {
    waitUploadimage.value = true;
    waitUploadImage.value = true;
    // ignore: deprecated_member_use
    XFile? image = await pickerOne.pickImage(source: ImageSource.gallery);
    if (kIsWeb) {
      waitUploadImage.value = true;
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
          waitUploadImage.value = false;
          isUploadImageOne.value = true;
          waitUploadImage.value = false;
          waitUploadimage.value = false;
          isUploadImageOne.value = true;
          isUploadimage.value = true;
          countImage + 1;
        });
      });
    }
  }

  addTheOffers() async {
    var response = await crud.postRequest(AppLinksApi.addOffers, {
      'image_offer': urlImageOne.toString(),
    });
    if (response['status'] == "success") {
    } else {}

    return response;
  }

  deleteTheOffers(String idOffer) async {
    var response = await crud.postRequest(AppLinksApi.deleteOffers, {
      'id_offer': idOffer.toString(),
    });
    if (response['status'] == "success") {
    } else {}

    return response;
  }

  getViewoffers() async {
    var response = await crud.postRequest(AppLinksApi.getOffers, {});

    return response;
  }

  getAllDataOffers() async {
    var response = await getViewoffers();
    return response;
  }
}
