import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../localization/changelanguage.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ChangeLanguageToLocale changeController = Get.put(ChangeLanguageToLocale());
    final size = MediaQuery.of(context).size;
    final screenHeight = size.height;
    final screenWidth = size.width;
    return Scaffold(
      body: Stack(
        children: [
          Padding(
              padding: EdgeInsets.only(
                top: screenHeight * 0.15,
              ),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "مرحبًا بك في لوحة التحكم",
                    style: TextStyle(
                        fontFamily: 'Cairo',
                        color: Colors.black,
                        fontSize: screenWidth * 0.065,
                        fontWeight: FontWeight.w700),
                  ))),
          Padding(
              padding: EdgeInsets.only(
                top: screenHeight * 0.21,
              ),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "Welcome to the control panel",
                    style: TextStyle(
                        fontFamily: 'Cairo',
                        color: Colors.black,
                        fontSize: screenWidth * 0.065,
                        fontWeight: FontWeight.w700),
                  ))),
          Padding(
              padding: EdgeInsets.only(
                top: screenHeight * 0.35,
              ),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "إختيار اللغة والمواصلة",
                    style: TextStyle(
                        fontFamily: 'Cairo',
                        color: Colors.black,
                        fontSize: screenWidth * 0.052,
                        fontWeight: FontWeight.w500),
                  ))),
          Padding(
              padding: EdgeInsets.only(
                top: screenHeight * 0.4,
              ),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "Choose the language and continue",
                    style: TextStyle(
                        fontFamily: 'Cairo',
                        color: Colors.black,
                        fontSize: screenWidth * 0.052,
                        fontWeight: FontWeight.w500),
                  ))),
          Padding(
              padding: EdgeInsets.only(
                  top: screenHeight * 0.54, left: screenWidth * 0.14),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: InkWell(
                    onTap: () {
                      changeController.changeLang("ar");
                      //    Get.offAll(DashBoard_Home());
                    },
                    child: Container(
                      width: screenWidth * 0.08,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        "AR",
                        style: TextStyle(
                            fontFamily: 'Cairo',
                            color: Colors.amber,
                            fontSize: screenWidth * 0.048,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ))),
          Padding(
              padding: EdgeInsets.only(
                  top: screenHeight * 0.54, right: screenWidth * 0.14),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: InkWell(
                      onTap: () {
                        changeController.changeLang("en");
                        //   Get.offAll(DashBoard_Home());
                      },
                      child: Container(
                        width: screenWidth * 0.08,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          "EN",
                          style: TextStyle(
                              fontFamily: 'Cairo',
                              color: Colors.amber,
                              fontSize: screenWidth * 0.048,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                      )))),
        ],
      ),
    );
  }
}
