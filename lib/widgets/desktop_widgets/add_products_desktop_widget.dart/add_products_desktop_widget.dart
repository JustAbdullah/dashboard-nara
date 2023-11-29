import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/add_products_controller.dart';
import '../../../localization/changelanguage.dart';
import '../../menu/menu.dart';
import '../home/home_desktop.dart';
import '../textfiled/textformfiled_widget_desktop/textformfiled_cut.dart';

class addProductsDesktopWidget extends StatefulWidget {
  const addProductsDesktopWidget({Key? key}) : super(key: key);

  @override
  State<addProductsDesktopWidget> createState() =>
      _addProductsDesktopWidgetState();
}

class _addProductsDesktopWidgetState extends State<addProductsDesktopWidget> {
  @override
  Widget build(BuildContext context) {
    /////////////////////////

    ////////////////////

    ChangeLanguageToLocale changeController = Get.put(ChangeLanguageToLocale());

    AddProductsController addProductsController =
        Get.put(AddProductsController());
    final size = MediaQuery.of(context).size;
    final screenHeight = size.height;
    final screenWidth = size.width;

    // ignore: unused_local_variable

    // ignore: unused_local_variable

    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: screenWidth * 0.01),
            child: Align(
              alignment: Alignment.topCenter,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: screenWidth * 0.30,
                      height: screenHeight * 0.07,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 48, 47, 47),
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text(
                          "170".tr,
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            color: Colors.white,
                            fontSize: screenWidth * 0.015,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.10,
                    ),
                    GetX<AddProductsController>(
                        builder: (controller) => Padding(
                              padding: EdgeInsets.only(
                                  left: screenWidth * 0.03,
                                  right: screenWidth * 0.03),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  !controller.isUploadImageOne.value
                                      ? Text("171".tr)
                                      : kIsWeb
                                          ? Image.memory(
                                              controller.webImageOne,
                                              width: screenWidth * 0.10,
                                              fit: BoxFit.fill,
                                            )
                                          : Image.file(
                                              controller.imagePickerOne!,
                                              width: screenWidth * 0.10,
                                              fit: BoxFit.fill,
                                            ),
                                ],
                              ),
                            )),
                    SizedBox(
                      height: screenHeight * 0.05,
                    ),
                    InkWell(
                        onTap: () {
                          addProductsController.chooseImageOne();

                          setState(() {});
                        },
                        child: GetX<AddProductsController>(
                            builder: (controller) => Container(
                                  width: screenWidth * 0.15,
                                  height: screenHeight * 0.05,
                                  decoration: BoxDecoration(
                                      color: controller.isUploadimage.value
                                          ? Colors.green
                                          : Colors.red,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                    child: Text(
                                      controller.isUploadimage.value
                                          ? "تم رفع الصورة".tr
                                          : "لم يتم رفع اي صورة".tr,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: screenWidth * 0.010),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ))),
                    SizedBox(
                      height: screenHeight * 0.03,
                    ),
                    Container(
                        width: screenWidth,
                        child: Padding(
                            padding: EdgeInsets.only(
                                left: screenWidth * 0.00,
                                right: screenWidth * 0.0),
                            child: GetX<AddProductsController>(
                              builder: (controller) => Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "176".tr,
                                    style: TextStyle(
                                      fontFamily: 'Cairo',
                                      color: Colors.black,
                                      fontSize: screenWidth * 0.015,
                                    ),
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.03,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      controller.whatIsTypeOfProduct.value = 5;
                                    },

                                    /////////////////////////////////// Types OF Prdoucts ///////////////////////////
                                    child: AnimatedContainer(
                                        duration: Duration(milliseconds: 300),
                                        width: screenWidth * 0.08,
                                        decoration: BoxDecoration(
                                            color: controller
                                                        .whatIsTypeOfProduct
                                                        .value ==
                                                    5
                                                ? const Color.fromARGB(
                                                    255, 248, 186, 0)
                                                : Color.fromARGB(
                                                    255, 48, 47, 47),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Text(
                                          "ملابس",
                                          style: TextStyle(
                                            fontFamily: 'Cairo',
                                            color: Colors.white,
                                            fontSize: screenWidth * 0.012,
                                          ),
                                          textAlign: TextAlign.center,
                                        )),
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.03,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      controller.whatIsTypeOfProduct.value = 6;
                                    },
                                    child: AnimatedContainer(
                                        duration: Duration(milliseconds: 300),
                                        width: screenWidth * 0.08,
                                        decoration: BoxDecoration(
                                            color: controller
                                                        .whatIsTypeOfProduct
                                                        .value ==
                                                    6
                                                ? const Color.fromARGB(
                                                    255, 248, 186, 0)
                                                : Color.fromARGB(
                                                    255, 48, 47, 47),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Text(
                                          "أحذية",
                                          style: TextStyle(
                                            fontFamily: 'Cairo',
                                            color: Colors.white,
                                            fontSize: screenWidth * 0.012,
                                          ),
                                          textAlign: TextAlign.center,
                                        )),
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.03,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      controller.whatIsTypeOfProduct.value = 7;
                                    },
                                    child: AnimatedContainer(
                                        duration: Duration(milliseconds: 300),
                                        width: screenWidth * 0.08,
                                        decoration: BoxDecoration(
                                            color: controller
                                                        .whatIsTypeOfProduct
                                                        .value ==
                                                    7
                                                ? const Color.fromARGB(
                                                    255, 248, 186, 0)
                                                : Color.fromARGB(
                                                    255, 48, 47, 47),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Text(
                                          "رياضة",
                                          style: TextStyle(
                                            fontFamily: 'Cairo',
                                            color: Colors.white,
                                            fontSize: screenWidth * 0.012,
                                          ),
                                          textAlign: TextAlign.center,
                                        )),
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.03,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        controller.whatIsTypeOfProduct.value =
                                            8;
                                      },
                                      child: AnimatedContainer(
                                          duration: Duration(milliseconds: 300),
                                          width: screenWidth * 0.08,
                                          decoration: BoxDecoration(
                                              color: controller
                                                          .whatIsTypeOfProduct
                                                          .value ==
                                                      8
                                                  ? const Color.fromARGB(
                                                      255, 248, 186, 0)
                                                  : Color.fromARGB(
                                                      255, 48, 47, 47),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Text(
                                            "عطور",
                                            style: TextStyle(
                                              fontFamily: 'Cairo',
                                              color: Colors.white,
                                              fontSize: screenWidth * 0.012,
                                            ),
                                            textAlign: TextAlign.center,
                                          ))),
                                ],
                              ),
                            ))),
                    SizedBox(
                      height: screenHeight * 0.03,
                    ),
                    Container(
                        width: screenWidth,
                        child: Padding(
                            padding: EdgeInsets.only(
                                left: screenWidth * 0.00,
                                right: screenWidth * 0.0),
                            child: GetX<AddProductsController>(
                              builder: (controller) => Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "الاقسام الفرعية".tr,
                                    style: TextStyle(
                                      fontFamily: 'Cairo',
                                      color: Colors.black,
                                      fontSize: screenWidth * 0.015,
                                    ),
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.03,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      controller
                                          .whatIsTheSubTypeOFProduct.value = 0;
                                    },

                                    /////////////////////////////////// Types OF Prdoucts ///////////////////////////
                                    child: AnimatedContainer(
                                        duration: Duration(milliseconds: 300),
                                        width: screenWidth * 0.08,
                                        decoration: BoxDecoration(
                                            color: controller
                                                        .whatIsTheSubTypeOFProduct
                                                        .value ==
                                                    0
                                                ? const Color.fromARGB(
                                                    255, 248, 186, 0)
                                                : Color.fromARGB(
                                                    255, 48, 47, 47),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Text(
                                          "لايوجد",
                                          style: TextStyle(
                                            fontFamily: 'Cairo',
                                            color: Colors.white,
                                            fontSize: screenWidth * 0.012,
                                          ),
                                          textAlign: TextAlign.center,
                                        )),
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.03,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      controller
                                          .whatIsTheSubTypeOFProduct.value = 1;
                                    },
                                    child: AnimatedContainer(
                                        duration: Duration(milliseconds: 300),
                                        width: screenWidth * 0.08,
                                        decoration: BoxDecoration(
                                            color: controller
                                                        .whatIsTheSubTypeOFProduct
                                                        .value ==
                                                    1
                                                ? const Color.fromARGB(
                                                    255, 248, 186, 0)
                                                : Color.fromARGB(
                                                    255, 48, 47, 47),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Text(
                                          "أقمصة",
                                          style: TextStyle(
                                            fontFamily: 'Cairo',
                                            color: Colors.white,
                                            fontSize: screenWidth * 0.012,
                                          ),
                                          textAlign: TextAlign.center,
                                        )),
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.03,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      controller
                                          .whatIsTheSubTypeOFProduct.value = 2;
                                    },
                                    child: AnimatedContainer(
                                        duration: Duration(milliseconds: 300),
                                        width: screenWidth * 0.08,
                                        decoration: BoxDecoration(
                                            color: controller
                                                        .whatIsTheSubTypeOFProduct
                                                        .value ==
                                                    2
                                                ? const Color.fromARGB(
                                                    255, 248, 186, 0)
                                                : Color.fromARGB(
                                                    255, 48, 47, 47),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Text(
                                          "فساتين",
                                          style: TextStyle(
                                            fontFamily: 'Cairo',
                                            color: Colors.white,
                                            fontSize: screenWidth * 0.012,
                                          ),
                                          textAlign: TextAlign.center,
                                        )),
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.03,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        controller.whatIsTheSubTypeOFProduct
                                            .value = 3;
                                      },
                                      child: AnimatedContainer(
                                          duration: Duration(milliseconds: 300),
                                          width: screenWidth * 0.08,
                                          decoration: BoxDecoration(
                                              color: controller
                                                          .whatIsTheSubTypeOFProduct
                                                          .value ==
                                                      3
                                                  ? const Color.fromARGB(
                                                      255, 248, 186, 0)
                                                  : Color.fromARGB(
                                                      255, 48, 47, 47),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Text(
                                            "بنطلونات",
                                            style: TextStyle(
                                              fontFamily: 'Cairo',
                                              color: Colors.white,
                                              fontSize: screenWidth * 0.012,
                                            ),
                                            textAlign: TextAlign.center,
                                          ))),
                                  SizedBox(
                                    width: screenWidth * 0.03,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        controller.whatIsTheSubTypeOFProduct
                                            .value = 4;
                                      },
                                      child: AnimatedContainer(
                                          duration: Duration(milliseconds: 300),
                                          width: screenWidth * 0.08,
                                          decoration: BoxDecoration(
                                              color: controller
                                                          .whatIsTheSubTypeOFProduct
                                                          .value ==
                                                      4
                                                  ? const Color.fromARGB(
                                                      255, 248, 186, 0)
                                                  : Color.fromARGB(
                                                      255, 48, 47, 47),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Text(
                                            "جاكيتات",
                                            style: TextStyle(
                                              fontFamily: 'Cairo',
                                              color: Colors.white,
                                              fontSize: screenWidth * 0.012,
                                            ),
                                            textAlign: TextAlign.center,
                                          ))),
                                  SizedBox(
                                    width: screenWidth * 0.03,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        controller.whatIsTheSubTypeOFProduct
                                            .value = 6;
                                      },
                                      child: AnimatedContainer(
                                          duration: Duration(milliseconds: 300),
                                          width: screenWidth * 0.08,
                                          decoration: BoxDecoration(
                                              color: controller
                                                          .whatIsTheSubTypeOFProduct
                                                          .value ==
                                                      6
                                                  ? const Color.fromARGB(
                                                      255, 248, 186, 0)
                                                  : Color.fromARGB(
                                                      255, 48, 47, 47),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Text(
                                            "حقائب",
                                            style: TextStyle(
                                              fontFamily: 'Cairo',
                                              color: Colors.white,
                                              fontSize: screenWidth * 0.012,
                                            ),
                                            textAlign: TextAlign.center,
                                          ))),
                                ],
                              ),
                            ))),
                    SizedBox(
                      height: screenHeight * 0.05,
                    ),
                    Container(
                      width: screenWidth * 0.50,
                      child: TextFormFiledCusDeskTop(
                        keyboardType: TextInputType.name,
                        controllerData: addProductsController.nameProdu,
                        value: (value) {
                          addProductsController.name = value.toString().obs;

                          return null;
                        },
                        hintData: "177".tr,
                        iconData: Icons.menu_book,
                        labelData: "177".tr,
                        fillColor: Color.fromARGB(255, 48, 47, 47),
                        iconColor: Colors.white,
                        hintColor: Colors.red,
                        fontColor: Colors.white,
                        borderSideColor: Color.fromARGB(255, 48, 47, 47),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.05,
                    ),
                    Container(
                      width: screenWidth * 0.50,
                      child: TextFormFiledCusDeskTop(
                        keyboardType: TextInputType.name,
                        controllerData: addProductsController.nameProduEn,
                        value: (value) {
                          addProductsController.nameEn = value.toString().obs;

                          return null;
                        },
                        hintData: "178".tr,
                        iconData: Icons.menu_book,
                        labelData: "178".tr,
                        fillColor: Color.fromARGB(255, 48, 47, 47),
                        iconColor: Colors.white,
                        hintColor: Colors.red,
                        fontColor: Colors.white,
                        borderSideColor: Color.fromARGB(255, 48, 47, 47),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.05,
                    ),
                    /*   Container(
                        width: screenWidth,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: screenWidth * 0.00, right: screenWidth * 0.0),
                          child: SizedBox(
                            height: screenHeight / 12,
                            child: ListView(children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      alignment: Alignment.center,
                                      width: screenWidth,
                                      height: screenHeight / 12,
                                      child: FutureBuilder(
                                          future:
                                              addProductsController.getViewSizes(),
                                          builder: (BuildContext context,
                                              AsyncSnapshot snapshot) {
                                            if (snapshot.hasError) {
                                              return Text('Something went wrong');
                                            } else if (snapshot.hasData) {
                                              return ListView.builder(
                                                  scrollDirection: Axis.horizontal,
                                                  itemCount:
                                                      snapshot.data['data'].length,
                                                  shrinkWrap: true,
                                                  itemBuilder: (context, i) {
                                                    if (snapshot.hasData) {
                                                      return Padding(
                                                          padding: EdgeInsets.only(
                                                              top: screenHeight *
                                                                  0.03,
                                                              bottom: screenHeight *
                                                                  0.01),
                                                          child: Padding(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          screenWidth *
                                                                              0.01),
                                                              child: GetX<
                                                                  AddProductsController>(
                                                                builder:
                                                                    (theController) =>
                                                                        InkWell(
                                                                  onTap: () {
                                                                    theController
                                                                        .whatIsTheSize
                                                                        .value = int.parse(snapshot.data[
                                                                            'data']
                                                                            [i][
                                                                            'id_size']
                                                                        .toString());
                                                                  },
                                                                  child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        AnimatedContainer(
                                                                            alignment: Alignment
                                                                                .center,
                                                                            duration: Duration(
                                                                                milliseconds:
                                                                                    750),
                                                                            height:
                                                                                screenHeight /
                                                                                    15,
                                                                            decoration:
                                                                                BoxDecoration(color: theController.whatIsTheSize.value == int.parse(snapshot.data['data'][i]['id_size'].toString()) ? Colors.amber : Color.fromARGB(255, 234, 231, 231)),
                                                                            child: Padding(
                                                                              padding:
                                                                                  EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                                                                              child:
                                                                                  Text(
                                                                                "${snapshot.data['data'][i]['size']}",
                                                                                style: TextStyle(
                                                                                    fontFamily: 'Cairo',
                                                                                    color: Colors.black,
                                                                                    fontSize: screenWidth * 0.012,
                                                                                    fontWeight: FontWeight.w400),
                                                                                textAlign:
                                                                                    TextAlign.center,
                                                                              ),
                                                                            ))
                                                                      ]),
                                                                ),
                                                              )));
                                                    } else {
                                                      return Center(
                                                          child: Center(
                                                              child:
                                                                  CircularProgressIndicator(
                                                                      color: Colors
                                                                          .red)));
                                                    }
                                                  });
                                            } else {
                                              return Center(
                                                  child: Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                              color: Colors.red)));
                                            }
                                          }))
                                ],
                              ),
                            ]),
                          ),
                        )),*/
                    SizedBox(
                      height: screenHeight * 0.05,
                    ),
                    Container(
                        width: screenWidth * 0.70,
                        child: TextFormFiledCusDeskTop(
                          keyboardType: TextInputType.name,
                          controllerData: addProductsController.bodyProdu,
                          value: (value) {
                            addProductsController.body = value.toString().obs;
                            return null;
                          },
                          hintData: "185".tr,
                          iconData: Icons.menu_book,
                          labelData: "185".tr,
                          fillColor: Color.fromARGB(255, 48, 47, 47),
                          iconColor: Colors.white,
                          hintColor: Colors.red,
                          fontColor: Colors.white,
                          borderSideColor: Color.fromARGB(255, 48, 47, 47),
                        )),
                    SizedBox(
                      height: screenHeight * 0.05,
                    ),
                    Container(
                        width: screenWidth * 0.70,
                        child: TextFormFiledCusDeskTop(
                          keyboardType: TextInputType.name,
                          controllerData: addProductsController.bodyProduEn,
                          value: (value) {
                            addProductsController.bodyEn = value.toString().obs;
                            return null;
                          },
                          hintData: "186".tr,
                          iconData: Icons.menu_book,
                          labelData: "186".tr,
                          fillColor: Color.fromARGB(255, 48, 47, 47),
                          iconColor: Colors.white,
                          hintColor: Colors.red,
                          fontColor: Colors.white,
                          borderSideColor: Color.fromARGB(255, 48, 47, 47),
                        )),
                    SizedBox(
                      height: screenHeight * 0.05,
                    ),
                    Text(
                      "نوع البرند".tr,
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        color: Colors.black,
                        fontSize: screenWidth * 0.015,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.05,
                    ),
                    Container(
                        width: screenWidth,
                        child: Padding(
                            padding: EdgeInsets.only(
                                left: screenWidth * 0.00,
                                right: screenWidth * 0.0),
                            child: SizedBox(
                              height: screenHeight / 2,
                              child: FutureBuilder(
                                future:
                                    addProductsController.getAllDataBrands(),
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot) {
                                  var data = snapshot.data;
                                  if (data == null) {
                                    return Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                          padding: EdgeInsets.only(
                                              top: screenHeight * 0.1),
                                          child: Column(
                                            children: [
                                              Container(
                                                  width: screenWidth * 0.1,
                                                  height: screenHeight * 0.1,
                                                  decoration: BoxDecoration(
                                                    color: Colors.amber,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      "!",
                                                      style: TextStyle(
                                                          fontFamily: 'Cairo',
                                                          color: Colors.white,
                                                          fontSize:
                                                              screenWidth *
                                                                  0.015,
                                                          fontWeight:
                                                              FontWeight.w900),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  )),
                                              SizedBox(
                                                height: screenHeight * 0.04,
                                              ),
                                              Text(
                                                "650".tr,
                                                style: TextStyle(
                                                    fontFamily: 'Cairo',
                                                    color: Colors.black,
                                                    fontSize:
                                                        screenWidth * 0.012,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )
                                            ],
                                          )),
                                    );
                                  } else if (snapshot.hasData) {
                                    return GridView.builder(
                                        itemCount: snapshot.data['data'].length,
                                        shrinkWrap: true,
                                        itemBuilder: (context, i) {
                                          // var number = snapshot.data['data'].length;//

                                          addProductsController.brands
                                              .id_brands = snapshot.data['data']
                                                  [i]['id_brand']
                                              .toString();
                                          addProductsController
                                                  .brands.name_brand_ar =
                                              snapshot.data['data'][i]
                                                      ['name_brand_ar']
                                                  .toString();

                                          addProductsController
                                                  .brands.name_brand_en =
                                              snapshot.data['data'][i]
                                                      ['name_brand_en']
                                                  .toString();
                                          addProductsController
                                                  .brands.image_brand =
                                              snapshot.data['data'][i]
                                                      ['image_brand']
                                                  .toString();
                                          addProductsController.brands
                                              .id_brands = snapshot.data['data']
                                                  [i]['id_brand']
                                              .toString();
                                          addProductsController
                                                  .brands.name_brand_ar =
                                              snapshot.data['data'][i]
                                                      ['name_brand_ar']
                                                  .toString();

                                          addProductsController
                                                  .brands.name_brand_en =
                                              snapshot.data['data'][i]
                                                      ['name_brand_en']
                                                  .toString();
                                          addProductsController
                                                  .brands.image_brand =
                                              snapshot.data['data'][i]
                                                      ['image_brand']
                                                  .toString();

                                          ///

                                          return Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 2, horizontal: 2),
                                              child:
                                                  GetX<AddProductsController>(
                                                builder: (controller) =>
                                                    InkWell(
                                                  onTap: () async {
                                                    ////////////////
                                                    controller
                                                            .brands.id_brands =
                                                        snapshot.data['data'][i]
                                                                ['id_brand']
                                                            .toString();

                                                    controller.whatIsBrand
                                                        .value = controller
                                                            .brands.id_brands =
                                                        snapshot.data['data'][i]
                                                                ['id_brand']
                                                            .toString();

                                                    /////////////////////
                                                  },
                                                  child: AnimatedContainer(
                                                      duration: Duration(
                                                          milliseconds: 1200),
                                                      decoration: BoxDecoration(
                                                        color: controller
                                                                    .whatIsBrand
                                                                    .value ==
                                                                snapshot.data[
                                                                        'data']
                                                                        [i][
                                                                        'id_brand']
                                                                    .toString()
                                                            ? Colors.amber
                                                            : Colors.white,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: controller
                                                                        .whatIsBrand
                                                                        .value ==
                                                                    snapshot
                                                                        .data[
                                                                            'data']
                                                                            [i][
                                                                            'id_brand']
                                                                        .toString()
                                                                ? Colors.amber
                                                                : Color.fromARGB(
                                                                        255,
                                                                        248,
                                                                        245,
                                                                        245)
                                                                    .withOpacity(
                                                                        0.7),
                                                            spreadRadius: 10,
                                                            blurRadius: 10,
                                                            offset: Offset(0,
                                                                3), // changes position of shadow
                                                          ),
                                                        ],
                                                      ),
                                                      width: screenWidth * 0.10,
                                                      height:
                                                          screenHeight * 0.20,
                                                      child: Stack(
                                                        children: [
                                                          Align(
                                                              alignment:
                                                                  Alignment
                                                                      .topCenter,
                                                              child: changeController
                                                                          .isChange
                                                                          .value ==
                                                                      false
                                                                  ? Text(
                                                                      (snapshot.data['data']
                                                                              [
                                                                              i]
                                                                          [
                                                                          'name_brand_ar']),
                                                                      style:
                                                                          TextStyle(
                                                                        fontFamily:
                                                                            'Cairo',
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            screenWidth *
                                                                                0.014,
                                                                        fontWeight:
                                                                            FontWeight.w700,
                                                                      ))
                                                                  : Text(
                                                                      ("${controller.brands.name_brand_en}"),
                                                                      style:
                                                                          TextStyle(
                                                                        fontFamily:
                                                                            'Cairo',
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            screenWidth *
                                                                                0.014,
                                                                        fontWeight:
                                                                            FontWeight.w700,
                                                                      ))),
                                                          Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: screenHeight *
                                                                          0.06),
                                                              child: Align(
                                                                alignment:
                                                                    Alignment
                                                                        .topCenter,
                                                                child:
                                                                    Container(
                                                                  width:
                                                                      screenWidth *
                                                                          0.60,
                                                                  height:
                                                                      screenHeight *
                                                                          0.18,
                                                                  child: Image
                                                                      .network(
                                                                    snapshot
                                                                        .data[
                                                                            'data']
                                                                            [i][
                                                                            'image_brand']
                                                                        .toString(),
                                                                    width:
                                                                        screenWidth *
                                                                            0.60,
                                                                    height:
                                                                        screenHeight *
                                                                            0.18,
                                                                  ),
                                                                ),
                                                              )),
                                                        ],
                                                      )),
                                                ),
                                              ));
                                        },
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          childAspectRatio: (1 / 0.5),
                                          crossAxisCount: 3,
                                          mainAxisSpacing: 20.0,
                                          crossAxisSpacing: 5.0,
                                        ));
                                  } else if (snapshot.hasError) {
                                    return Center(
                                      child: Text("${snapshot.error}"),
                                    );
                                  } else {
                                    return Center(
                                      child: Text("${snapshot.error}"),
                                    );
                                  }
                                },
                              ),
                            ))),
                    SizedBox(
                      height: screenHeight * 0.05,
                    ),
                    Container(
                        width: screenWidth * 0.30,
                        child: TextFormFiledCusDeskTop(
                          keyboardType: TextInputType.name,
                          controllerData: addProductsController.priceProdu,
                          value: (value) {
                            addProductsController.prices = value.toString().obs;

                            return null;
                          },
                          hintData: "197".tr,
                          iconData: Icons.menu_book,
                          labelData: "197".tr,
                          fillColor: Color.fromARGB(255, 48, 47, 47),
                          iconColor: Colors.white,
                          hintColor: Colors.red,
                          fontColor: Colors.white,
                          borderSideColor: Color.fromARGB(255, 48, 47, 47),
                        )),
                    SizedBox(
                      height: screenHeight * 0.05,
                    ),
                    Container(
                        width: screenWidth * 0.30,
                        child: TextFormFiledCusDeskTop(
                          keyboardType: TextInputType.name,
                          controllerData: addProductsController.priceProduOld,
                          value: (value) {
                            addProductsController.pricesOld =
                                value.toString().obs;

                            return null;
                          },
                          hintData: "سعر المنتج القديم".tr,
                          iconData: Icons.menu_book,
                          labelData: "سعر المنتج القديم".tr,
                          fillColor: Color.fromARGB(255, 48, 47, 47),
                          iconColor: Colors.white,
                          hintColor: Colors.red,
                          fontColor: Colors.white,
                          borderSideColor: Color.fromARGB(255, 48, 47, 47),
                        )),
                    SizedBox(
                      height: screenHeight * 0.05,
                    ),
                    InkWell(
                      onTap: () {
                        addProductsController.addTheProducts(
                          addProductsController.name.value.toString(),
                          addProductsController.nameEn.value.toString(),
                          addProductsController.body.value.toString(),
                          addProductsController.bodyEn.value.toString(),
                          addProductsController.prices.value.toString(),
                          addProductsController.pricesOld.value.toString(),
                          addProductsController.whatIsTypeOfProduct.value
                              .toString(),
                          addProductsController.whatIsTheSubTypeOFProduct.value
                              .toString(),
                          addProductsController.whatIsBrand.value.toString(),
                        );
                        addProductsController.isAddIntoDatabase.value = true;
                      },
                      child: Padding(
                        padding: EdgeInsets.only(bottom: screenHeight * 0.05),
                        child: Container(
                          width: screenWidth * 0.15,
                          height: screenHeight * 0.05,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 251, 189, 1),
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: Text(
                              "198".tr,
                              style: TextStyle(
                                  fontFamily: 'Cairo',
                                  color: Colors.black,
                                  fontSize: screenWidth * 0.012),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GetX<AddProductsController>(
              builder: (controller) => Visibility(
                    visible: controller.waitUploadimage.value,
                    child: Stack(children: [
                      Container(
                        color: Colors.black45,
                        width: screenWidth,
                        height: screenHeight,
                      ),
                      Container(
                        color: Colors.black45,
                        width: screenWidth,
                        height: screenHeight,
                      ),
                      Container(
                        color: Colors.black45,
                        width: screenWidth,
                        height: screenHeight,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "يتم معالجة العملية".tr,
                          style: TextStyle(
                              fontFamily: 'Cairo',
                              color: Colors.white,
                              fontSize: screenWidth * 0.018,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ]),
                  )),
          GetX<AddProductsController>(
              builder: (controller) => Visibility(
                    visible: controller.isAddIntoDatabase.value,
                    child: Stack(children: [
                      Container(
                        color: Colors.black45,
                        width: screenWidth,
                        height: screenHeight,
                      ),
                      Container(
                        color: Colors.black45,
                        width: screenWidth,
                        height: screenHeight,
                      ),
                      Container(
                        color: Colors.black45,
                        width: screenWidth,
                        height: screenHeight,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: screenWidth * 0.3,
                          height: screenHeight * 0.23,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(5)),
                          child: Stack(children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(top: screenHeight * 0.03),
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Text(
                                  "لقد تم إضافة المنتج بنجاح ".tr,
                                  style: TextStyle(
                                      fontFamily: 'Cairo',
                                      color: Colors.white,
                                      fontSize: screenWidth * 0.018,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(right: screenWidth * 0.00),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: InkWell(
                                  onTap: () {
                                    controller.isUploadimage.value = false;
                                    controller.isAddIntoDatabase.value = false;
                                    Get.offAll(HomeDeskTop());
                                  },
                                  child: Container(
                                    width: screenWidth * 0.1,
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(2)),
                                    child: Text(
                                      "العودة للرئيسية".tr,
                                      style: TextStyle(
                                          fontFamily: 'Cairo',
                                          color: Colors.white,
                                          fontSize: screenWidth * 0.012,
                                          fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ]),
                  )),
          TheMenu(),
        ],
      ),
    );
  }
}
