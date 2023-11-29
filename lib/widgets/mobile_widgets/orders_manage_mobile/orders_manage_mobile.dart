import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/celebs_controller.dart';
import '../../../controller/orders_controller.dart';
import '../../../localization/changelanguage.dart';
import '../../menu/menu.dart';

class OrdersMobileWidget extends StatelessWidget {
  const OrdersMobileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenHeight = size.height;
    final screenWidth = size.width;
    OrdersManageController ordersManageController =
        Get.put(OrdersManageController());
    ChangeLanguageToLocale changeController = Get.put(ChangeLanguageToLocale());

    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.1),
            child: Align(
                alignment: Alignment.topCenter,
                child: FutureBuilder(
                  future: ordersManageController.getAllDataOrders(),
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
                                    width: screenWidth * 0.4,
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
                                            fontSize: screenWidth * 0.035,
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
                                      fontSize: screenWidth * 0.032,
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

                            ordersManageController.orders.id_order =
                                snapshot.data['data'][i]['id_order'].toString();

                            ordersManageController.orders.id_user =
                                snapshot.data['data'][i]['id_user'].toString();
                            ordersManageController.orders.id_of_order = snapshot
                                .data['data'][i]['id_of_order']
                                .toString();
                            ordersManageController.orders.total =
                                snapshot.data['data'][i]['total'].toString();
                            ordersManageController.orders.order_status =
                                snapshot.data['data'][i]['order_status']
                                    .toString();
                            ordersManageController.orders.how_to_pay = snapshot
                                .data['data'][i]['how_to_pay']
                                .toString();
                            ordersManageController.orders.date_of_order =
                                snapshot.data['data'][i]['date_of_order']
                                    .toString();
                            ordersManageController.orders.name_user = snapshot
                                .data['data'][i]['name_user']
                                .toString();

                            ///

                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 2),
                              child: InkWell(
                                onTap: () async {
                                  ////////////////
                                  ordersManageController.orders.id_order =
                                      snapshot.data['data'][i]['id_order']
                                          .toString();

                                  ordersManageController.orders.id_user =
                                      snapshot.data['data'][i]['id_user']
                                          .toString();
                                  ordersManageController.orders.id_of_order =
                                      snapshot.data['data'][i]['id_of_order']
                                          .toString();
                                  ordersManageController.orders.total = snapshot
                                      .data['data'][i]['total']
                                      .toString();
                                  ordersManageController.orders.order_status =
                                      snapshot.data['data'][i]['order_status']
                                          .toString();
                                  ordersManageController.orders.how_to_pay =
                                      snapshot.data['data'][i]['how_to_pay']
                                          .toString();
                                  ordersManageController.orders.date_of_order =
                                      snapshot.data['data'][i]['date_of_order']
                                          .toString();
                                  ordersManageController.orders.name_user =
                                      snapshot.data['data'][i]['name_user']
                                          .toString();
                                  ordersManageController.showTheoptions.value =
                                      true;
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
                                                  Text(("معرف الطلبية:"),
                                                      style: TextStyle(
                                                        fontFamily: 'Cairo',
                                                        color: Colors.black,
                                                        fontSize:
                                                            screenWidth * 0.034,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      )),
                                                  SizedBox(
                                                    width: screenWidth * 0.0001,
                                                  ),
                                                  Text(
                                                      ("${ordersManageController.orders.id_order}"),
                                                      style: TextStyle(
                                                        fontFamily: 'Cairo',
                                                        color: Colors.black,
                                                        fontSize:
                                                            screenWidth * 0.034,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      )),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(("اسم المستخدم:"),
                                                      style: TextStyle(
                                                        fontFamily: 'Cairo',
                                                        color: Colors.black,
                                                        fontSize:
                                                            screenWidth * 0.034,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      )),
                                                  SizedBox(
                                                    width: screenWidth * 0.0001,
                                                  ),
                                                  Text(
                                                      ("${ordersManageController.orders.name_user}"),
                                                      style: TextStyle(
                                                        fontFamily: 'Cairo',
                                                        color: Colors.black,
                                                        fontSize:
                                                            screenWidth * 0.034,
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
                                                            screenWidth * 0.034,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      )),
                                                  SizedBox(
                                                    width: screenWidth * 0.0001,
                                                  ),
                                                  Text(
                                                      ("${ordersManageController.orders.id_of_order}"),
                                                      style: TextStyle(
                                                        fontFamily: 'Cairo',
                                                        color:
                                                            Colors.amber[600],
                                                        fontSize:
                                                            screenWidth * 0.034,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      )),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(("حالة الطلبية:"),
                                                      style: TextStyle(
                                                        fontFamily: 'Cairo',
                                                        color: Colors.black,
                                                        fontSize:
                                                            screenWidth * 0.034,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      )),
                                                  SizedBox(
                                                    width: screenWidth * 0.0001,
                                                  ),
                                                  Text(
                                                      (ordersManageController
                                                                  .orders
                                                                  .order_status ==
                                                              "1"
                                                          ? "لم يتم التاكيد"
                                                          : "تم تاكيدها"),
                                                      style: TextStyle(
                                                        fontFamily: 'Cairo',
                                                        color: ordersManageController
                                                                    .orders
                                                                    .order_status ==
                                                                "1"
                                                            ? Colors.red[600]
                                                            : Colors.green[600],
                                                        fontSize:
                                                            screenWidth * 0.034,
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
                                                            screenWidth * 0.034,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      )),
                                                  SizedBox(
                                                    width: screenWidth * 0.0001,
                                                  ),
                                                  Text(
                                                      ("${ordersManageController.orders.total}"),
                                                      style: TextStyle(
                                                        fontFamily: 'Cairo',
                                                        color:
                                                            Colors.green[600],
                                                        fontSize:
                                                            screenWidth * 0.034,
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
                                                  ordersManageController
                                                          .orders.id_order =
                                                      snapshot.data['data'][i]
                                                              ['id_order']
                                                          .toString();

                                                  ordersManageController
                                                          .orders.id_user =
                                                      snapshot.data['data'][i]
                                                              ['id_user']
                                                          .toString();
                                                  ordersManageController
                                                          .orders.id_of_order =
                                                      snapshot.data['data'][i]
                                                              ['id_of_order']
                                                          .toString();
                                                  ordersManageController
                                                          .orders.total =
                                                      snapshot.data['data'][i]
                                                              ['total']
                                                          .toString();
                                                  ordersManageController
                                                          .orders.order_status =
                                                      snapshot.data['data'][i]
                                                              ['order_status']
                                                          .toString();
                                                  ordersManageController
                                                          .orders.how_to_pay =
                                                      snapshot.data['data'][i]
                                                              ['how_to_pay']
                                                          .toString();
                                                  ordersManageController.orders
                                                          .date_of_order =
                                                      snapshot.data['data'][i]
                                                              ['date_of_order']
                                                          .toString();
                                                  ordersManageController
                                                          .orders.name_user =
                                                      snapshot.data['data'][i]
                                                              ['name_user']
                                                          .toString();
                                                  ordersManageController
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
                                                                  0.031,
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
                            childAspectRatio: (1 / 0.7),
                            crossAxisCount: 2,
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
          GetX<OrdersManageController>(
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
                                    fontSize: screenWidth * 0.046,
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
                                  "معلومات حول الطلبية".tr,
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
                                  "حذف او مشاهدة تفاصيل الطلبية".tr,
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
                                    controller.aboutTheOrder.value = true;
                                  },
                                  child: Container(
                                    width: screenWidth * 0.25,
                                    decoration: BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius: BorderRadius.circular(2)),
                                    child: Text(
                                      "مشاهدة التفاصيل".tr,
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
                                    controller.deleteOrder(
                                        ordersManageController.orders.id_order
                                            .toString());

                                    Future.delayed(Duration(milliseconds: 700),
                                        () async {
                                      Get.offAll(OrdersMobileWidget());
                                    });
                                  },
                                  child: Container(
                                    width: screenWidth * 0.25,
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(2)),
                                    child: Text(
                                      "حذف الطلبية".tr,
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
                  )), ///////////////////
          GetX<OrdersManageController>(
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
                                  "معلومات حول الطلبية".tr,
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
                      Padding(
                        padding: EdgeInsets.only(top: screenHeight * 0.1),
                        child: Align(
                            alignment: Alignment.topCenter,
                            child: FutureBuilder(
                              future: controller.getShoppingcart(
                                  controller.orders.id_of_order.toString()),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
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
                                                  fontSize: screenWidth * 0.032,
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

                                        controller.products.idProduct = snapshot
                                            .data['data'][i]['id_product']
                                            .toString();
                                        controller.products.nameProduct =
                                            snapshot.data['data'][i]
                                                    ['name_product']
                                                .toString();
                                        controller.products.bodyProduct =
                                            snapshot.data['data'][i]
                                                    ['body_product']
                                                .toString();
                                        controller.products.nameProductEn =
                                            snapshot.data['data'][i]
                                                    ['name_product_en']
                                                .toString();
                                        controller.products.bodyEnProduct =
                                            snapshot.data['data'][i]
                                                    ['body_product_en']
                                                .toString();

                                        ///
                                        controller.products.imageProductOne =
                                            snapshot.data['data'][i]
                                                    ['image_product']
                                                .toString();

                                        controller.products.priceProduct =
                                            snapshot.data['data'][i]
                                                    ['price_product']
                                                .toString();

                                        return Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 2, horizontal: 2),
                                          child: InkWell(
                                            onTap: () async {
                                              ////////////////

                                              /////////////////////
                                            },
                                            child: AnimatedContainer(
                                                duration: Duration(
                                                    milliseconds: 1200),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Color.fromARGB(255,
                                                              248, 245, 245)
                                                          .withOpacity(0.7),
                                                      spreadRadius: 10,
                                                      blurRadius: 10,
                                                      offset: Offset(0,
                                                          3), // changes position of shadow
                                                    ),
                                                  ],
                                                ),
                                                width: screenWidth * 0.30,
                                                height: screenHeight * 0.40,
                                                child: Stack(
                                                  children: [
                                                    Align(
                                                        alignment:
                                                            Alignment.topCenter,
                                                        child: changeController
                                                                    .isChange
                                                                    .value ==
                                                                false
                                                            ? Text(
                                                                ("${controller.products.nameProduct}"),
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'Cairo',
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      screenWidth *
                                                                          0.034,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                ))
                                                            : Text(
                                                                ("${controller.products.nameProductEn}"),
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'Cairo',
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      screenWidth *
                                                                          0.034,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                ))),
                                                    Padding(
                                                        padding: EdgeInsets.only(
                                                            top: screenHeight *
                                                                0.06),
                                                        child: Align(
                                                          alignment: Alignment
                                                              .topCenter,
                                                          child: Container(
                                                            width: screenWidth *
                                                                0.60,
                                                            height:
                                                                screenHeight *
                                                                    0.18,
                                                            child:
                                                                Image.network(
                                                              "${controller.products.imageProductOne}",
                                                              width:
                                                                  screenWidth *
                                                                      0.50,
                                                              height:
                                                                  screenHeight *
                                                                      0.18,
                                                            ),
                                                          ),
                                                        )),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: screenHeight *
                                                              0.12),
                                                      child: Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                    ("${controller.products.priceProduct}"),
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            screenWidth *
                                                                                0.032,
                                                                        fontFamily:
                                                                            'Cairo',
                                                                        color: Color.fromARGB(
                                                                            255,
                                                                            93,
                                                                            219,
                                                                            97))),
                                                                SizedBox(
                                                                  width:
                                                                      screenWidth *
                                                                          0.001,
                                                                ),
                                                                Text("351".tr,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            screenWidth *
                                                                                0.032,
                                                                        fontFamily:
                                                                            'Cairo',
                                                                        color: Color.fromARGB(
                                                                            255,
                                                                            93,
                                                                            219,
                                                                            97))),
                                                              ])),
                                                    ),
                                                    Padding(
                                                        padding: EdgeInsets.only(
                                                            top: screenHeight *
                                                                0.28),
                                                        child: Align(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Padding(
                                                                padding: EdgeInsets.symmetric(
                                                                    horizontal:
                                                                        screenWidth *
                                                                            0.05),
                                                                child: changeController
                                                                            .isChange
                                                                            .value ==
                                                                        false
                                                                    ? Text(
                                                                        ("${controller.products.bodyProduct}"),
                                                                        style: TextStyle(
                                                                            fontSize: screenWidth *
                                                                                0.030,
                                                                            fontFamily:
                                                                                'Cairo',
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                46,
                                                                                45,
                                                                                45)),
                                                                        maxLines:
                                                                            2,
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                      )
                                                                    : Text(
                                                                        ("${controller.products.bodyEnProduct}"),
                                                                        style: TextStyle(
                                                                            fontSize: screenWidth *
                                                                                0.030,
                                                                            fontFamily:
                                                                                'Cairo',
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                46,
                                                                                45,
                                                                                45)),
                                                                        maxLines:
                                                                            2,
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                      )))),
                                                  ],
                                                )),
                                          ),
                                        );
                                      },
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        childAspectRatio: (1 / 1.8),
                                        crossAxisCount: 3,
                                        mainAxisSpacing: 8.0,
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
                                    fontSize: screenWidth * 0.046,
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
