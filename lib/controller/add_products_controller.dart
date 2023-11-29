import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';

import '../crud.dart';
import '../linksapi.dart';
import 'package:path/path.dart' as Path;
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

import 'dart:html' as webFile;
import 'package:file_picker/file_picker.dart' as webPicker;

import '../models/brands.dart';

class AddProductsController extends GetxController {
  RxBool isAddProduct = false.obs;

///////////////Types Of Products /////////////

  ///

  RxBool waitUploadimage = false.obs;
  RxBool isUploadimage = false.obs;

  RxBool isAddIntoDatabase = false.obs;
  RxInt countImage = 1.obs;
  File? imagePickerOne;
  File? imagePickerTwo;
  File? imagePickerThree;
  File? imagePickerFour;

  String urlImageOne = "0";
  RxBool isUploadImageOne = false.obs;

  final ImagePicker pickerOne = ImagePicker();

  Uint8List webImageOne = Uint8List(8);
  Crud crud = Crud();

  RxBool isNotAddProduct = false.obs;
  RxBool isNullProducts = false.obs;
  RxBool waitUploadImage = false.obs;

  RxBool waitupDate = false.obs;
  RxString body = "".obs;
  RxString bodyEn = "".obs;

  RxString name = "".obs;
  RxString nameEn = "".obs;
  RxString prices = "".obs;
/////Product Dateils////
  RxInt isHaveProductXBigSize = 0.obs;
  RxInt isHaveProductBigSize = 0.obs;
  RxInt isHaveProductMedimSize = 0.obs;
  RxInt isHaveProductSmallSize = 0.obs;
////
  RxInt isHaveProductBlackColor = 0.obs;
  RxInt isHaveProductYellowColor = 0.obs;
  RxInt isHaveProductGreenColor = 0.obs;

  RxInt isHaveProductRedColor = 0.obs;
  RxInt isHaveProductWhiteColor = 0.obs;
  RxInt isHaveProductOrangeColor = 0.obs;
  RxInt isHaveProductBlueColor = 0.obs;
  RxInt isHaveProductPurpleColor = 0.obs;

  RxInt whatIsTypeOfProduct = 1.obs;

////////////

  TextEditingController nameProdu = TextEditingController();
  TextEditingController nameProduEn = TextEditingController();
  TextEditingController bodyProdu = TextEditingController();
  TextEditingController bodyProduEn = TextEditingController();
  TextEditingController priceProdu = TextEditingController();
  TextEditingController priceProduOld = TextEditingController();

  var filename;
  RxBool isChooesImage = false.obs;

  RxString pricesOld = "".obs;
  RxInt whatIsTheColor = 0.obs;
  RxInt whatIsTheSize = 0.obs;

  RxInt whatIsTheSubTypeOFProduct = 0.obs;

  RxString whatIsBrand = "0".obs;
  final brands = Brands();

  RxInt theBrand = 2.obs;

/////Product Dateils////
  getViewBrands() async {
    var response = await crud.postRequest(AppLinksApi.getBrands, {});

    return response;
  }

  getAllDataBrands() async {
    var response = await getViewBrands();
    return response;
  }

  addTheProducts(
    String nameProductAr,
    String nameProductEn,
    String bodyProductAr,
    String bodyProductEn,
    String priceNew,
    String priceOld,
    String thetype,
    String thesubtype,
    String thebrand,
  ) async {
    var response = await crud.postRequest(AppLinksApi.addProduct, {
      'id_type': thetype.toString(),
      'id_subtype': thesubtype.toString(),
      'id_brand': thebrand.toString(),
      'name_product': nameProductAr.toString(),
      'name_product_en': nameProductEn.toString(),
      'body_product': bodyProductAr.toString(),
      'body_product_en': bodyProductEn.toString(),
      'price_product': priceNew.toString(),
      'old_price': priceOld.toString(),
      'image_product': urlImageOne.toString(),
    });
    if (response['status'] == "success") {
      reSet();
    } else {}

    return response;
  }

  jj() async {
    var response = await crud.postRequest(AppLinksApi.addProduct, {
      'id_type': "3".toString(),
      'id_subtype': "3".toString(),
      'id_brand': "3".toString(),
      'name_product': "3".toString(),
      'name_product_en': "3".toString(),
      'body_product': "3".toString(),
      'body_product_en': "3".toString(),
      'price_product': "3".toString(),
      'old_price': "3".toString(),
      'image_product': "https://larra.xyz/images_nara/lkklk".toString(),
    });
    if (response['status'] == "success") {
      Future.delayed(Duration(seconds: 3), () async {
        reSet();
      });
    } else {}

    return response;
  }

  ///
  void reSet() {
    isAddProduct.value = true;

    nameProdu.clear();
    nameProduEn.clear();
    bodyProdu.clear();
    bodyProduEn.clear();
    priceProdu.clear();
    webImageOne.clear();
    name;
    nameEn;
    body;
    bodyEn;
    prices;

    Future.delayed(Duration(seconds: 1), () => isAddProduct.value = false);
  }

  getViewColors() async {
    var response = await crud.postRequest(AppLinksApi.getAllColors, {});

    return response;
  }

  getViewSizes() async {
    var response = await crud.postRequest(AppLinksApi.getAllSizes, {});

    return response;
  }

  uploadimage() async {}

  chooseImageOnes() async {
    // ignore: deprecated_member_use
    XFile? image = await pickerOne.pickImage(source: ImageSource.gallery);
    if (kIsWeb) {
      waitUploadImage.value = true;
      imagePickerOne = File('a');
      var f = await image!.readAsBytes();

      webImageOne = f;
    }
  }

  upIm(File? mfile) async {
    var response =
        await crud.postRequestFile(AppLinksApi.uploadimage, {}, mfile!);
  }

  Future<void> pickImageForMobileAndWeb() async {
    final ImagePicker picker = ImagePicker();
    // This picks file for both mobile and web platforms
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 100,
    );

    // Defining the required size for image upload
    String tempPath = (await getTemporaryDirectory()).path;
    File file = File('$tempPath/profile.png');
    upIm(file);
    // Navigate safely to required screen
  }

  //////////////////////Upload Images///////////////////////

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
          upIm(f as File);

          upIm(image as File);
        });
      });
    }
  }
}
