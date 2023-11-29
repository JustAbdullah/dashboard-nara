import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nara_dashboard/widgets/mobile_widgets/textfiled_mobile/textformfiled_cut.dart';

import '../../../controller/colors_manage_controller.dart';
import '../../../localization/changelanguage.dart';
import '../../menu/menu.dart';

class ManageMobileColors extends StatelessWidget {
  const ManageMobileColors({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenHeight = size.height;
    final screenWidth = size.width;
    ChangeLanguageToLocale changeController = Get.put(ChangeLanguageToLocale());
    ColorsManageController colorsManageController =
        Get.put(ColorsManageController());

    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.02),
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                "قائمة الالوان".tr,
                style: TextStyle(
                    fontFamily: 'Cairo',
                    color: Colors.black,
                    fontSize: screenWidth * 0.040,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(
                  top: screenHeight * (0.1 + 0.0),
                  bottom: screenHeight * 0.02,
                  right: changeController.isChange.value == false
                      ? screenWidth * 0.07
                      : 0,
                  left: changeController.isChange.value == false
                      ? 0
                      : screenWidth * 0.07),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: screenWidth * 0.85,
                    height: screenHeight * 0.60,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Stack(children: [
                      Align(
                          alignment: changeController.isChange.value == false
                              ? Alignment.topRight
                              : Alignment.topLeft,
                          child: Padding(
                              padding: EdgeInsets.only(
                                  top: screenHeight * 0.01,
                                  right:
                                      changeController.isChange.value == false
                                          ? screenWidth * 0.034
                                          : 0,
                                  left: changeController.isChange.value == false
                                      ? 0
                                      : screenWidth * 0.034),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "اسم اللون".tr,
                                    style: TextStyle(
                                        fontFamily: 'Cairo',
                                        color: Colors.black,
                                        fontSize: screenWidth * 0.032,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.12,
                                  ),
                                  Text(
                                    "كود اللون".tr,
                                    style: TextStyle(
                                        fontFamily: 'Cairo',
                                        color: Colors.black,
                                        fontSize: screenWidth * 0.032,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.12,
                                  ),
                                  Text(
                                    "اللون".tr,
                                    style: TextStyle(
                                        fontFamily: 'Cairo',
                                        color: Colors.black,
                                        fontSize: screenWidth * 0.032,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.12,
                                  ),
                                  Text(
                                    "التحكم".tr,
                                    style: TextStyle(
                                        fontFamily: 'Cairo',
                                        color: Colors.black,
                                        fontSize: screenWidth * 0.032,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ))),
                      Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                              padding: EdgeInsets.only(
                                top: screenHeight * 0.06,
                              ),
                              child: Container(
                                width: screenWidth,
                                height: screenHeight * 0.0002,
                                color: Colors.black26,
                              ))),
                      Padding(
                        padding: EdgeInsets.only(
                          top: screenHeight * 0.05,
                        ),
                        child: FutureBuilder(
                          future: colorsManageController.getAllDataColors(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
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
                                            width: screenWidth * 0.3,
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
                                                        screenWidth * 0.035,
                                                    fontWeight:
                                                        FontWeight.w900),
                                                textAlign: TextAlign.center,
                                              ),
                                            )),
                                        SizedBox(
                                          height: screenHeight * 0.06,
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
                              return ListView.builder(
                                  itemCount: snapshot.data['data'].length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, i) {
                                    colorsManageController.color.id_color =
                                        snapshot.data['data'][i]['id_color']
                                            .toString();
                                    colorsManageController.color.color_name =
                                        snapshot.data['data'][i]['color_name']
                                            .toString();
                                    colorsManageController.color.color_name =
                                        snapshot.data['data'][i]['color']
                                            .toString();

                                    return InkWell(
                                        onTap: () {
                                          colorsManageController.color
                                              .id_color = snapshot.data['data']
                                                  [i]['id_color']
                                              .toString();
                                          colorsManageController
                                                  .color.color_name =
                                              snapshot.data['data'][i]
                                                      ['color_name']
                                                  .toString();
                                          colorsManageController
                                                  .color.color_name =
                                              snapshot.data['data'][i]['color']
                                                  .toString();
                                          colorsManageController
                                              .showOptions.value = true;
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            top: screenHeight * 0.01,
                                          ),
                                          child: Container(
                                            width: screenWidth,
                                            height: screenHeight * 0.1,
                                            decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 238, 236, 236)),
                                            child: Stack(children: [
                                              Align(
                                                  alignment: changeController
                                                              .isChange.value ==
                                                          false
                                                      ? Alignment.topRight
                                                      : Alignment.topLeft,
                                                  child: Padding(
                                                      padding: EdgeInsets.only(
                                                          top: screenHeight *
                                                              0.03,
                                                          right: changeController
                                                                      .isChange
                                                                      .value ==
                                                                  false
                                                              ? screenWidth *
                                                                  0.08
                                                              : 0,
                                                          left: changeController
                                                                      .isChange
                                                                      .value ==
                                                                  false
                                                              ? 0
                                                              : screenWidth *
                                                                  0.049),
                                                      child: Text(
                                                        "${snapshot.data['data'][i]['color_name'].toString()}",
                                                        style: TextStyle(
                                                            fontFamily: 'Cairo',
                                                            color: Colors.black,
                                                            fontSize:
                                                                screenWidth *
                                                                    0.033,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ))),
                                              Align(
                                                  alignment: changeController
                                                              .isChange.value ==
                                                          false
                                                      ? Alignment.topRight
                                                      : Alignment.topLeft,
                                                  child: Padding(
                                                      padding: EdgeInsets.only(
                                                          top: screenHeight *
                                                              0.01,
                                                          right: changeController
                                                                      .isChange
                                                                      .value ==
                                                                  false
                                                              ? screenWidth *
                                                                  0.24
                                                              : 0,
                                                          left: changeController
                                                                      .isChange
                                                                      .value ==
                                                                  false
                                                              ? 0
                                                              : screenWidth *
                                                                  0.11),
                                                      child: Text(
                                                        "${snapshot.data['data'][i]['color'].toString()}",
                                                        style: TextStyle(
                                                            fontFamily: 'Cairo',
                                                            color: Colors.black,
                                                            fontSize:
                                                                screenWidth *
                                                                    0.033,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ))),
                                              Align(
                                                  alignment: changeController
                                                              .isChange.value ==
                                                          false
                                                      ? Alignment.topRight
                                                      : Alignment.topLeft,
                                                  child: Padding(
                                                      padding: EdgeInsets.only(
                                                          top: screenHeight *
                                                              0.01,
                                                          right: changeController
                                                                      .isChange
                                                                      .value ==
                                                                  false
                                                              ? screenWidth *
                                                                  0.5
                                                              : 0,
                                                          left: changeController
                                                                      .isChange
                                                                      .value ==
                                                                  false
                                                              ? 0
                                                              : screenWidth *
                                                                  0.195),
                                                      child: Container(
                                                        width:
                                                            screenWidth * 0.05,
                                                        decoration: BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color: Color(int.parse(
                                                                "${snapshot.data['data'][i]['color'].toString()}"))),
                                                      ))),
                                              Align(
                                                  alignment: changeController
                                                              .isChange.value ==
                                                          false
                                                      ? Alignment.topRight
                                                      : Alignment.topLeft,
                                                  child: Padding(
                                                      padding: EdgeInsets.only(
                                                          top: screenHeight *
                                                              0.01,
                                                          right: changeController
                                                                      .isChange
                                                                      .value ==
                                                                  false
                                                              ? screenWidth *
                                                                  0.63
                                                              : 0,
                                                          left: changeController
                                                                      .isChange
                                                                      .value ==
                                                                  false
                                                              ? 0
                                                              : screenWidth *
                                                                  0.75),
                                                      child: InkWell(
                                                        onTap: () {
                                                          colorsManageController
                                                              .showOptions
                                                              .value = true;
                                                        },
                                                        child: Container(
                                                          width: screenWidth *
                                                              0.15,
                                                          height: screenHeight *
                                                              0.07,
                                                          decoration: BoxDecoration(
                                                              color: Colors.red,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                          child: Center(
                                                            child: Text(
                                                              "222".tr,
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      'Cairo',
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      screenWidth *
                                                                          0.030,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                          ),
                                                        ),
                                                      ))),
                                            ]),
                                          ),
                                        ));
                                  });
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
                      ),
                    ]),
                  ))),
          Padding(
            padding: EdgeInsets.only(bottom: screenHeight * 0.04),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: () {
                  colorsManageController.isWantAddColor.value = true;
                },
                child: Container(
                  width: screenWidth * 0.35,
                  decoration: BoxDecoration(
                      color: Colors.green[700],
                      borderRadius: BorderRadius.circular(2)),
                  child: Text(
                    "إضافة لون جديد".tr,
                    style: TextStyle(
                        fontFamily: 'Cairo',
                        color: Colors.white,
                        fontSize: screenWidth * 0.037,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),

          GetX<ColorsManageController>(
              builder: (controller) => Visibility(
                    visible: controller.showOptions.value,
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
                              controller.showOptions.value = false;
                            },
                            child: Container(
                              width: screenWidth * 0.5,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.red,
                              ),
                              child: Text(
                                "X".tr,
                                style: TextStyle(
                                    fontFamily: 'Cairo',
                                    color: Colors.white,
                                    fontSize: screenWidth * 0.036,
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
                          width: screenWidth * 0.6,
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
                                  "معلومات حول اللون".tr,
                                  style: TextStyle(
                                      fontFamily: 'Cairo',
                                      color: Colors.black,
                                      fontSize: screenWidth * 0.038,
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
                                  "القيام بحذف او تعديل اللون".tr,
                                  style: TextStyle(
                                      fontFamily: 'Cairo',
                                      color: Colors.black,
                                      fontSize: screenWidth * 0.034,
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
                                    controller.editTheColors.value = true;
                                  },
                                  child: Container(
                                    width: screenWidth * 0.25,
                                    decoration: BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius: BorderRadius.circular(2)),
                                    child: Text(
                                      "تعديل اللون".tr,
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
                                    Future.delayed(Duration(milliseconds: 700),
                                        () async {
                                      controller.deleteColor(
                                          controller.color.id_color.toString());
                                      Get.offAll(ManageMobileColors());
                                      controller.showOptions.value = false;
                                    });
                                  },
                                  child: Container(
                                    width: screenWidth * 0.25,
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(2)),
                                    child: Text(
                                      "حذف اللون".tr,
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

          ///////////////////////////////////////////////////
          Padding(
            padding: EdgeInsets.only(bottom: screenHeight * 0.04),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: () {
                  colorsManageController.isWantAddColor.value = true;
                },
                child: Container(
                  width: screenWidth * 0.45,
                  decoration: BoxDecoration(
                      color: Colors.green[700],
                      borderRadius: BorderRadius.circular(2)),
                  child: Text(
                    "إضافة لون جديد".tr,
                    style: TextStyle(
                        fontFamily: 'Cairo',
                        color: Colors.white,
                        fontSize: screenWidth * 0.037,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),

          GetX<ColorsManageController>(
              builder: (controller) => Visibility(
                    visible: controller.isWantAddColor.value,
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
                        padding: EdgeInsets.only(top: screenHeight * 0.05),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: InkWell(
                            onTap: () {
                              controller.isWantAddColor.value = false;
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
                                    fontSize: screenWidth * 0.036,
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
                          height: screenHeight * 0.53,
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
                                  "إضافة لون جديد".tr,
                                  style: TextStyle(
                                      fontFamily: 'Cairo',
                                      color: Colors.black,
                                      fontSize: screenWidth * 0.038,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: screenWidth * 0.50,
                            child: TextFormFiledCus(
                              keyboardType: TextInputType.name,
                              controllerData: controller.nameColor,
                              value: (value) {
                                controller.nameTheColor = value.toString();

                                return null;
                              },
                              hintData: "اسم اللون".tr,
                              iconData: Icons.menu_book,
                              labelData: "اسم اللون".tr,
                              fillColor: Color.fromARGB(255, 48, 47, 47),
                              iconColor: Colors.white,
                              hintColor: Colors.red,
                              fontColor: Colors.white,
                              borderSideColor: Color.fromARGB(255, 48, 47, 47),
                            ),
                          )),
                      Padding(
                        padding: EdgeInsets.only(top: screenHeight * 0.2),
                        child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: screenWidth * 0.50,
                              child: TextFormFiledCus(
                                keyboardType: TextInputType.name,
                                controllerData: controller.codeColor,
                                value: (value) {
                                  controller.codeTheColor = value.toString();

                                  return null;
                                },
                                hintData: "كود اللون".tr,
                                iconData: Icons.menu_book,
                                labelData: "كود اللون".tr,
                                fillColor: Color.fromARGB(255, 48, 47, 47),
                                iconColor: Colors.white,
                                hintColor: Colors.red,
                                fontColor: Colors.white,
                                borderSideColor:
                                    Color.fromARGB(255, 48, 47, 47),
                              ),
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: screenHeight * 0.04),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: InkWell(
                            onTap: () {
                              controller.addTheColors(
                                  controller.nameTheColor.toString(),
                                  controller.codeTheColor.toString());
                              Get.offAll(ManageMobileColors());
                              controller.isWantAddColor.value = false;
                            },
                            child: Container(
                              width: screenWidth * 0.45,
                              decoration: BoxDecoration(
                                  color: Colors.amber[700],
                                  borderRadius: BorderRadius.circular(2)),
                              child: Text(
                                "الإضافة",
                                style: TextStyle(
                                    fontFamily: 'Cairo',
                                    color: Colors.white,
                                    fontSize: screenWidth * 0.037,
                                    fontWeight: FontWeight.w500),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  )),
          ///////////////////////////////

          GetX<ColorsManageController>(
              builder: (controller) => Visibility(
                    visible: controller.editTheColors.value,
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
                        padding: EdgeInsets.only(top: screenHeight * 0.05),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: InkWell(
                            onTap: () {
                              controller.editTheColors.value = false;
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
                                    fontSize: screenWidth * 0.036,
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
                          height: screenHeight * 0.53,
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
                                  "تعديل اللون".tr,
                                  style: TextStyle(
                                      fontFamily: 'Cairo',
                                      color: Colors.black,
                                      fontSize: screenWidth * 0.038,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: screenWidth * 0.50,
                            child: TextFormFiledCus(
                              keyboardType: TextInputType.name,
                              controllerData: controller.nameColor,
                              value: (value) {
                                controller.nameTheColor = value.toString();

                                return null;
                              },
                              hintData: "اسم اللون".tr,
                              iconData: Icons.menu_book,
                              labelData: "اسم اللون".tr,
                              fillColor: Color.fromARGB(255, 48, 47, 47),
                              iconColor: Colors.white,
                              hintColor: Colors.red,
                              fontColor: Colors.white,
                              borderSideColor: Color.fromARGB(255, 48, 47, 47),
                            ),
                          )),
                      Padding(
                        padding: EdgeInsets.only(top: screenHeight * 0.2),
                        child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: screenWidth * 0.50,
                              child: TextFormFiledCus(
                                keyboardType: TextInputType.name,
                                controllerData: controller.codeColor,
                                value: (value) {
                                  controller.codeTheColor = value.toString();

                                  return null;
                                },
                                hintData: "كود اللون".tr,
                                iconData: Icons.menu_book,
                                labelData: "كود اللون".tr,
                                fillColor: Color.fromARGB(255, 48, 47, 47),
                                iconColor: Colors.white,
                                hintColor: Colors.red,
                                fontColor: Colors.white,
                                borderSideColor:
                                    Color.fromARGB(255, 48, 47, 47),
                              ),
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: screenHeight * 0.04),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: InkWell(
                            onTap: () {
                              if (controller.nameTheColor == "0" ||
                                  controller.nameTheColor == null) {
                                controller.nameTheColor =
                                    controller.color.color_name.toString();
                              }
                              if (controller.codeTheColor == "0" ||
                                  controller.codeTheColor == null) {
                                controller.codeTheColor =
                                    controller.color.color.toString();
                              }
                              controller.editNewTheColors(
                                  controller.color.id_color.toString(),
                                  controller.nameTheColor.toString(),
                                  controller.codeTheColor.toString());
                              Get.offAll(ManageMobileColors());
                              controller.editTheColors.value = false;
                            },
                            child: Container(
                              width: screenWidth * 0.35,
                              decoration: BoxDecoration(
                                  color: Colors.amber[700],
                                  borderRadius: BorderRadius.circular(2)),
                              child: Text(
                                "التعديل",
                                style: TextStyle(
                                    fontFamily: 'Cairo',
                                    color: Colors.white,
                                    fontSize: screenWidth * 0.037,
                                    fontWeight: FontWeight.w500),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  )),
          ///////////////////////////

          TheMenu(),
          ///////////////////////////////////////////////////////
        ],
      ),
    );
  }
}
