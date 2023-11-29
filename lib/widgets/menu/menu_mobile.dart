import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../screens/home_dashboard.dart';
import '../desktop_widgets/home/home_desktop.dart';

class TheMenuMobile extends StatelessWidget {
  const TheMenuMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenHeight = size.height;
    final screenWidth = size.width;
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: screenHeight * 0.02, right: screenWidth * 0.02),
          child: Align(
            alignment: Alignment.topRight,
            child: InkWell(
              onTap: () {
                Get.offAll(HomeDashBoard());
              },
              child: Container(
                alignment: Alignment.center,
                width: screenWidth * 0.25,
                height: screenHeight / 20,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "الرئيسية",
                  style: TextStyle(
                      fontFamily: 'Cairo',
                      color: Colors.white,
                      fontSize: screenWidth * 0.034,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
