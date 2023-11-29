import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/colors_manage_controller.dart';
import '../../../../localization/changelanguage.dart';
import '../../../controller/manage_sizes_controller.dart';
import '../../menu/menu.dart';
import '../textfiled/textformfiled_widget_desktop/textformfiled_cut.dart';

class ManageDeskTopSizes extends StatelessWidget {
  const ManageDeskTopSizes({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenHeight = size.height;
    final screenWidth = size.width;
    ChangeLanguageToLocale changeController = Get.put(ChangeLanguageToLocale());
    SizesManageController sizesManageController =
        Get.put(SizesManageController());

    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.02),
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                "قائمة الأحجام".tr,
                style: TextStyle(
                    fontFamily: 'Cairo',
                    color: Colors.black,
                    fontSize: screenWidth * 0.020,
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
                    width: screenWidth * 0.35,
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
                                    "معرف الحجم".tr,
                                    style: TextStyle(
                                        fontFamily: 'Cairo',
                                        color: Colors.black,
                                        fontSize: screenWidth * 0.012,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.06,
                                  ),
                                  Text(
                                    "الحجم".tr,
                                    style: TextStyle(
                                        fontFamily: 'Cairo',
                                        color: Colors.black,
                                        fontSize: screenWidth * 0.012,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.08,
                                  ),
                                  Text(
                                    "التحكم".tr,
                                    style: TextStyle(
                                        fontFamily: 'Cairo',
                                        color: Colors.black,
                                        fontSize: screenWidth * 0.012,
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
                          future: sizesManageController.getAllDataSizes(),
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
                                                        screenWidth * 0.015,
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
                                              fontSize: screenWidth * 0.012,
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
                                    sizesManageController.sizes.id_size =
                                        snapshot.data['data'][i]['id_size']
                                            .toString();
                                    sizesManageController.sizes.size = snapshot
                                        .data['data'][i]['size']
                                        .toString();

                                    return InkWell(
                                        onTap: () {
                                          sizesManageController.sizes.id_size =
                                              snapshot.data['data'][i]
                                                      ['id_size']
                                                  .toString();
                                          sizesManageController.sizes.size =
                                              snapshot.data['data'][i]['size']
                                                  .toString();
                                          sizesManageController
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
                                                              0.01,
                                                          right: changeController
                                                                      .isChange
                                                                      .value ==
                                                                  false
                                                              ? screenWidth *
                                                                  0.06
                                                              : 0,
                                                          left: changeController
                                                                      .isChange
                                                                      .value ==
                                                                  false
                                                              ? 0
                                                              : screenWidth *
                                                                  0.040),
                                                      child: Text(
                                                        "${snapshot.data['data'][i]['id_size'].toString()}",
                                                        style: TextStyle(
                                                            fontFamily: 'Cairo',
                                                            color: Colors.black,
                                                            fontSize:
                                                                screenWidth *
                                                                    0.013,
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
                                                                  0.15
                                                              : 0,
                                                          left: changeController
                                                                      .isChange
                                                                      .value ==
                                                                  false
                                                              ? 0
                                                              : screenWidth *
                                                                  0.11),
                                                      child: Text(
                                                        "${snapshot.data['data'][i]['size'].toString()}",
                                                        style: TextStyle(
                                                            fontFamily: 'Cairo',
                                                            color: Colors.black,
                                                            fontSize:
                                                                screenWidth *
                                                                    0.013,
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
                                                                  0.25
                                                              : 0,
                                                          left: changeController
                                                                      .isChange
                                                                      .value ==
                                                                  false
                                                              ? 0
                                                              : screenWidth *
                                                                  0.195),
                                                      child: InkWell(
                                                        onTap: () {
                                                          sizesManageController
                                                                  .sizes
                                                                  .id_size =
                                                              snapshot
                                                                  .data['data']
                                                                      [i][
                                                                      'id_size']
                                                                  .toString();
                                                          sizesManageController
                                                                  .sizes.size =
                                                              snapshot
                                                                  .data['data']
                                                                      [i]
                                                                      ['size']
                                                                  .toString();
                                                          sizesManageController
                                                              .showOptions
                                                              .value = true;
                                                        },
                                                        child: Container(
                                                          width: screenWidth *
                                                              0.05,
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
                                                                          0.010,
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
          GetX<SizesManageController>(
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
                              padding:
                                  EdgeInsets.only(top: screenHeight * 0.03),
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Text(
                                  "معلومات حول الحجم".tr,
                                  style: TextStyle(
                                      fontFamily: 'Cairo',
                                      color: Colors.black,
                                      fontSize: screenWidth * 0.018,
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
                                  "القيام بحذف او تعديل الحجم".tr,
                                  style: TextStyle(
                                      fontFamily: 'Cairo',
                                      color: Colors.black,
                                      fontSize: screenWidth * 0.014,
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
                                    controller.editTheSize.value = true;
                                  },
                                  child: Container(
                                    width: screenWidth * 0.1,
                                    decoration: BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius: BorderRadius.circular(2)),
                                    child: Text(
                                      "تعديل الحجم".tr,
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
                              padding:
                                  EdgeInsets.only(right: screenWidth * 0.00),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: InkWell(
                                  onTap: () {
                                    Future.delayed(Duration(milliseconds: 700),
                                        () async {
                                      controller.deleteSize(
                                          controller.sizes.id_size.toString());
                                      Get.offAll(ManageDeskTopSizes());
                                      controller.showOptions.value = false;
                                    });
                                  },
                                  child: Container(
                                    width: screenWidth * 0.1,
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(2)),
                                    child: Text(
                                      "حذف الحجم".tr,
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

          ///////////////////////////////////////////////////
          Padding(
            padding: EdgeInsets.only(bottom: screenHeight * 0.04),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: () {
                  sizesManageController.isWantAddSize.value = true;
                },
                child: Container(
                  width: screenWidth * 0.25,
                  decoration: BoxDecoration(
                      color: Colors.green[700],
                      borderRadius: BorderRadius.circular(2)),
                  child: Text(
                    "إضافة حجم جديد".tr,
                    style: TextStyle(
                        fontFamily: 'Cairo',
                        color: Colors.white,
                        fontSize: screenWidth * 0.017,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),

          GetX<SizesManageController>(
              builder: (controller) => Visibility(
                    visible: controller.isWantAddSize.value,
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
                              controller.isWantAddSize.value = false;
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
                          width: screenWidth * 0.7,
                          height: screenHeight * 0.43,
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
                                  "إضافة حجم جديد".tr,
                                  style: TextStyle(
                                      fontFamily: 'Cairo',
                                      color: Colors.black,
                                      fontSize: screenWidth * 0.018,
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
                            child: TextFormFiledCusDeskTop(
                              keyboardType: TextInputType.name,
                              controllerData: controller.size,
                              value: (value) {
                                controller.nameTheSize = value.toString();

                                return null;
                              },
                              hintData: " الحجم".tr,
                              iconData: Icons.menu_book,
                              labelData: "الحجم".tr,
                              fillColor: Color.fromARGB(255, 48, 47, 47),
                              iconColor: Colors.white,
                              hintColor: Colors.red,
                              fontColor: Colors.white,
                              borderSideColor: Color.fromARGB(255, 48, 47, 47),
                            ),
                          )),
                      Padding(
                        padding: EdgeInsets.only(bottom: screenHeight * 0.04),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: InkWell(
                            onTap: () {
                              controller.addTheSize(
                                controller.nameTheSize.toString(),
                              );
                              Get.offAll(ManageDeskTopSizes());
                              controller.isWantAddSize.value = false;
                            },
                            child: Container(
                              width: screenWidth * 0.25,
                              decoration: BoxDecoration(
                                  color: Colors.amber[700],
                                  borderRadius: BorderRadius.circular(2)),
                              child: Text(
                                "الإضافة",
                                style: TextStyle(
                                    fontFamily: 'Cairo',
                                    color: Colors.white,
                                    fontSize: screenWidth * 0.017,
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

          GetX<SizesManageController>(
              builder: (controller) => Visibility(
                    visible: controller.editTheSize.value,
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
                              controller.editTheSize.value = false;
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
                                  "تعديل الحجم".tr,
                                  style: TextStyle(
                                      fontFamily: 'Cairo',
                                      color: Colors.black,
                                      fontSize: screenWidth * 0.018,
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
                            child: TextFormFiledCusDeskTop(
                              keyboardType: TextInputType.name,
                              controllerData: controller.size,
                              value: (value) {
                                controller.nameTheSize = value.toString();

                                return null;
                              },
                              hintData: "الحجم".tr,
                              iconData: Icons.menu_book,
                              labelData: "الحجم".tr,
                              fillColor: Color.fromARGB(255, 48, 47, 47),
                              iconColor: Colors.white,
                              hintColor: Colors.red,
                              fontColor: Colors.white,
                              borderSideColor: Color.fromARGB(255, 48, 47, 47),
                            ),
                          )),
                      Padding(
                        padding: EdgeInsets.only(bottom: screenHeight * 0.04),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: InkWell(
                            onTap: () {
                              if (controller.nameTheSize == "0" ||
                                  controller.nameTheSize == null) {
                                controller.nameTheSize =
                                    controller.sizes.size.toString();
                              }

                              controller.editNewTheSize(
                                controller.sizes.id_size.toString(),
                                controller.nameTheSize.toString(),
                              );
                              Get.offAll(ManageDeskTopSizes());
                              controller.editTheSize.value = false;
                            },
                            child: Container(
                              width: screenWidth * 0.25,
                              decoration: BoxDecoration(
                                  color: Colors.amber[700],
                                  borderRadius: BorderRadius.circular(2)),
                              child: Text(
                                "التعديل",
                                style: TextStyle(
                                    fontFamily: 'Cairo',
                                    color: Colors.white,
                                    fontSize: screenWidth * 0.017,
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
