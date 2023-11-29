import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nara_dashboard/widgets/desktop_widgets/login_desktop/login_desktop_widget.dart';

import '../../localization/changelanguage.dart';

class LoadingWidgetDeskTop extends StatelessWidget {
  const LoadingWidgetDeskTop({super.key});

  @override
  Widget build(BuildContext context) {
    ChangeLanguageToLocale changeController = Get.put(ChangeLanguageToLocale());
    //  DashBoardController dashboardController = Get.put(DashBoardController());
    final size = MediaQuery.of(context).size;
    final screenHeight = size.height;
    final screenWidth = size.width;
    return Scaffold(
      body: Stack(
        children: [
          Padding(
              padding: EdgeInsets.only(
                top: screenHeight * 0.2,
              ),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "مرحبًا بك في لوحة التحكم",
                    style: TextStyle(
                        fontFamily: 'Cairo',
                        color: Colors.black,
                        fontSize: screenWidth * 0.030,
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
                        fontSize: screenWidth * 0.020,
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
                        fontSize: screenWidth * 0.018,
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
                        fontSize: screenWidth * 0.018,
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
                      Get.offAll(LoginDeskTopWidget());
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
                            fontSize: screenWidth * 0.018,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ))),
        ],
      ),
    );
  }
}
