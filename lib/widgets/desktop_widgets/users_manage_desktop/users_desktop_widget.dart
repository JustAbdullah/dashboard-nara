import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/users_manage_controller.dart';
import '../../../localization/changelanguage.dart';
import '../../menu/menu.dart';

class UsersDeskTopstatusWidget extends StatelessWidget {
  const UsersDeskTopstatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenHeight = size.height;
    final screenWidth = size.width;
    ChangeLanguageToLocale changeController = Get.put(ChangeLanguageToLocale());
    UsersManageController usersManageController =
        Get.put(UsersManageController());

    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.02),
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                "210".tr,
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
                    width: screenWidth * 0.85,
                    height: screenHeight,
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
                                    "211".tr,
                                    style: TextStyle(
                                        fontFamily: 'Cairo',
                                        color: Colors.black,
                                        fontSize: screenWidth * 0.012,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.04,
                                  ),
                                  Text(
                                    "212".tr,
                                    style: TextStyle(
                                        fontFamily: 'Cairo',
                                        color: Colors.black,
                                        fontSize: screenWidth * 0.012,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.04,
                                  ),
                                  Text(
                                    "حالة العنوان".tr,
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
                                    "الصلاحية".tr,
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
                                    "الايميل".tr,
                                    style: TextStyle(
                                        fontFamily: 'Cairo',
                                        color: Colors.black,
                                        fontSize: screenWidth * 0.012,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.12,
                                  ),
                                  Text(
                                    "217".tr,
                                    style: TextStyle(
                                        fontFamily: 'Cairo',
                                        color: Colors.black,
                                        fontSize: screenWidth * 0.012,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.065,
                                  ),
                                  Text(
                                    "218".tr,
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
                          future: usersManageController.getAllDataUsers(),
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
                              return ListView.builder(
                                  itemCount: snapshot.data['data'].length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, i) {
                                    usersManageController.user.idUser = snapshot
                                        .data['data'][i]['id_user']
                                        .toString();
                                    usersManageController.user.nameUser =
                                        snapshot.data['data'][i]['name_user']
                                            .toString();
                                    usersManageController.user.emailUser =
                                        snapshot.data['data'][i]['email']
                                            .toString();
                                    usersManageController
                                            .user.isHaveTheLocation =
                                        snapshot.data['data'][i]
                                                ['is_write_address']
                                            .toString();
                                    usersManageController.user.accessRight =
                                        snapshot.data['data'][i]
                                                ['is_have_right_access']
                                            .toString();
                                    usersManageController.user.dateAccountUser =
                                        snapshot.data['data'][i]
                                                ['date_of_account']
                                            .toString();

                                    return InkWell(
                                        onTap: () {
                                          usersManageController.user.idUser =
                                              snapshot.data['data'][i]
                                                      ['id_user']
                                                  .toString();
                                          usersManageController.user.idUser =
                                              snapshot.data['data'][i]
                                                      ['id_user']
                                                  .toString();
                                          usersManageController.user.nameUser =
                                              snapshot.data['data'][i]
                                                      ['name_user']
                                                  .toString();
                                          usersManageController.user.emailUser =
                                              snapshot.data['data'][i]['email']
                                                  .toString();
                                          usersManageController
                                                  .user.isHaveTheLocation =
                                              snapshot.data['data'][i]
                                                      ['is_write_address']
                                                  .toString();
                                          usersManageController
                                                  .user.accessRight =
                                              snapshot.data['data'][i]
                                                      ['is_have_right_access']
                                                  .toString();
                                          usersManageController
                                                  .user.dateAccountUser =
                                              snapshot.data['data'][i]
                                                      ['date_of_account']
                                                  .toString();

                                          usersManageController
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
                                                                  0.063
                                                              : 0,
                                                          left: changeController
                                                                      .isChange
                                                                      .value ==
                                                                  false
                                                              ? 0
                                                              : screenWidth *
                                                                  0.040),
                                                      child: Text(
                                                        "${snapshot.data['data'][i]['id_user'].toString()}",
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
                                                                  0.16
                                                              : 0,
                                                          left: changeController
                                                                      .isChange
                                                                      .value ==
                                                                  false
                                                              ? 0
                                                              : screenWidth *
                                                                  0.11),
                                                      child: Text(
                                                        "${snapshot.data['data'][i]['name_user'].toString()}",
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
                                                                  0.265
                                                              : 0,
                                                          left: changeController
                                                                      .isChange
                                                                      .value ==
                                                                  false
                                                              ? 0
                                                              : screenWidth *
                                                                  0.195),
                                                      child: Text(
                                                        snapshot.data['data'][i]
                                                                        [
                                                                        'is_write_address']
                                                                    .toString() ==
                                                                "2"
                                                            ? "لقد أضاف عنوان"
                                                                .tr
                                                            : "لم يضف عنوان".tr,
                                                        style: TextStyle(
                                                            fontFamily: 'Cairo',
                                                            color: snapshot
                                                                        .data[
                                                                            'data']
                                                                            [i][
                                                                            'is_write_address']
                                                                        .toString() ==
                                                                    "2"
                                                                ? Colors.green
                                                                : Colors.red,
                                                            fontSize:
                                                                screenWidth *
                                                                    0.012,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w900),
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
                                                                  0.35
                                                              : 0,
                                                          left: changeController
                                                                      .isChange
                                                                      .value ==
                                                                  false
                                                              ? 0
                                                              : screenWidth *
                                                                  0.32),
                                                      child: Text(
                                                        snapshot.data['data'][i]
                                                                        [
                                                                        'is_have_right_access']
                                                                    .toString() ==
                                                                "2"
                                                            ? "لديه صلاحية إضافة المنتجات"
                                                            : "لايمتلك اي صلاحيات"
                                                                .tr,
                                                        style: TextStyle(
                                                            fontFamily: 'Cairo',
                                                            color: snapshot
                                                                        .data[
                                                                            'data']
                                                                            [i][
                                                                            'is_have_right_access']
                                                                        .toString() ==
                                                                    "2"
                                                                ? Colors.amber
                                                                : Colors.black,
                                                            fontSize:
                                                                screenWidth *
                                                                    0.012,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
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
                                                                  0.495
                                                              : 0,
                                                          left: changeController
                                                                      .isChange
                                                                      .value ==
                                                                  false
                                                              ? 0
                                                              : screenWidth *
                                                                  0.40),
                                                      child: Text(
                                                        "${snapshot.data['data'][i]['email'].toString()}",
                                                        style: TextStyle(
                                                            fontFamily: 'Cairo',
                                                            color: Colors.black,
                                                            fontSize:
                                                                screenWidth *
                                                                    0.012,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
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
                                                                  0.635
                                                              : 0,
                                                          left: changeController
                                                                      .isChange
                                                                      .value ==
                                                                  false
                                                              ? 0
                                                              : screenWidth *
                                                                  0.50),
                                                      child: Text(
                                                        "${snapshot.data['data'][i]['date_of_account'].toString()}",
                                                        style: TextStyle(
                                                            fontFamily: 'Cairo',
                                                            color: Colors.black,
                                                            fontSize:
                                                                screenWidth *
                                                                    0.012,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
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
                                                                  0.77
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
                                                          usersManageController
                                                                  .user.idUser =
                                                              snapshot
                                                                  .data['data']
                                                                      [i][
                                                                      'id_user']
                                                                  .toString();
                                                          usersManageController
                                                                  .user.idUser =
                                                              snapshot
                                                                  .data['data']
                                                                      [i][
                                                                      'id_user']
                                                                  .toString();
                                                          usersManageController
                                                                  .user
                                                                  .nameUser =
                                                              snapshot
                                                                  .data['data']
                                                                      [i][
                                                                      'name_user']
                                                                  .toString();
                                                          usersManageController
                                                                  .user
                                                                  .emailUser =
                                                              snapshot
                                                                  .data['data']
                                                                      [i]
                                                                      ['email']
                                                                  .toString();
                                                          usersManageController
                                                                  .user
                                                                  .isHaveTheLocation =
                                                              snapshot
                                                                  .data['data']
                                                                      [i][
                                                                      'is_write_address']
                                                                  .toString();
                                                          usersManageController
                                                                  .user
                                                                  .accessRight =
                                                              snapshot
                                                                  .data['data']
                                                                      [i][
                                                                      'is_have_right_access']
                                                                  .toString();
                                                          usersManageController
                                                                  .user
                                                                  .dateAccountUser =
                                                              snapshot
                                                                  .data['data']
                                                                      [i][
                                                                      'date_of_account']
                                                                  .toString();

                                                          usersManageController
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
          GetX<UsersManageController>(
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
                                  "معلومات حول المستخدم".tr,
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
                                  "القيام بحذف او تعديل المستخدم".tr,
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
                                    controller.editTheAccounts.value = true;
                                  },
                                  child: Container(
                                    width: screenWidth * 0.1,
                                    decoration: BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius: BorderRadius.circular(2)),
                                    child: Text(
                                      "تعديل المستخدم".tr,
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
                                    controller.deleteUser(usersManageController
                                        .user.idUser
                                        .toString());
                                    Future.delayed(Duration(milliseconds: 700),
                                        () async {
                                      Get.offAll(UsersDeskTopstatusWidget());
                                    });
                                  },
                                  child: Container(
                                    width: screenWidth * 0.1,
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(2)),
                                    child: Text(
                                      "حذف المستخدم".tr,
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

          GetX<UsersManageController>(
              builder: (controller) => Visibility(
                    visible: controller.editTheAccounts.value,
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
                          padding: EdgeInsets.only(top: screenHeight * 0.07),
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: screenWidth * 0.5,
                              height: screenHeight * 0.73,
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
                                      "معلومات حول المستخدم".tr,
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
                                      EdgeInsets.only(top: screenHeight * 0.17),
                                  child: Align(
                                    alignment: Alignment.topCenter,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "اسم المستخدم:".tr,
                                          style: TextStyle(
                                              fontFamily: 'Cairo',
                                              color: Colors.black,
                                              fontSize: screenWidth * 0.014,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          width: screenWidth * 0.004,
                                        ),
                                        Text(
                                          "${controller.user.nameUser}",
                                          style: TextStyle(
                                              fontFamily: 'Cairo',
                                              color: Colors.black,
                                              fontSize: screenWidth * 0.014,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: screenHeight * 0.23),
                                  child: Align(
                                    alignment: Alignment.topCenter,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "حالة الحساب:".tr,
                                          style: TextStyle(
                                              fontFamily: 'Cairo',
                                              color: Colors.black,
                                              fontSize: screenWidth * 0.014,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          width: screenWidth * 0.004,
                                        ),
                                        Text(
                                          controller.user.isHaveTheLocation ==
                                                  "2"
                                              ? " لقد تم إضافة عنوان"
                                              : "لم يتم إضافة اي عنوان",
                                          style: TextStyle(
                                              fontFamily: 'Cairo',
                                              color: Colors.amber,
                                              fontSize: screenWidth * 0.014,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: screenHeight * 0.3),
                                  child: Align(
                                    alignment: Alignment.topCenter,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          " صلاحية إضافة المنتجات:".tr,
                                          style: TextStyle(
                                              fontFamily: 'Cairo',
                                              color: Colors.black,
                                              fontSize: screenWidth * 0.014,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          width: screenWidth * 0.004,
                                        ),
                                        Text(
                                          controller.user.isHaveTheLocation ==
                                                  "2"
                                              ? "تم إعطاء الصلاحيات"
                                              : "ليس هنالك اي صلاحية",
                                          style: TextStyle(
                                              fontFamily: 'Cairo',
                                              color: controller.user
                                                          .isHaveTheLocation ==
                                                      "2"
                                                  ? Colors.green[700]
                                                  : Colors.red,
                                              fontSize: screenWidth * 0.014,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: screenHeight * 0.15),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: InkWell(
                                      onTap: () {
                                        controller.editTheAccessRightTo(
                                            controller.user.idUser.toString());
                                        controller.editTheAccounts.value =
                                            false;

                                        controller.showOptions.value = false;
                                        Get.offAll(UsersDeskTopstatusWidget());
                                      },
                                      child: Container(
                                        width: screenWidth * 0.3,
                                        decoration: BoxDecoration(
                                            color: Colors.amber,
                                            borderRadius:
                                                BorderRadius.circular(2)),
                                        child: Text(
                                          "إعطاء الصلاحيات لهذا المستخدم".tr,
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
                                      EdgeInsets.only(top: screenHeight * 0.3),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: InkWell(
                                      onTap: () {
                                        controller.editTheAccessRightNo(
                                            controller.user.idUser.toString());
                                        controller.editTheAccounts.value =
                                            false;

                                        controller.showOptions.value = false;
                                        Get.offAll(UsersDeskTopstatusWidget());
                                      },
                                      child: Container(
                                        width: screenWidth * 0.3,
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(2)),
                                        child: Text(
                                          "إزالة صلاحيات هذا الحساب".tr,
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
                          )),
                      Padding(
                        padding: EdgeInsets.only(top: screenHeight * 0.03),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: InkWell(
                            onTap: () {
                              controller.editTheAccounts.value = false;
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
                    ]),
                  )),

          TheMenu(),
          ///////////////////////////////////////////////////////
        ],
      ),
    );
  }
}
