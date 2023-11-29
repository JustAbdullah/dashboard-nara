import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nara_dashboard/widgets/mobile_widgets/home_mobile/home_mobile.dart';

import '../../../controller/celebs_controller.dart';
import '../../../localization/changelanguage.dart';
import '../../menu/menu.dart';
import '../textfiled_mobile/textformfiled_cut.dart';

class CelebsMobileWidget extends StatelessWidget {
  const CelebsMobileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenHeight = size.height;
    final screenWidth = size.width;
    CelebsManageController celebsManageController =
        Get.put(CelebsManageController());
    ChangeLanguageToLocale changeController = Get.put(ChangeLanguageToLocale());

    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.1),
            child: Align(
                alignment: Alignment.topCenter,
                child: FutureBuilder(
                  future: celebsManageController.getAllDataCelebs(),
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
                                    width: screenWidth * 0.3,
                                    height: screenHeight * 0.3,
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
                                      fontSize: screenWidth * 0.032,
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

                            celebsManageController.celebs.id_celebrities =
                                snapshot.data['data'][i]['id_celebrities']
                                    .toString();
                            celebsManageController.celebs.name_celebrities =
                                snapshot.data['data'][i]['name_celebrities']
                                    .toString();

                            celebsManageController.celebs.name_celebrities_en =
                                snapshot.data['data'][i]['name_celebrities_en']
                                    .toString();
                            celebsManageController.celebs.image_celebrities =
                                snapshot.data['data'][i]['image_celebrities']
                                    .toString();
                            celebsManageController.celebs.date_of_add = snapshot
                                .data['data'][i]['date_of_brand']
                                .toString();

                            ///

                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 2),
                              child: InkWell(
                                onTap: () async {
                                  ////////////////
                                  celebsManageController.celebs.id_celebrities =
                                      snapshot.data['data'][i]['id_celebrities']
                                          .toString();
                                  celebsManageController.celebs
                                      .name_celebrities = snapshot.data['data']
                                          [i]['name_celebrities']
                                      .toString();

                                  celebsManageController
                                          .celebs.name_celebrities_en =
                                      snapshot.data['data'][i]
                                              ['name_celebrities_en']
                                          .toString();
                                  celebsManageController.celebs
                                      .image_celebrities = snapshot.data['data']
                                          [i]['image_celebrities']
                                      .toString();
                                  celebsManageController.celebs.date_of_add =
                                      snapshot.data['data'][i]['date_of_brand']
                                          .toString();
                                  celebsManageController.showTheOptions.value =
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
                                          offset: Offset(0,
                                              3), // changes position of shadow
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
                                                    ("${celebsManageController.celebs.name_celebrities}"),
                                                    style: TextStyle(
                                                      fontFamily: 'Cairo',
                                                      color: Colors.black,
                                                      fontSize:
                                                          screenWidth * 0.034,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ))
                                                : Text(
                                                    ("${celebsManageController.celebs.name_celebrities_en}"),
                                                    style: TextStyle(
                                                      fontFamily: 'Cairo',
                                                      color: Colors.black,
                                                      fontSize:
                                                          screenWidth * 0.034,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ))),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                top: screenHeight * 0.04),
                                            child: Align(
                                              alignment: Alignment.topCenter,
                                              child: Container(
                                                width: screenWidth * 0.40,
                                                height: screenHeight * 0.18,
                                                child: Image.network(
                                                  "${celebsManageController.celebs.image_celebrities}",
                                                  width: screenWidth * 0.40,
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
                                                  celebsManageController.celebs
                                                          .id_celebrities =
                                                      snapshot.data['data'][i]
                                                              ['id_celebrities']
                                                          .toString();
                                                  celebsManageController.celebs
                                                          .name_celebrities =
                                                      snapshot.data['data'][i][
                                                              'name_celebrities']
                                                          .toString();

                                                  celebsManageController.celebs
                                                          .name_celebrities_en =
                                                      snapshot.data['data'][i][
                                                              'name_celebrities_en']
                                                          .toString();
                                                  celebsManageController.celebs
                                                          .image_celebrities =
                                                      snapshot.data['data'][i][
                                                              'image_celebrities']
                                                          .toString();
                                                  celebsManageController
                                                          .celebs.date_of_add =
                                                      snapshot.data['data'][i]
                                                              ['date_of_brand']
                                                          .toString();

                                                  celebsManageController
                                                      .showTheOptions
                                                      .value = true;
                                                },
                                                child: Container(
                                                    width: screenWidth * 0.35,
                                                    height: screenHeight / 30,
                                                    decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(3)),
                                                    child: Center(
                                                      child: Text(
                                                        "352".tr,
                                                        style: TextStyle(
                                                          fontFamily: 'Cairo',
                                                          color: Color.fromARGB(
                                                              255,
                                                              252,
                                                              252,
                                                              252),
                                                          fontSize:
                                                              screenWidth *
                                                                  0.031,
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
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: (1 / 0.7),
                            crossAxisCount: 2,
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
          GetX<CelebsManageController>(
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
                              width: screenWidth * 0.4,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.red,
                              ),
                              child: Text(
                                "X".tr,
                                style: TextStyle(
                                    fontFamily: 'Cairo',
                                    color: Colors.white,
                                    fontSize: screenWidth * 0.046,
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
                          width: screenWidth * 0.7,
                          height: screenHeight * 0.23,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          child: Stack(children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(top: screenHeight * 0.03),
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Text(
                                  "معلومات حول المشهور".tr,
                                  style: TextStyle(
                                      fontFamily: 'Cairo',
                                      color: Colors.black,
                                      fontSize: screenWidth * 0.048,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(top: screenHeight * 0.09),
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Text(
                                  "القيام بحذف او تعديل المشهور".tr,
                                  style: TextStyle(
                                      fontFamily: 'Cairo',
                                      color: Colors.black,
                                      fontSize: screenWidth * 0.044,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: screenWidth * 0.00),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: InkWell(
                                  onTap: () {
                                    controller.showEditOptions.value = true;
                                  },
                                  child: Container(
                                    width: screenWidth * 0.25,
                                    decoration: BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius: BorderRadius.circular(2)),
                                    child: Text(
                                      "تعديل المشهور".tr,
                                      style: TextStyle(
                                          fontFamily: 'Cairo',
                                          color: Colors.white,
                                          fontSize: screenWidth * 0.032,
                                          fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(right: screenWidth * 0.00),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: InkWell(
                                  onTap: () {
                                    celebsManageController.deleteCeleb(
                                        celebsManageController
                                            .celebs.id_celebrities
                                            .toString());

                                    Future.delayed(Duration(milliseconds: 1400),
                                        () async {
                                      Get.offAll(CelebsMobileWidget());
                                    });
                                  },
                                  child: Container(
                                    width: screenWidth * 0.25,
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(2)),
                                    child: Text(
                                      "حذف المشهور".tr,
                                      style: TextStyle(
                                          fontFamily: 'Cairo',
                                          color: Colors.white,
                                          fontSize: screenWidth * 0.032,
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

          TheMenu(), /////////////////////////////Edit ////////////////////////////////

          GetX<CelebsManageController>(
              builder: (controller) => Visibility(
                  visible: controller.showEditOptions.value,
                  child: Container(
                    height: screenHeight,
                    width: screenWidth,
                    color: Colors.white,
                    child: Stack(children: [
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
                              width: screenWidth * 0.25,
                              height: screenHeight / 20,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                "إخفاء",
                                style: TextStyle(
                                    fontFamily: 'Cairo',
                                    color: Colors.white,
                                    fontSize: screenWidth * 0.034,
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
                                      "تعديل مشهور".tr,
                                      style: TextStyle(
                                        fontFamily: 'Cairo',
                                        color: Colors.white,
                                        fontSize: screenWidth * 0.035,
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
                                  child: GetX<CelebsManageController>(
                                      builder: (controller) => Container(
                                            width: screenWidth * 0.35,
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
                                                    : "رفع الصورة",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize:
                                                        screenWidth * 0.030),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          )),
                                ),
                                SizedBox(
                                  height: screenHeight * 0.03,
                                ),
                                Container(
                                  width: screenWidth * 0.70,
                                  child: TextFormFiledCus(
                                    keyboardType: TextInputType.name,
                                    controllerData: controller.nameCelebsAr,
                                    value: (value) {
                                      controller.celebs.name_celebrities =
                                          value.toString();

                                      return null;
                                    },
                                    hintData: "اسم المشهور بالعربي".tr,
                                    iconData: Icons.menu_book,
                                    labelData: "اسم المشهور بالعربي".tr,
                                    fillColor: Color.fromARGB(255, 48, 47, 47),
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
                                  width: screenWidth * 0.70,
                                  child: TextFormFiledCus(
                                    keyboardType: TextInputType.name,
                                    controllerData: controller.nameCelebsEn,
                                    value: (value) {
                                      controller.celebs.name_celebrities_en =
                                          value.toString();
                                      return null;
                                    },
                                    hintData: "اسم المشهور بالانجليزي".tr,
                                    iconData: Icons.menu_book,
                                    labelData: "اسم المشهور بالانجليزي".tr,
                                    fillColor: Color.fromARGB(255, 48, 47, 47),
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
                                    controller.editTheCelebs(
                                      controller.celebs.name_celebrities
                                          .toString(),
                                      controller.celebs.name_celebrities_en
                                          .toString(),
                                      controller.celebs.image_celebrities
                                          .toString(),
                                      controller.celebs.id_celebrities
                                          .toString(),
                                    );
                                    controller.isAddIntoDatabase.value = true;
                                    Get.offAll(CelebsMobileWidget());
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        bottom: screenHeight * 0.05),
                                    child: Container(
                                      width: screenWidth * 0.35,
                                      height: screenHeight * 0.05,
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 251, 189, 1),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Center(
                                        child: Text(
                                          "تعديل المشهور".tr,
                                          style: TextStyle(
                                              fontFamily: 'Cairo',
                                              color: Colors.black,
                                              fontSize: screenWidth * 0.032),
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
                      GetX<CelebsManageController>(
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
                                          fontSize: screenWidth * 0.038,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ]),
                              )),
                      GetX<CelebsManageController>(
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
                                      width: screenWidth * 0.6,
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
                                              "لقد تم تعديل المشهور بنجاح ".tr,
                                              style: TextStyle(
                                                  fontFamily: 'Cairo',
                                                  color: Colors.white,
                                                  fontSize: screenWidth * 0.038,
                                                  fontWeight: FontWeight.w500),
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
                                                controller.isUploadimage.value =
                                                    false;
                                                controller.isAddIntoDatabase
                                                    .value = false;
                                                controller.showEditOptions
                                                    .value = false;
                                                Get.offAll(HomeMobile());
                                              },
                                              child: Container(
                                                width: screenWidth * 0.3,
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
                                                          screenWidth * 0.032,
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
                    ]),
                  ))),

          ////////////////////////////////////////////////////////////////////////////////////////
        ],
      ),
    );
  }
}
