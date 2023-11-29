import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/colors_manage_controller.dart';
import '../../../../localization/changelanguage.dart';
import '../../../controller/manage_sizes_controller.dart';
import '../../../controller/offers_manage_controller.dart';
import '../../menu/menu.dart';

class ManageMobileOffers extends StatefulWidget {
  const ManageMobileOffers({super.key});

  @override
  State<ManageMobileOffers> createState() => _ManageDeskTopOffersState();
}

class _ManageDeskTopOffersState extends State<ManageMobileOffers> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenHeight = size.height;
    final screenWidth = size.width;
    ChangeLanguageToLocale changeController = Get.put(ChangeLanguageToLocale());
    OffersManageController offerTheController =
        Get.put(OffersManageController());

    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.02),
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                "قائمة العروض".tr,
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
                                    "معرف العرض".tr,
                                    style: TextStyle(
                                        fontFamily: 'Cairo',
                                        color: Colors.black,
                                        fontSize: screenWidth * 0.032,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.14,
                                  ),
                                  Text(
                                    "صورة العرض".tr,
                                    style: TextStyle(
                                        fontFamily: 'Cairo',
                                        color: Colors.black,
                                        fontSize: screenWidth * 0.032,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.2,
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
                          future: offerTheController.getAllDataOffers(),
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
                                    offerTheController.offer.id_offers =
                                        snapshot.data['data'][i]['id_offer']
                                            .toString();
                                    offerTheController.offer.image_offer =
                                        snapshot.data['data'][i]['image_offer']
                                            .toString();

                                    return InkWell(
                                        onTap: () {
                                          offerTheController.offer.id_offers =
                                              snapshot.data['data'][i]
                                                      ['id_offer']
                                                  .toString();
                                          offerTheController.offer.image_offer =
                                              snapshot.data['data'][i]
                                                      ['image_offer']
                                                  .toString();
                                          offerTheController.showOptions.value =
                                              true;
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
                                                        "${snapshot.data['data'][i]['id_offer'].toString()}",
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
                                                        top:
                                                            screenHeight * 0.01,
                                                        right: changeController
                                                                    .isChange
                                                                    .value ==
                                                                false
                                                            ? screenWidth * 0.00
                                                            : 0,
                                                        left: changeController
                                                                    .isChange
                                                                    .value ==
                                                                false
                                                            ? 0
                                                            : screenWidth *
                                                                0.11),
                                                    child: Image.network(
                                                      "${snapshot.data['data'][i]['image_offer'].toString()}",
                                                      width: screenWidth * 0.80,
                                                      height:
                                                          screenHeight * 0.10,
                                                    ),
                                                  )),
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
                                                                  0.6
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
                                                          offerTheController
                                                                  .offer
                                                                  .id_offers =
                                                              snapshot
                                                                  .data['data']
                                                                      [i][
                                                                      'id_offer']
                                                                  .toString();
                                                          offerTheController
                                                                  .offer
                                                                  .image_offer =
                                                              snapshot
                                                                  .data['data']
                                                                      [i][
                                                                      'image_offer']
                                                                  .toString();
                                                          offerTheController
                                                              .showOptions
                                                              .value = true;
                                                        },
                                                        child: Container(
                                                          width:
                                                              screenWidth * 0.2,
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
          GetX<OffersManageController>(
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
                                  "معلومات حول العرض".tr,
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
                                  "القيام بحذف العرض".tr,
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
                                  EdgeInsets.only(right: screenWidth * 0.00),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: InkWell(
                                  onTap: () {
                                    Future.delayed(Duration(milliseconds: 700),
                                        () async {
                                      controller.deleteTheOffers(controller
                                          .offer.id_offers
                                          .toString());
                                      Get.offAll(ManageMobileOffers());
                                      controller.showOptions.value = false;
                                    });
                                  },
                                  child: Container(
                                    width: screenWidth * 0.25,
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(2)),
                                    child: Text(
                                      "حذف العرض".tr,
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
                  offerTheController.isWantAddOffer.value = true;
                },
                child: Container(
                  width: screenWidth * 0.35,
                  decoration: BoxDecoration(
                      color: Colors.green[700],
                      borderRadius: BorderRadius.circular(2)),
                  child: Text(
                    "إضافة عرض جديد".tr,
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

          GetX<OffersManageController>(
              builder: (controller) => Visibility(
                    visible: controller.isWantAddOffer.value,
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
                              controller.isWantAddOffer.value = false;
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
                                  "إضافة عرض جديد".tr,
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
                      GetX<OffersManageController>(
                          builder: (controller) => Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: screenWidth * 0.00,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      !controller.isUploadImageOne.value
                                          ? Text("171".tr)
                                          : kIsWeb
                                              ? Image.memory(
                                                  controller.webImageOne,
                                                  width: screenWidth * 0.40,
                                                  fit: BoxFit.fill,
                                                )
                                              : Image.file(
                                                  controller.imagePickerOne!,
                                                  width: screenWidth * 0.40,
                                                  fit: BoxFit.fill,
                                                ),
                                    ],
                                  ),
                                ),
                              )),
                      Align(
                          alignment: Alignment.center,
                          child: Padding(
                              padding: EdgeInsets.only(
                                top: screenWidth * 0.3,
                              ),
                              child: InkWell(
                                  onTap: () {
                                    offerTheController.chooseImageOne();

                                    setState(() {});
                                  },
                                  child: GetX<OffersManageController>(
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
                                                    ? "تم رفع الصورة".tr
                                                    : "لم يتم رفع اي صورة".tr,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize:
                                                        screenWidth * 0.030),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ))))),
                      Padding(
                        padding: EdgeInsets.only(bottom: screenHeight * 0.04),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: InkWell(
                            onTap: () {
                              controller.addTheOffers();
                              Get.offAll(ManageMobileOffers());
                              controller.isWantAddOffer.value = false;
                            },
                            child: Container(
                              width: screenWidth * 0.35,
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
          GetX<OffersManageController>(
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
          ///////////////////////////////

          ///////////////////////////

          TheMenu(),
          ///////////////////////////////////////////////////////
        ],
      ),
    );
  }
}
