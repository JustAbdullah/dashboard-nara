import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import '../crud.dart';
import '../linksapi.dart';
import '../models/brands.dart';
import '../models/products.dart';

import 'package:path/path.dart' as Path;
import 'package:firebase_storage/firebase_storage.dart';
import '../models/colors.dart';
import '../models/sizes.dart';

class ProductsManageController extends GetxController {
  RxBool isHaveTheProductColor = false.obs;
  RxBool isHaveTheProductSize = false.obs;
  Uint8List? uploadedImage;
  RxBool isAddProduct = false.obs;

  RxBool getTheColorsAndSizes = false.obs;
  RxBool getTheColors = false.obs;
  RxBool getTheSizes = false.obs;

  RxString isChoesColor = "0".obs;
  RxString isChoesSize = "0".obs;

////////////////////////
///////////////Types Of Products /////////////

  TextEditingController nameProdu = TextEditingController();
  TextEditingController nameProduEn = TextEditingController();
  TextEditingController bodyProdu = TextEditingController();
  TextEditingController bodyProduEn = TextEditingController();
  TextEditingController priceProdu = TextEditingController();
  TextEditingController priceProduOld = TextEditingController();
  RxString whatIsBrand = "0".obs;

  var filename;
  RxBool isChooesImage = false.obs;
  final brands = Brands();

  RxString pricesOld = "".obs;
  RxInt whatIsTheColor = 0.obs;
  RxInt whatIsTheSize = 0.obs;

  RxInt whatIsTheSubTypeOFProduct = 0.obs;
  RxBool waitUploadimage = false.obs;
  RxBool isUploadimage = false.obs;

  RxBool isAddIntoDatabase = false.obs;
  RxInt countImage = 1.obs;
  File? imagePickerOne;
  File? imagePickerTwo;
  File? imagePickerThree;
  File? imagePickerFour;
  RxInt whatIsTypeOfProduct = 1.obs;

  String urlImageOne = "0";
  RxBool isUploadImageOne = false.obs;

  String urlImageTwo = "0";
  RxBool isUploadImageTwo = false.obs;
  String urlImageThree = "0";
  RxBool isUploadImageThree = false.obs;

  String urlImageFour = "0";
  RxBool isUploadImageFour = false.obs;

  final ImagePicker pickerOne = ImagePicker();
  final ImagePicker pickerTwo = ImagePicker();
  final ImagePicker pickerThree = ImagePicker();
  final ImagePicker pickerFour = ImagePicker();

  Uint8List webImageOne = Uint8List(8);
  Uint8List webImageTwo = Uint8List(8);
  Uint8List webImageThree = Uint8List(8);
  Uint8List webImageFour = Uint8List(8);
  Crud crud = Crud();

  RxBool isNotAddProduct = false.obs;
  RxBool isNullProducts = false.obs;
  RxBool waitUploadImage = false.obs;

  RxBool waitupDate = false.obs;

  RxBool editTheProduct = false.obs;
  getViewBrands() async {
    var response = await crud.postRequest(AppLinksApi.getBrands, {});

    return response;
  }

  getAllDataBrands() async {
    var response = await getViewBrands();
    return response;
  }

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
          products.imageProductOne = value.toString();
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
    } else {}

    return response;
  }

  editProducts(
    String idPro,
    String nameProductAr,
    String nameProductEn,
    String bodyProductAr,
    String bodyProductEn,
    String priceNew,
    String priceOld,
    String thetype,
    String thesubtype,
    String thebrand,
    String image,
  ) async {
    var response = await crud.postRequest(AppLinksApi.eidtProduct, {
      'id_product': idPro.toString(),
      'id_type': thetype.toString(),
      'id_subtype': thesubtype.toString(),
      'id_brand': thebrand.toString(),
      'name_product': nameProductAr.toString(),
      'name_product_en': nameProductEn.toString(),
      'body_product': bodyProductAr.toString(),
      'body_product_en': bodyProductEn.toString(),
      'price_product': priceNew.toString(),
      'old_price': priceOld.toString(),
      'image_product': image.toString(),
    });
    if (response['status'] == "success") {
    } else {}

    return response;
  }

  getViewProducts() async {
    var response = await crud.postRequest(AppLinksApi.getProducts, {});

    return response;
  }

  getAllDataProducts() async {
    var response = await getViewProducts();
    return response;
  }

  final products = Products();

  RxBool showTheOptions = false.obs;

  deleteProduct(String idProduct) async {
    var response = await crud.postRequest(AppLinksApi.deleteProduct, {
      'id_product': idProduct.toString(),
    });
    if (response['status'] == "success") {
    } else {}

    return response;
  }

  /////////////////Colors and Sizes////////////////////////////

  getViewColors() async {
    var response = await crud.postRequest(AppLinksApi.getAllColors, {});

    return response;
  }

  getAllDataColors() async {
    var response = await getViewColors();
    return response;
  }

  final color = Colorsn();

  getViewSize() async {
    var response = await crud.postRequest(AppLinksApi.getAllSizes, {});

    return response;
  }

  getAllDataSizes() async {
    var response = await getViewSize();
    return response;
  }

  final sizes = Sizes();

  //////////Add Colors-Sizes/////////////////////
  addColorsProsuct(String idProduct, String idColor) async {
    var response = await crud.postRequest(AppLinksApi.addColorsProducts, {
      'id_product': idProduct.toString(),
      'id_color': idColor.toString(),
    });
    if (response['status'] == "success") {
    } else {}

    return response;
  } //////////Add Colors-Sizes/////////////////////

  addSizesProsuct(String idProduct, String idSize) async {
    var response = await crud.postRequest(AppLinksApi.addSizesProducts, {
      'id_product': idProduct.toString(),
      'id_size': idSize.toString(),
    });
    if (response['status'] == "success") {
    } else {}

    return response;
  }

  getColorsTheProducts(
    String id_product,
  ) async {
    var response = await crud.postRequest(AppLinksApi.getColorsProducts, {
      'id_product': id_product.toString(),
    });
    if (response['status'] == "success") {
      isHaveTheProductColor.value = true;
    } else {
      isHaveTheProductColor.value = false;
    }

    return response;
  }

  getSizesTheProducts(
    String id_product,
  ) async {
    var response = await crud.postRequest(AppLinksApi.getSizesProducts, {
      'id_product': id_product.toString(),
    });
    if (response['status'] == "success") {
      isHaveTheProductSize.value = true;
    } else {
      isHaveTheProductSize.value = false;
    }

    return response;
  }
}
