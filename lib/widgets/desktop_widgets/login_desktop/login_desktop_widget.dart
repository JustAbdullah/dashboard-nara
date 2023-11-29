import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nara_dashboard/widgets/desktop_widgets/textfiled/textformfiled_widget_desktop/textformfiled_cut.dart';

import '../../../controller/login_controller.dart';
import '../../../screens/login_screen.dart';

class LoginDeskTopWidget extends StatelessWidget {
  const LoginDeskTopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.put(LoginController());
    final size = MediaQuery.of(context).size;
    final screenHeight = size.height;
    final screenWidth = size.width;
    return Scaffold(
      body: SingleChildScrollView(
          child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: screenHeight * 0.05, left: screenWidth * 0.05),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "نسخة الحاسوب",
                style: TextStyle(
                    fontFamily: 'Cairo',
                    color: Colors.black,
                    fontSize: screenWidth * 0.028,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.12),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "أدخل بيانات التسجيل الدخول الرئيسية",
                    style: TextStyle(
                        fontFamily: 'Cairo',
                        color: Colors.black,
                        fontSize: screenWidth * 0.028,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              Container(
                width: screenWidth * 0.40,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(5)),
                child: TextFormFiledCusDeskTop(
                  keyboardType: TextInputType.name,
                  controllerData: loginController.theName,
                  value: (value) {
                    loginController.name = value.toString();
                    return null;
                  },
                  hintData: "الاسم".tr,
                  iconData: Icons.person,
                  labelData: "الاسم".tr,
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
                width: screenWidth * 0.40,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(5)),
                child: TextFormFiledCusDeskTop(
                  keyboardType: TextInputType.name,
                  controllerData: loginController.thePassword,
                  value: (value) {
                    loginController.password = value.toString();

                    return null;
                  },
                  hintData: "كلمة المرور".tr,
                  iconData: Icons.lock_outline,
                  labelData: "كلمة المرور".tr,
                  fillColor: Color.fromARGB(255, 48, 47, 47),
                  iconColor: Colors.white,
                  hintColor: Colors.red,
                  fontColor: Colors.white,
                  borderSideColor: Color.fromARGB(255, 48, 47, 47),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.2,
              ),
              InkWell(
                onTap: () {
                  loginController.login(loginController.name.toString(),
                      loginController.password.toString());
                },
                child: Container(
                  width: screenWidth * 0.40,
                  height: screenHeight / 17,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.red,
                  ),
                  child: Center(
                    child: Text(
                      "تسجيل الدخول".tr,
                      style: TextStyle(
                          fontFamily: 'Cairo',
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: screenWidth * 0.017),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
          GetX<LoginController>(
              builder: (controller) => Visibility(
                    visible: controller.isError.value,
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
                        padding: EdgeInsets.only(top: screenHeight * 0.04),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: InkWell(
                            onTap: () {
                              controller.isError.value = false;
                              Get.to(LoginScreen());
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
                      Padding(
                        padding: EdgeInsets.only(top: screenHeight * 0.3),
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: screenWidth * 0.3,
                            height: screenHeight * 0.23,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(5)),
                            child: Stack(children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(top: screenHeight * 0.03),
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    "خطا في عملية تسجيل الدخول".tr,
                                    style: TextStyle(
                                        fontFamily: 'Cairo',
                                        color: Colors.white,
                                        fontSize: screenWidth * 0.018,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: screenHeight * 0.12),
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    "هنالك خطا في أسم المستخدم او كلمة المرور"
                                        .tr,
                                    style: TextStyle(
                                        fontFamily: 'Cairo',
                                        color: Colors.white,
                                        fontSize: screenWidth * 0.014,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ),
                    ]),
                  )),
        ],
      )),
    );
  }
}
