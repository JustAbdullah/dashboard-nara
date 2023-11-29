import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../screens/add_brands.dart';
import '../../../screens/add_celebs.dart';
import '../../../screens/add_products.dart';
import '../../../screens/manage_brands.dart';
import '../../../screens/manage_celebs.dart';
import '../../../screens/manage_colors.dart';
import '../../../screens/manage_offers.dart';
import '../../../screens/manage_orders.dart';
import '../../../screens/manage_pross_order.dart';
import '../../../screens/manage_sizes.dart';
import '../../../screens/manage_users.dart';
import '../../../screens/products_manage.dart';
import '../brands_desktop_widget/brands_desktop_widget.dart';
import '../celebs_desktop_widget/celebs_desktop_widget.dart';
import '../orders_desktop_widget/orders_desktop_widget.dart';
import '../products_desktop/products_desktop_widget.dart';
import '../users_manage_desktop/users_desktop_widget.dart';

class HomeDeskTop extends StatelessWidget {
  const HomeDeskTop({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenHeight = size.height;
    final screenWidth = size.width;
    return Scaffold(
      body: Stack(children: [
        Padding(
          padding: EdgeInsets.only(
              top: screenHeight * 0.03, right: screenWidth * 0.02),
          child: Align(
            alignment: Alignment.topLeft,
            child: InkWell(
              onTap: () {
                Get.offAll(HomeDeskTop());
              },
              child: Container(
                alignment: Alignment.center,
                width: screenWidth * 0.15,
                height: screenHeight / 20,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(0)),
                child: Text(
                  "نسخة الحاسوب",
                  style: TextStyle(
                      fontFamily: 'Cairo',
                      color: Colors.white,
                      fontSize: screenWidth * 0.014,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: screenHeight * 0.01),
          child: Align(
            alignment: Alignment.topCenter,
            child: Text(
              "الاقسام الرئيسية",
              style: TextStyle(
                  fontFamily: 'Cairo',
                  color: Colors.black,
                  fontSize: screenWidth * 0.028,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
        Padding(
            padding: EdgeInsets.only(
                top: screenHeight * 0.2, bottom: screenHeight * 0.07),
            child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.2),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.offAll(ManageUsers());
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: screenWidth * 0.23,
                                height: screenHeight / 7,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.amber[900],
                                    shape: BoxShape.rectangle),
                                child: Text(
                                  "إدارة المستخدمين",
                                  style: TextStyle(
                                      fontFamily: 'Cairo',
                                      color: Colors.white,
                                      fontSize: screenWidth * 0.017,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.offAll(ProductsManage());
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: screenWidth * 0.23,
                                height: screenHeight / 7,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.blue[900],
                                    shape: BoxShape.rectangle),
                                child: Text(
                                  "إدارة المنتجات",
                                  style: TextStyle(
                                      fontFamily: 'Cairo',
                                      color: Colors.white,
                                      fontSize: screenWidth * 0.017,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: screenHeight * 0.05,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                                onTap: () {
                                  Get.offAll(BrandsManage());
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: screenWidth * 0.23,
                                  height: screenHeight / 7,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.cyan[700],
                                      shape: BoxShape.rectangle),
                                  child: Text(
                                    "إدارة الماركات",
                                    style: TextStyle(
                                        fontFamily: 'Cairo',
                                        color: Colors.white,
                                        fontSize: screenWidth * 0.017,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,
                                  ),
                                )),
                            InkWell(
                              onTap: () {
                                Get.offAll(CelebsManage());
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: screenWidth * 0.23,
                                height: screenHeight / 7,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.red[600],
                                    shape: BoxShape.rectangle),
                                child: Text(
                                  "إدارة المشاهير",
                                  style: TextStyle(
                                      fontFamily: 'Cairo',
                                      color: Colors.white,
                                      fontSize: screenWidth * 0.017,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: screenHeight * 0.05,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                                onTap: () {
                                  Get.offAll(OrdersManage());
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: screenWidth * 0.23,
                                  height: screenHeight / 7,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.green[700],
                                      shape: BoxShape.rectangle),
                                  child: Text(
                                    "إدارة الطلبيات",
                                    style: TextStyle(
                                        fontFamily: 'Cairo',
                                        color: Colors.white,
                                        fontSize: screenWidth * 0.017,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,
                                  ),
                                )),
                            InkWell(
                                onTap: () {
                                  Get.offAll(AddProductsManage());
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: screenWidth * 0.23,
                                  height: screenHeight / 7,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.purple[600],
                                      shape: BoxShape.rectangle),
                                  child: Text(
                                    "إضافة منتج",
                                    style: TextStyle(
                                        fontFamily: 'Cairo',
                                        color: Colors.white,
                                        fontSize: screenWidth * 0.017,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,
                                  ),
                                )),
                          ],
                        ),
                        SizedBox(
                          height: screenHeight * 0.05,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                                onTap: () {
                                  Get.offAll(addCelebsManage());
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: screenWidth * 0.23,
                                  height: screenHeight / 7,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.pink[700],
                                      shape: BoxShape.rectangle),
                                  child: Text(
                                    "اضافة مشهور",
                                    style: TextStyle(
                                        fontFamily: 'Cairo',
                                        color: Colors.white,
                                        fontSize: screenWidth * 0.017,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,
                                  ),
                                )),
                            InkWell(
                              onTap: () {
                                Get.offAll(addBrandsManage());
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: screenWidth * 0.23,
                                height: screenHeight / 7,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.brown[600],
                                    shape: BoxShape.rectangle),
                                child: Text(
                                  "إضافة ماركة",
                                  style: TextStyle(
                                      fontFamily: 'Cairo',
                                      color: Colors.white,
                                      fontSize: screenWidth * 0.017,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: screenHeight * 0.05,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                                onTap: () {
                                  Get.offAll(ManageSizes());
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: screenWidth * 0.23,
                                  height: screenHeight / 7,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.orange[700],
                                      shape: BoxShape.rectangle),
                                  child: Text(
                                    "إدارة الاحجام",
                                    style: TextStyle(
                                        fontFamily: 'Cairo',
                                        color: Colors.white,
                                        fontSize: screenWidth * 0.017,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,
                                  ),
                                )),
                            InkWell(
                              onTap: () {
                                Get.offAll(ColorsManage());
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: screenWidth * 0.23,
                                height: screenHeight / 7,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.cyan[600],
                                    shape: BoxShape.rectangle),
                                child: Text(
                                  "إدارة الالوان",
                                  style: TextStyle(
                                      fontFamily: 'Cairo',
                                      color: Colors.white,
                                      fontSize: screenWidth * 0.017,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: screenHeight * 0.05,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                                onTap: () {
                                  Get.offAll(OffersManage());
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: screenWidth * 0.23,
                                  height: screenHeight / 7,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.blueGrey[700],
                                      shape: BoxShape.rectangle),
                                  child: Text(
                                    "إدارة العروض",
                                    style: TextStyle(
                                        fontFamily: 'Cairo',
                                        color: Colors.white,
                                        fontSize: screenWidth * 0.017,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,
                                  ),
                                )),
                            InkWell(
                              onTap: () {
                                Get.offAll(OrdersProssManage());
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: screenWidth * 0.23,
                                height: screenHeight / 7,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.amber[600],
                                    shape: BoxShape.rectangle),
                                child: Text(
                                  "معالجة العمليات",
                                  style: TextStyle(
                                      fontFamily: 'Cairo',
                                      color: Colors.white,
                                      fontSize: screenWidth * 0.017,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ))),
      ]),
    );
  }
}
