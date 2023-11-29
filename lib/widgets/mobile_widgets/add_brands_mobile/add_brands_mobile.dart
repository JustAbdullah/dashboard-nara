import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/add_brand_controller.dart';
import '../../../localization/changelanguage.dart';
import '../../menu/menu.dart';
import '../home_mobile/home_mobile.dart';
import '../textfiled_mobile/textformfiled_cut.dart';

class addBrandsMobileWidget extends StatelessWidget {
  const addBrandsMobileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChangeLanguageToLocale changeController = Get.put(ChangeLanguageToLocale());

    AddBrandsController addBrandsController = Get.put(AddBrandsController());
    final size = MediaQuery.of(context).size;
    final screenHeight = size.height;
    final screenWidth = size.width;
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
                          "إضافة ماركة".tr,
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
                        addBrandsController.chooseImageOne();
                      },
                      child: GetX<AddBrandsController>(
                          builder: (controller) => Container(
                                width: screenWidth * 0.25,
                                height: screenHeight * 0.05,
                                decoration: BoxDecoration(
                                    color: controller.isUploadimage.value
                                        ? Colors.green
                                        : Colors.red,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Center(
                                  child: Text(
                                    controller.isUploadimage.value
                                        ? "تم رفع الصورة بنجاح"
                                        : "رفع صورة",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: screenWidth * 0.030),
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
                        controllerData: addBrandsController.nameBrandAr,
                        value: (value) {
                          addBrandsController.nameAr = value.toString();

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
                      width: screenWidth * 0.70,
                      child: TextFormFiledCus(
                        keyboardType: TextInputType.name,
                        controllerData: addBrandsController.nameBrandEn,
                        value: (value) {
                          addBrandsController.nameEn = value.toString();
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
                    InkWell(
                      onTap: () {
                        addBrandsController.addTheBrands(
                            addBrandsController.nameAr.toString(),
                            addBrandsController.nameEn.toString());

                        addBrandsController.isAddIntoDatabase.value = true;
                      },
                      child: Padding(
                        padding: EdgeInsets.only(bottom: screenHeight * 0.05),
                        child: Container(
                          width: screenWidth * 0.35,
                          height: screenHeight * 0.05,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 251, 189, 1),
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: Text(
                              "إضافة الماركة".tr,
                              style: TextStyle(
                                  fontFamily: 'Cairo',
                                  color: Colors.black,
                                  fontSize: screenWidth * 0.032),
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
          GetX<AddBrandsController>(
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
          GetX<AddBrandsController>(
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
                          width: screenWidth * 0.5,
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
                                  "لقد تم إضافة المشهور بنجاح ".tr,
                                  style: TextStyle(
                                      fontFamily: 'Cairo',
                                      color: Colors.white,
                                      fontSize: screenWidth * 0.038,
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
                                    Get.offAll(HomeMobile());
                                  },
                                  child: Container(
                                    width: screenWidth * 0.3,
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(2)),
                                    child: Text(
                                      "العودة للرئيسية".tr,
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
          TheMenu(),
        ],
      ),
    );
  }
}
