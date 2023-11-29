import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/pross_order_controller.dart';
import '../../../localization/changelanguage.dart';
import '../../menu/menu.dart';
import 'package:intl/intl.dart' as intl;

class ProssOrdersDeskTopWidget extends StatelessWidget {
  const ProssOrdersDeskTopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenHeight = size.height;
    final screenWidth = size.width;
    ProssOrdersManageController prossordersManageController =
        Get.put(ProssOrdersManageController());
    ChangeLanguageToLocale changeController = Get.put(ChangeLanguageToLocale());

    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.02),
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                "إدارة العمليات".tr,
                style: TextStyle(
                    fontFamily: 'Cairo',
                    color: Colors.black,
                    fontSize: screenWidth * 0.020,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.15),
            child: Align(
                alignment: Alignment.topCenter,
                child: FutureBuilder(
                  future: prossordersManageController.getAllDataOrdersPross(),
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
                                      fontSize: screenWidth * 0.012,
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

                            prossordersManageController.prossorders.id_process =
                                snapshot.data['data'][i]['id_process']
                                    .toString();

                            prossordersManageController.prossorders.id_order =
                                snapshot.data['data'][i]['id_order'].toString();
                            prossordersManageController.prossorders.id_user =
                                snapshot.data['data'][i]['id_user'].toString();
                            prossordersManageController
                                .prossorders.id_of_order = snapshot.data['data']
                                    [i]['id_of_order']
                                .toString();
                            prossordersManageController.prossorders.total =
                                snapshot.data['data'][i]['total'].toString();

                            prossordersManageController
                                    .prossorders.payment_process =
                                snapshot.data['data'][i]['payment_process']
                                    .toString();
                            prossordersManageController.prossorders.how_to_pay =
                                snapshot.data['data'][i]['how_to_pay']
                                    .toString();
                            prossordersManageController
                                    .prossorders.date_of_arrival =
                                snapshot.data['data'][i]['date_of_arrival']
                                    .toString();

                            ///

                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 2),
                              child: InkWell(
                                onTap: () async {
                                  ////////////////
                                  prossordersManageController
                                          .prossorders.id_process =
                                      snapshot.data['data'][i]['id_process']
                                          .toString();

                                  prossordersManageController
                                          .prossorders.id_order =
                                      snapshot.data['data'][i]['id_order']
                                          .toString();
                                  prossordersManageController
                                          .prossorders.id_user =
                                      snapshot.data['data'][i]['id_user']
                                          .toString();
                                  prossordersManageController
                                          .prossorders.id_of_order =
                                      snapshot.data['data'][i]['id_of_order']
                                          .toString();
                                  prossordersManageController
                                      .prossorders.total = snapshot.data['data']
                                          [i]['total']
                                      .toString();

                                  prossordersManageController.prossorders
                                      .payment_process = snapshot.data['data']
                                          [i]['payment_process']
                                      .toString();
                                  prossordersManageController
                                          .prossorders.how_to_pay =
                                      snapshot.data['data'][i]['how_to_pay']
                                          .toString();
                                  prossordersManageController.prossorders
                                      .date_of_arrival = snapshot.data['data']
                                          [i]['date_of_arrival']
                                      .toString();
                                  prossordersManageController
                                      .showTheoptions.value = true;
                                  /////////////////////
                                },
                                child: AnimatedContainer(
                                    duration: Duration(milliseconds: 1200),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
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
                                        SingleChildScrollView(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(("معرف العملية:"),
                                                      style: TextStyle(
                                                        fontFamily: 'Cairo',
                                                        color: Colors.black,
                                                        fontSize:
                                                            screenWidth * 0.014,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      )),
                                                  SizedBox(
                                                    width: screenWidth * 0.0001,
                                                  ),
                                                  Text(
                                                      ("${snapshot.data['data'][i]['id_process']}"),
                                                      style: TextStyle(
                                                        fontFamily: 'Cairo',
                                                        color: Colors.black,
                                                        fontSize:
                                                            screenWidth * 0.014,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      )),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(("رقم الطلبية:"),
                                                      style: TextStyle(
                                                        fontFamily: 'Cairo',
                                                        color: Colors.black,
                                                        fontSize:
                                                            screenWidth * 0.014,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      )),
                                                  SizedBox(
                                                    width: screenWidth * 0.0001,
                                                  ),
                                                  Text(
                                                      ("${snapshot.data['data'][i]['id_of_order']}"),
                                                      style: TextStyle(
                                                        fontFamily: 'Cairo',
                                                        color: Colors.black,
                                                        fontSize:
                                                            screenWidth * 0.014,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      )),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(("رقم المستخدم:"),
                                                      style: TextStyle(
                                                        fontFamily: 'Cairo',
                                                        color: Colors.black,
                                                        fontSize:
                                                            screenWidth * 0.014,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      )),
                                                  SizedBox(
                                                    width: screenWidth * 0.0001,
                                                  ),
                                                  Text(
                                                      ("${snapshot.data['data'][i]['id_user']}"),
                                                      style: TextStyle(
                                                        fontFamily: 'Cairo',
                                                        color:
                                                            Colors.amber[600],
                                                        fontSize:
                                                            screenWidth * 0.014,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      )),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(("إجمالي الطلبية:"),
                                                      style: TextStyle(
                                                        fontFamily: 'Cairo',
                                                        color: Colors.black,
                                                        fontSize:
                                                            screenWidth * 0.014,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      )),
                                                  SizedBox(
                                                    width: screenWidth * 0.0001,
                                                  ),
                                                  Text(
                                                      (snapshot.data['data'][i]
                                                          ['total']),
                                                      style: TextStyle(
                                                        fontFamily: 'Cairo',
                                                        color:
                                                            Colors.green[600],
                                                        fontSize:
                                                            screenWidth * 0.014,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      )),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(("حالة الدفع:"),
                                                      style: TextStyle(
                                                        fontFamily: 'Cairo',
                                                        color: Colors.black,
                                                        fontSize:
                                                            screenWidth * 0.014,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      )),
                                                  SizedBox(
                                                    width: screenWidth * 0.0001,
                                                  ),
                                                  Text(
                                                      (snapshot.data['data'][i][
                                                                  'payment_process'] ==
                                                              "0"
                                                          ? "لم يتم الدفع بعد"
                                                          : "تم الدفع بنجاح"),
                                                      style: TextStyle(
                                                        fontFamily: 'Cairo',
                                                        color: snapshot.data[
                                                                        'data'][i]
                                                                    [
                                                                    'payment_process'] ==
                                                                "0"
                                                            ? Colors.red[600]
                                                            : Colors.green[600],
                                                        fontSize:
                                                            screenWidth * 0.014,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      )),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(("طريقة الدفع:"),
                                                      style: TextStyle(
                                                        fontFamily: 'Cairo',
                                                        color: Colors.black,
                                                        fontSize:
                                                            screenWidth * 0.014,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      )),
                                                  SizedBox(
                                                    width: screenWidth * 0.0001,
                                                  ),
                                                  Text(
                                                      (snapshot.data['data'][i][
                                                                  'how_to_pay'] ==
                                                              "1"
                                                          ? "عند الإستلام"
                                                          : "بيبال"),
                                                      style: TextStyle(
                                                        fontFamily: 'Cairo',
                                                        color:
                                                            Colors.green[600],
                                                        fontSize:
                                                            screenWidth * 0.014,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      )),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(("موعد إيصال الطلبية:"),
                                                      style: TextStyle(
                                                        fontFamily: 'Cairo',
                                                        color: Colors.black,
                                                        fontSize:
                                                            screenWidth * 0.014,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      )),
                                                  SizedBox(
                                                    width: screenWidth * 0.0001,
                                                  ),
                                                  Text(
                                                      (snapshot.data['data'][i]
                                                          ['date_of_arrival']),
                                                      style: TextStyle(
                                                        fontFamily: 'Cairo',
                                                        color: Colors.black,
                                                        fontSize:
                                                            screenWidth * 0.014,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      )),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              bottom: screenHeight * 0.00),
                                          child: Align(
                                              alignment: Alignment.bottomCenter,
                                              child: InkWell(
                                                onTap: () {
                                                  prossordersManageController
                                                          .prossorders
                                                          .id_process =
                                                      snapshot.data['data'][i]
                                                              ['id_process']
                                                          .toString();

                                                  prossordersManageController
                                                          .prossorders
                                                          .id_order =
                                                      snapshot.data['data'][i]
                                                              ['id_order']
                                                          .toString();
                                                  prossordersManageController
                                                          .prossorders.id_user =
                                                      snapshot.data['data'][i]
                                                              ['id_user']
                                                          .toString();
                                                  prossordersManageController
                                                          .prossorders
                                                          .id_of_order =
                                                      snapshot.data['data'][i]
                                                              ['id_of_order']
                                                          .toString();
                                                  prossordersManageController
                                                          .prossorders.total =
                                                      snapshot.data['data'][i]
                                                              ['total']
                                                          .toString();

                                                  prossordersManageController
                                                          .prossorders
                                                          .payment_process =
                                                      snapshot.data['data'][i][
                                                              'payment_process']
                                                          .toString();
                                                  prossordersManageController
                                                          .prossorders
                                                          .how_to_pay =
                                                      snapshot.data['data'][i]
                                                              ['how_to_pay']
                                                          .toString();
                                                  prossordersManageController
                                                          .prossorders
                                                          .date_of_arrival =
                                                      snapshot.data['data'][i][
                                                              'date_of_arrival']
                                                          .toString();
                                                  prossordersManageController
                                                      .showTheoptions
                                                      .value = true;
                                                },
                                                child: Container(
                                                    width: screenWidth,
                                                    height: screenHeight / 30,
                                                    decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(3)),
                                                    child: Center(
                                                      child: Text(
                                                        "فحص".tr,
                                                        style: TextStyle(
                                                          fontFamily: 'Cairo',
                                                          color: Color.fromARGB(
                                                              255,
                                                              252,
                                                              252,
                                                              252),
                                                          fontSize:
                                                              screenWidth *
                                                                  0.011,
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
                            childAspectRatio: (1 / 0.8),
                            crossAxisCount: 4,
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
          GetX<ProssOrdersManageController>(
              builder: (controller) => Visibility(
                    visible: controller.showTheoptions.value,
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
                              controller.showTheoptions.value = false;
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
                                  "معلومات حول العملية".tr,
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
                                  "مشاهدة تفاصيل العملية",
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
                                alignment: Alignment.bottomCenter,
                                child: InkWell(
                                  onTap: () {
                                    controller.aboutTheOrder.value = true;
                                  },
                                  child: Container(
                                    width: screenWidth * 0.1,
                                    decoration: BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius: BorderRadius.circular(2)),
                                    child: Text(
                                      "مشاهدة التفاصيل".tr,
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
                  )), ///////////////////
          GetX<ProssOrdersManageController>(
              builder: (controller) => Visibility(
                    visible: controller.aboutTheOrder.value,
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
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: screenWidth,
                          height: screenHeight,
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
                                  "معلومات حول العملية".tr,
                                  style: TextStyle(
                                      fontFamily: 'Cairo',
                                      color: Colors.black,
                                      fontSize: screenWidth * 0.018,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: screenHeight * 0.2),
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Text(
                                  "تحديد موعد الإيصال".tr,
                                  style: TextStyle(
                                      fontFamily: 'Cairo',
                                      color: Colors.black,
                                      fontSize: screenWidth * 0.018,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            Align(
                                alignment: Alignment.topCenter,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: screenHeight * 0.3,
                                      right: changeController.isChange.value ==
                                              false
                                          ? screenWidth * 0.0
                                          : 0,
                                      left: changeController.isChange.value ==
                                              false
                                          ? 0
                                          : screenWidth * 0.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          controller.OneDay.value = 1;
                                          controller.TwoDay.value = 0;
                                          controller.ThreeDay.value = 0;
                                          controller.FourDay.value = 0;
                                          controller.FiveDay.value = 0;
                                          controller.SixDay.value = 0;
                                          controller.SevenDay.value = 0;

                                          final TheDateAddDay =
                                              new DateTime.now()
                                                  .add(Duration(days: 1));
                                          late String dateAfterDay =
                                              intl.DateFormat('yMd')
                                                  .format(TheDateAddDay);

                                          controller.dateAboutOrder.value =
                                              dateAfterDay;
                                        },
                                        child: AnimatedContainer(
                                            duration:
                                                Duration(milliseconds: 850),
                                            width: controller.OneDay.value == 1
                                                ? screenWidth * 0.08
                                                : screenWidth * 0.04,
                                            height: screenHeight * 0.05,
                                            decoration: BoxDecoration(
                                                color:
                                                    controller.OneDay.value == 1
                                                        ? Colors.amber
                                                        : Colors.red,
                                                borderRadius:
                                                    BorderRadius.circular(2)),
                                            child: Text(
                                              "315".tr,
                                              style: TextStyle(
                                                  height: screenHeight * 0.003,
                                                  fontFamily: 'Cairo',
                                                  color: Colors.white,
                                                  fontSize: screenWidth * 0.012,
                                                  fontWeight: FontWeight.w500),
                                              textAlign: TextAlign.center,
                                            )),
                                      ),
                                      SizedBox(
                                        width: screenWidth * 0.01,
                                      ),
                                      InkWell(
                                          onTap: () {
                                            controller.OneDay.value = 0;
                                            controller.TwoDay.value = 1;
                                            controller.ThreeDay.value = 0;
                                            controller.FourDay.value = 0;
                                            controller.FiveDay.value = 0;
                                            controller.SixDay.value = 0;
                                            controller.SevenDay.value = 0;

                                            final TheDateAddTwoDay =
                                                new DateTime.now()
                                                    .add(Duration(days: 2));
                                            late String dateAfterDay =
                                                intl.DateFormat('yMd')
                                                    .format(TheDateAddTwoDay);

                                            controller.dateAboutOrder.value =
                                                dateAfterDay;
                                          },
                                          child: AnimatedContainer(
                                              duration:
                                                  Duration(milliseconds: 850),
                                              width:
                                                  controller.TwoDay.value == 1
                                                      ? screenWidth * 0.08
                                                      : screenWidth * 0.04,
                                              height: screenHeight * 0.05,
                                              decoration: BoxDecoration(
                                                  color:
                                                      controller.TwoDay.value ==
                                                              1
                                                          ? Colors.amber
                                                          : Colors.red,
                                                  borderRadius:
                                                      BorderRadius.circular(2)),
                                              child: Text(
                                                "316".tr,
                                                style: TextStyle(
                                                    height:
                                                        screenHeight * 0.003,
                                                    fontFamily: 'Cairo',
                                                    color: Colors.white,
                                                    fontSize:
                                                        screenWidth * 0.012,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                textAlign: TextAlign.center,
                                              ))),
                                      SizedBox(
                                        width: screenWidth * 0.01,
                                      ),
                                      InkWell(
                                          onTap: () {
                                            controller.OneDay.value = 0;
                                            controller.TwoDay.value = 0;
                                            controller.ThreeDay.value = 1;
                                            controller.FourDay.value = 0;
                                            controller.FiveDay.value = 0;
                                            controller.SixDay.value = 0;
                                            controller.SevenDay.value = 0;

                                            final TheDateAddThreeDay =
                                                new DateTime.now()
                                                    .add(Duration(days: 3));
                                            late String dateAfterDay =
                                                intl.DateFormat('yMd')
                                                    .format(TheDateAddThreeDay);

                                            controller.dateAboutOrder.value =
                                                dateAfterDay;
                                          },
                                          child: AnimatedContainer(
                                              duration:
                                                  Duration(milliseconds: 850),
                                              width:
                                                  controller.ThreeDay.value == 1
                                                      ? screenWidth * 0.08
                                                      : screenWidth * 0.04,
                                              height: screenHeight * 0.05,
                                              decoration: BoxDecoration(
                                                  color: controller
                                                              .ThreeDay.value ==
                                                          1
                                                      ? Colors.amber
                                                      : Colors.red,
                                                  borderRadius:
                                                      BorderRadius.circular(2)),
                                              child: Text(
                                                "317".tr,
                                                style: TextStyle(
                                                    height:
                                                        screenHeight * 0.003,
                                                    fontFamily: 'Cairo',
                                                    color: Colors.white,
                                                    fontSize:
                                                        screenWidth * 0.012,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                textAlign: TextAlign.center,
                                              ))),
                                      SizedBox(
                                        width: screenWidth * 0.01,
                                      ),
                                      InkWell(
                                          onTap: () {
                                            controller.OneDay.value = 0;
                                            controller.TwoDay.value = 0;
                                            controller.ThreeDay.value = 0;
                                            controller.FourDay.value = 1;
                                            controller.FiveDay.value = 0;
                                            controller.SixDay.value = 0;
                                            controller.SevenDay.value = 0;

                                            final TheDateAddFourDay =
                                                new DateTime.now()
                                                    .add(Duration(days: 4));
                                            late String dateAfterDay =
                                                intl.DateFormat('yMd')
                                                    .format(TheDateAddFourDay);

                                            controller.dateAboutOrder.value =
                                                dateAfterDay;
                                          },
                                          child: AnimatedContainer(
                                              duration:
                                                  Duration(milliseconds: 850),
                                              width:
                                                  controller.FourDay.value == 1
                                                      ? screenWidth * 0.08
                                                      : screenWidth * 0.04,
                                              height: screenHeight * 0.05,
                                              decoration: BoxDecoration(
                                                  color: controller
                                                              .FourDay.value ==
                                                          1
                                                      ? Colors.amber
                                                      : Colors.red,
                                                  borderRadius:
                                                      BorderRadius.circular(2)),
                                              child: Text(
                                                "318".tr,
                                                style: TextStyle(
                                                    height:
                                                        screenHeight * 0.003,
                                                    fontFamily: 'Cairo',
                                                    color: Colors.white,
                                                    fontSize:
                                                        screenWidth * 0.012,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                textAlign: TextAlign.center,
                                              ))),
                                      SizedBox(
                                        width: screenWidth * 0.01,
                                      ),
                                      InkWell(
                                          onTap: () {
                                            controller.OneDay.value = 0;
                                            controller.TwoDay.value = 0;
                                            controller.ThreeDay.value = 0;
                                            controller.FourDay.value = 0;
                                            controller.FiveDay.value = 1;
                                            controller.SixDay.value = 0;
                                            controller.SevenDay.value = 0;

                                            final TheDateAddFiveDay =
                                                new DateTime.now()
                                                    .add(Duration(days: 5));
                                            late String dateAfterDay =
                                                intl.DateFormat('yMd')
                                                    .format(TheDateAddFiveDay);

                                            controller.dateAboutOrder.value =
                                                dateAfterDay;
                                          },
                                          child: AnimatedContainer(
                                              duration:
                                                  Duration(milliseconds: 850),
                                              width:
                                                  controller.FiveDay.value == 1
                                                      ? screenWidth * 0.08
                                                      : screenWidth * 0.04,
                                              height: screenHeight * 0.05,
                                              decoration: BoxDecoration(
                                                  color: controller
                                                              .FiveDay.value ==
                                                          1
                                                      ? Colors.amber
                                                      : Colors.red,
                                                  borderRadius:
                                                      BorderRadius.circular(2)),
                                              child: Text(
                                                "319".tr,
                                                style: TextStyle(
                                                    height:
                                                        screenHeight * 0.003,
                                                    fontFamily: 'Cairo',
                                                    color: Colors.white,
                                                    fontSize:
                                                        screenWidth * 0.012,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                textAlign: TextAlign.center,
                                              ))),
                                      SizedBox(
                                        width: screenWidth * 0.01,
                                      ),
                                      InkWell(
                                          onTap: () {
                                            controller.OneDay.value = 0;
                                            controller.TwoDay.value = 0;
                                            controller.ThreeDay.value = 0;
                                            controller.FourDay.value = 0;
                                            controller.FiveDay.value = 0;
                                            controller.SixDay.value = 1;
                                            controller.SevenDay.value = 0;

                                            final TheDateAddSixDay =
                                                new DateTime.now()
                                                    .add(Duration(days: 6));
                                            late String dateAfterDay =
                                                intl.DateFormat('yMd')
                                                    .format(TheDateAddSixDay);

                                            controller.dateAboutOrder.value =
                                                dateAfterDay;
                                          },
                                          child: AnimatedContainer(
                                              duration:
                                                  Duration(milliseconds: 850),
                                              width:
                                                  controller.SixDay.value == 1
                                                      ? screenWidth * 0.08
                                                      : screenWidth * 0.04,
                                              height: screenHeight * 0.05,
                                              decoration: BoxDecoration(
                                                  color:
                                                      controller.SixDay.value ==
                                                              1
                                                          ? Colors.amber
                                                          : Colors.red,
                                                  borderRadius:
                                                      BorderRadius.circular(2)),
                                              child: Text(
                                                "320".tr,
                                                style: TextStyle(
                                                    height:
                                                        screenHeight * 0.003,
                                                    fontFamily: 'Cairo',
                                                    color: Colors.white,
                                                    fontSize:
                                                        screenWidth * 0.012,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                textAlign: TextAlign.center,
                                              ))),
                                      SizedBox(
                                        width: screenWidth * 0.01,
                                      ),
                                      InkWell(
                                          onTap: () {
                                            controller.OneDay.value = 0;
                                            controller.TwoDay.value = 0;
                                            controller.ThreeDay.value = 0;
                                            controller.FourDay.value = 0;
                                            controller.FiveDay.value = 0;
                                            controller.SixDay.value = 0;
                                            controller.SevenDay.value = 1;

                                            final TheDateAddWeekDay =
                                                new DateTime.now()
                                                    .add(Duration(days: 7));
                                            late String dateAfterDay =
                                                intl.DateFormat('yMd')
                                                    .format(TheDateAddWeekDay);

                                            controller.dateAboutOrder.value =
                                                dateAfterDay;
                                          },
                                          child: AnimatedContainer(
                                              duration:
                                                  Duration(milliseconds: 850),
                                              width:
                                                  controller.SevenDay.value == 1
                                                      ? screenWidth * 0.08
                                                      : screenWidth * 0.04,
                                              height: screenHeight * 0.05,
                                              decoration: BoxDecoration(
                                                  color: controller
                                                              .SevenDay.value ==
                                                          1
                                                      ? Colors.amber
                                                      : Colors.red,
                                                  borderRadius:
                                                      BorderRadius.circular(2)),
                                              child: Text(
                                                "321".tr,
                                                style: TextStyle(
                                                    height:
                                                        screenHeight * 0.003,
                                                    fontFamily: 'Cairo',
                                                    color: Colors.white,
                                                    fontSize:
                                                        screenWidth * 0.012,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                textAlign: TextAlign.center,
                                              )))
                                    ],
                                  ),
                                )),
                            Padding(
                              padding: EdgeInsets.only(top: screenWidth * 0.2),
                              child: Align(
                                alignment: Alignment.center,
                                child: InkWell(
                                  onTap: () {
                                    controller.editTheOrderProssDate(
                                        controller.dateAboutOrder.value
                                            .toString(),
                                        controller.prossorders.id_process
                                            .toString());
                                    controller.aboutTheOrder.value = false;
                                    controller.aboutTheOrder.value = false;
                                    controller.showTheoptions.value = false;
                                    Get.offAll(ProssOrdersDeskTopWidget());
                                  },
                                  child: Container(
                                    width: screenWidth * 0.3,
                                    decoration: BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius: BorderRadius.circular(2)),
                                    child: Text(
                                      "تاكيد تاريخ الإيصال".tr,
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
                      Padding(
                        padding: EdgeInsets.only(
                            top: screenHeight * 0.03, left: screenWidth * 0.02),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: InkWell(
                            onTap: () {
                              controller.aboutTheOrder.value = false;
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
        ],
      ),
    );
  }
}
