import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nara_dashboard/widgets/desktop_widgets/home/home_desktop.dart';

import '../../../controller/brands_controller.dart';
import '../../../localization/changelanguage.dart';
import '../../menu/menu.dart';
import '../textfiled/textformfiled_widget_desktop/textformfiled_cut.dart';

class BrandsDeskTopWidget extends StatelessWidget {
  const BrandsDeskTopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenHeight = size.height;
    final screenWidth = size.width;
    BrandsManageController brandsManageController =
        Get.put(BrandsManageController());
    ChangeLanguageToLocale changeController = Get.put(ChangeLanguageToLocale());

    return Scaffold(
      body: Stack(children: [
        Padding(
          padding: EdgeInsets.only(top: screenHeight * 0.1),
          child: Align(
              alignment: Alignment.topCenter,
              child: FutureBuilder(
                future: brandsManageController.getAllDataBrands(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  var data = snapshot.data;
                  if (data == null) {
                    return Align(
                      alignment: Alignment.center,
                      child: Padding(
                          padding: EdgeInsets.only(top: screenHeight * 0.1),
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
                                          fontSize: screenWidth * 0.015,
                                          fontWeight: FontWeight.w900),
                                      textAlign: TextAlign.center,
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
                                    fontSize: screenWidth * 0.012,
                                    fontWeight: FontWeight.w500),
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

                          brandsManageController.brands.id_brands =
                              snapshot.data['data'][i]['id_brand'].toString();
                          brandsManageController.brands.name_brand_ar = snapshot
                              .data['data'][i]['name_brand_ar']
                              .toString();

                          brandsManageController.brands.name_brand_en = snapshot
                              .data['data'][i]['name_brand_en']
                              .toString();
                          brandsManageController.brands.image_brand = snapshot
                              .data['data'][i]['image_brand']
                              .toString();

                          ///

                          return Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 2, horizontal: 2),
                            child: InkWell(
                              onTap: () async {
                                ////////////////
                                brandsManageController.brands.id_brands =
                                    snapshot.data['data'][i]['id_brand']
                                        .toString();
                                brandsManageController.brands.name_brand_ar =
                                    snapshot.data['data'][i]['name_brand_ar']
                                        .toString();

                                brandsManageController.brands.name_brand_en =
                                    snapshot.data['data'][i]['name_brand_en']
                                        .toString();
                                brandsManageController.brands.image_brand =
                                    snapshot.data['data'][i]['image_brand']
                                        .toString();
                                brandsManageController.showTheOptions.value =
                                    true;

                                /////////////////////
                              },
                              child: AnimatedContainer(
                                  duration: Duration(milliseconds: 1200),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            Color.fromARGB(255, 248, 245, 245)
                                                .withOpacity(0.7),
                                        spreadRadius: 10,
                                        blurRadius: 10,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  width: screenWidth * 0.10,
                                  height: screenHeight * 0.20,
                                  child: Stack(
                                    children: [
                                      Align(
                                          alignment: Alignment.topCenter,
                                          child: changeController
                                                      .isChange.value ==
                                                  false
                                              ? Text(
                                                  ("${brandsManageController.brands.name_brand_ar}"),
                                                  style: TextStyle(
                                                    fontFamily: 'Cairo',
                                                    color: Colors.black,
                                                    fontSize:
                                                        screenWidth * 0.014,
                                                    fontWeight: FontWeight.w700,
                                                  ))
                                              : Text(
                                                  ("${brandsManageController.brands.name_brand_en}"),
                                                  style: TextStyle(
                                                    fontFamily: 'Cairo',
                                                    color: Colors.black,
                                                    fontSize:
                                                        screenWidth * 0.014,
                                                    fontWeight: FontWeight.w700,
                                                  ))),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              top: screenHeight * 0.06),
                                          child: Align(
                                            alignment: Alignment.topCenter,
                                            child: Container(
                                              width: screenWidth * 0.60,
                                              height: screenHeight * 0.18,
                                              child: Image.network(
                                                "${brandsManageController.brands.image_brand}",
                                                width: screenWidth * 0.60,
                                                height: screenHeight * 0.18,
                                              ),
                                            ),
                                          )),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            bottom: screenHeight * 0.00),
                                        child: Align(
                                            alignment: Alignment.bottomCenter,
                                            child: InkWell(
                                              onTap: () {
                                                brandsManageController
                                                        .brands.id_brands =
                                                    snapshot.data['data'][i]
                                                            ['id_brand']
                                                        .toString();
                                                brandsManageController
                                                        .brands.name_brand_ar =
                                                    snapshot.data['data'][i]
                                                            ['name_brand_ar']
                                                        .toString();

                                                brandsManageController
                                                        .brands.name_brand_en =
                                                    snapshot.data['data'][i]
                                                            ['name_brand_en']
                                                        .toString();
                                                brandsManageController
                                                        .brands.image_brand =
                                                    snapshot.data['data'][i]
                                                            ['image_brand']
                                                        .toString();

                                                brandsManageController
                                                    .showTheOptions
                                                    .value = true;
                                              },
                                              child: Container(
                                                  width: screenWidth * 0.25,
                                                  height: screenHeight / 30,
                                                  decoration: BoxDecoration(
                                                      color: Colors.black,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              3)),
                                                  child: Center(
                                                    child: Text(
                                                      "352".tr,
                                                      style: TextStyle(
                                                        fontFamily: 'Cairo',
                                                        color: Color.fromARGB(
                                                            255, 252, 252, 252),
                                                        fontSize:
                                                            screenWidth * 0.011,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  )),
                                            )),
                                      ),
                                    ],
                                  )),
                            ),
                          );
                        },
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: (1 / 0.7),
                          crossAxisCount: 4,
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
              )),
        ),
        GetX<BrandsManageController>(
            builder: (controller) => Visibility(
                  visible: controller.showTheOptions.value,
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
                    Padding(
                      padding: EdgeInsets.only(top: screenHeight * 0.2),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: InkWell(
                          onTap: () {
                            controller.showTheOptions.value = false;
                          },
                          child: Container(
                            width: screenWidth * 0.3,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red,
                            ),
                            child: Text(
                              "X".tr,
                              style: TextStyle(
                                  fontFamily: 'Cairo',
                                  color: Colors.white,
                                  fontSize: screenWidth * 0.016,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: screenWidth * 0.3,
                        height: screenHeight * 0.23,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: Stack(children: [
                          Padding(
                            padding: EdgeInsets.only(top: screenHeight * 0.03),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                "معلومات حول الماركة".tr,
                                style: TextStyle(
                                    fontFamily: 'Cairo',
                                    color: Colors.black,
                                    fontSize: screenWidth * 0.018,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: screenHeight * 0.09),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                "القيام بحذف او تعديل الماركة".tr,
                                style: TextStyle(
                                    fontFamily: 'Cairo',
                                    color: Colors.black,
                                    fontSize: screenWidth * 0.014,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: screenWidth * 0.00),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: InkWell(
                                onTap: () {
                                  controller.showEditOptions.value = true;
                                },
                                child: Container(
                                  width: screenWidth * 0.1,
                                  decoration: BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.circular(2)),
                                  child: Text(
                                    "تعديل الماركة".tr,
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
                          Padding(
                            padding: EdgeInsets.only(right: screenWidth * 0.00),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: InkWell(
                                onTap: () {
                                  brandsManageController.deleteBrand(
                                      brandsManageController.brands.id_brands
                                          .toString());

                                  Future.delayed(Duration(seconds: 3),
                                      () async {
                                    Get.offAll(BrandsDeskTopWidget());
                                  });
                                },
                                child: Container(
                                  width: screenWidth * 0.1,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(2)),
                                  child: Text(
                                    "حذف الماركة".tr,
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

        //////////////////////////////////Edit ////////////////////////////

        GetX<BrandsManageController>(
            builder: (controller) => Visibility(
                visible: controller.showEditOptions.value,
                child: Container(
                    width: screenWidth,
                    height: screenHeight,
                    color: Colors.white,
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: screenHeight * 0.02,
                              right: screenWidth * 0.02),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: InkWell(
                              onTap: () {
                                controller.showEditOptions.value = false;
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: screenWidth * 0.15,
                                height: screenHeight / 20,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text(
                                  "الاخفاء",
                                  style: TextStyle(
                                      fontFamily: 'Cairo',
                                      color: Colors.white,
                                      fontSize: screenWidth * 0.014,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                        ),
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
                                        "تعديل الماركة".tr,
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
                                  SizedBox(
                                    height: screenHeight * 0.05,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      controller.chooseImageOne();
                                    },
                                    child: GetX<BrandsManageController>(
                                        builder: (controller) => Container(
                                              width: screenWidth * 0.15,
                                              height: screenHeight * 0.05,
                                              decoration: BoxDecoration(
                                                  color: controller
                                                          .isUploadimage.value
                                                      ? Colors.green
                                                      : Colors.red,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Center(
                                                child: Text(
                                                  controller.isUploadimage.value
                                                      ? "تم رفع الصورة بنجاح"
                                                      : "رفع صورة",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize:
                                                          screenWidth * 0.010),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            )),
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.03,
                                  ),
                                  Container(
                                    width: screenWidth * 0.50,
                                    child: TextFormFiledCusDeskTop(
                                      keyboardType: TextInputType.name,
                                      controllerData: controller.nameBrandsAr,
                                      value: (value) {
                                        controller.brands.name_brand_ar =
                                            value.toString();

                                        return null;
                                      },
                                      hintData: "اسم الماركة".tr,
                                      iconData: Icons.menu_book,
                                      labelData: "اسم الماركة".tr,
                                      fillColor:
                                          Color.fromARGB(255, 48, 47, 47),
                                      iconColor: Colors.white,
                                      hintColor: Colors.red,
                                      fontColor: Colors.white,
                                      borderSideColor:
                                          Color.fromARGB(255, 48, 47, 47),
                                    ),
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.05,
                                  ),
                                  Container(
                                    width: screenWidth * 0.50,
                                    child: TextFormFiledCusDeskTop(
                                      keyboardType: TextInputType.name,
                                      controllerData: controller.nameBrandsEn,
                                      value: (value) {
                                        controller.brands.name_brand_en =
                                            value.toString();
                                        return null;
                                      },
                                      hintData: "اسم الماركة انجليزي".tr,
                                      iconData: Icons.menu_book,
                                      labelData: "اسم الماركة انجليزي".tr,
                                      fillColor:
                                          Color.fromARGB(255, 48, 47, 47),
                                      iconColor: Colors.white,
                                      hintColor: Colors.red,
                                      fontColor: Colors.white,
                                      borderSideColor:
                                          Color.fromARGB(255, 48, 47, 47),
                                    ),
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.05,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      controller.editTheBrands(
                                          controller.brands.name_brand_ar
                                              .toString(),
                                          controller.brands.name_brand_en
                                              .toString(),
                                          controller.brands.image_brand
                                              .toString(),
                                          controller.brands.id_brands
                                              .toString());

                                      controller.isAddIntoDatabase.value = true;
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          bottom: screenHeight * 0.05),
                                      child: Container(
                                        width: screenWidth * 0.15,
                                        height: screenHeight * 0.05,
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 251, 189, 1),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Center(
                                          child: Text(
                                            "تعديل الماركة".tr,
                                            style: TextStyle(
                                                fontFamily: 'Cairo',
                                                color: Colors.black,
                                                fontSize: screenWidth * 0.012),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        GetX<BrandsManageController>(
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
                        GetX<BrandsManageController>(
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
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Stack(children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: screenHeight * 0.03),
                                            child: Align(
                                              alignment: Alignment.topCenter,
                                              child: Text(
                                                "لقد تم تعديل الماركة بنجاح "
                                                    .tr,
                                                style: TextStyle(
                                                    fontFamily: 'Cairo',
                                                    color: Colors.white,
                                                    fontSize:
                                                        screenWidth * 0.018,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                right: screenWidth * 0.00),
                                            child: Align(
                                              alignment: Alignment.bottomCenter,
                                              child: InkWell(
                                                onTap: () {
                                                  controller.isUploadimage
                                                      .value = false;
                                                  controller.isAddIntoDatabase
                                                      .value = false;
                                                  controller.showEditOptions
                                                      .value = false;
                                                  Get.offAll(HomeDeskTop());
                                                },
                                                child: Container(
                                                  width: screenWidth * 0.1,
                                                  decoration: BoxDecoration(
                                                      color: Colors.red,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              2)),
                                                  child: Text(
                                                    "العودة للرئيسية".tr,
                                                    style: TextStyle(
                                                        fontFamily: 'Cairo',
                                                        color: Colors.white,
                                                        fontSize:
                                                            screenWidth * 0.012,
                                                        fontWeight:
                                                            FontWeight.w500),
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
                      ],
                    )))),

        ///////////////////////////
      ]),
    );
  }
}
