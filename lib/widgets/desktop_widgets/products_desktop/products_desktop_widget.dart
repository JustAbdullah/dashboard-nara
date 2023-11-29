import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nara_dashboard/widgets/desktop_widgets/home/home_desktop.dart';

import '../../../controller/products_controller.dart';
import '../../../localization/changelanguage.dart';
import '../../../screens/products_manage.dart';
import '../../menu/menu.dart';
import '../textfiled/textformfiled_widget_desktop/textformfiled_cut.dart';

class ProductsDeskTopWidget extends StatefulWidget {
  const ProductsDeskTopWidget({super.key});

  @override
  State<ProductsDeskTopWidget> createState() => _ProductsDeskTopWidgetState();
}

class _ProductsDeskTopWidgetState extends State<ProductsDeskTopWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenHeight = size.height;
    final screenWidth = size.width;
    ProductsManageController productsManageController =
        Get.put(ProductsManageController());
    ChangeLanguageToLocale changeController = Get.put(ChangeLanguageToLocale());

    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.1),
            child: Align(
                alignment: Alignment.topCenter,
                child: FutureBuilder(
                  future: productsManageController.getAllDataProducts(),
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

                            productsManageController.products.idProduct =
                                snapshot.data['data'][i]['id_product']
                                    .toString();
                            productsManageController.products.nameProduct =
                                snapshot.data['data'][i]['name_product']
                                    .toString();
                            productsManageController.products.bodyProduct =
                                snapshot.data['data'][i]['body_product']
                                    .toString();
                            productsManageController.products.nameProductEn =
                                snapshot.data['data'][i]['name_product_en']
                                    .toString();
                            productsManageController.products.bodyEnProduct =
                                snapshot.data['data'][i]['body_product_en']
                                    .toString();

                            ///
                            productsManageController.products.imageProductOne =
                                snapshot.data['data'][i]['image_product']
                                    .toString();

                            productsManageController.products.priceProduct =
                                snapshot.data['data'][i]['price_product']
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
                                    duration: Duration(milliseconds: 1200),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
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
                                        Align(
                                            alignment: Alignment.topCenter,
                                            child: changeController
                                                        .isChange.value ==
                                                    false
                                                ? Text(
                                                    ("${productsManageController.products.nameProduct}"),
                                                    style: TextStyle(
                                                      fontFamily: 'Cairo',
                                                      color: Colors.black,
                                                      fontSize:
                                                          screenWidth * 0.014,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ))
                                                : Text(
                                                    ("${productsManageController.products.nameProductEn}"),
                                                    style: TextStyle(
                                                      fontFamily: 'Cairo',
                                                      color: Colors.black,
                                                      fontSize:
                                                          screenWidth * 0.014,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ))),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                top: screenHeight * 0.06),
                                            child: Align(
                                              alignment: Alignment.topCenter,
                                              child: Container(
                                                width: screenWidth * 0.60,
                                                height: screenHeight * 0.18,
                                                child: Image.network(
                                                  "${productsManageController.products.imageProductOne}",
                                                  width: screenWidth * 0.60,
                                                  height: screenHeight * 0.18,
                                                ),
                                              ),
                                            )),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: screenHeight * 0.24),
                                          child: Align(
                                              alignment: Alignment.topCenter,
                                              child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                        ("${productsManageController.products.priceProduct}"),
                                                        style: TextStyle(
                                                            fontSize:
                                                                screenWidth *
                                                                    0.012,
                                                            fontFamily: 'Cairo',
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    93,
                                                                    219,
                                                                    97))),
                                                    SizedBox(
                                                      width:
                                                          screenWidth * 0.001,
                                                    ),
                                                    Text("351".tr,
                                                        style: TextStyle(
                                                            fontSize:
                                                                screenWidth *
                                                                    0.012,
                                                            fontFamily: 'Cairo',
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    93,
                                                                    219,
                                                                    97))),
                                                  ])),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                top: screenHeight * 0.3),
                                            child: Align(
                                                alignment: Alignment.topCenter,
                                                child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                screenWidth *
                                                                    0.05),
                                                    child: changeController
                                                                .isChange
                                                                .value ==
                                                            false
                                                        ? Text(
                                                            ("${productsManageController.products.bodyProduct}"),
                                                            style: TextStyle(
                                                                fontSize:
                                                                    screenWidth *
                                                                        0.010,
                                                                fontFamily:
                                                                    'Cairo',
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        46,
                                                                        45,
                                                                        45)),
                                                            maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign: TextAlign
                                                                .center,
                                                          )
                                                        : Text(
                                                            ("${productsManageController.products.bodyEnProduct}"),
                                                            style: TextStyle(
                                                                fontSize:
                                                                    screenWidth *
                                                                        0.010,
                                                                fontFamily:
                                                                    'Cairo',
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        46,
                                                                        45,
                                                                        45)),
                                                            maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign: TextAlign
                                                                .center,
                                                          )))),

////////////////////Colors///////////////////

                                        Padding(
                                            padding: EdgeInsets.only(
                                                top: screenHeight * 0.13),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text("لون المنتج".tr,
                                                  style: TextStyle(
                                                      fontSize:
                                                          screenWidth * 0.012,
                                                      fontFamily: 'Cairo',
                                                      color: Colors.black)),
                                            )),

                                        Padding(
                                            padding: EdgeInsets.only(
                                                top: screenHeight * 0.24),
                                            child: Align(
                                                alignment: Alignment.center,
                                                child: Container(
                                                    alignment: Alignment.center,
                                                    width: screenWidth,
                                                    height: screenHeight / 13,
                                                    child: FutureBuilder(
                                                        future: productsManageController
                                                            .getColorsTheProducts(
                                                                productsManageController
                                                                    .products
                                                                    .idProduct
                                                                    .toString()),
                                                        builder: (BuildContext
                                                                context,
                                                            AsyncSnapshot
                                                                snapshot) {
                                                          var data =
                                                              snapshot.data;
                                                          if (data == null) {
                                                            return Align(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Padding(
                                                                  padding: EdgeInsets.only(
                                                                      top: screenHeight *
                                                                          0.1),
                                                                  child: Column(
                                                                    children: [
                                                                      Container(
                                                                          width: screenWidth *
                                                                              0.1,
                                                                          height: screenHeight *
                                                                              0.1,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Colors.amber,
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Text(
                                                                              "!",
                                                                              style: TextStyle(fontFamily: 'Cairo', color: Colors.white, fontSize: screenWidth * 0.015, fontWeight: FontWeight.w900),
                                                                              textAlign: TextAlign.center,
                                                                            ),
                                                                          )),
                                                                      SizedBox(
                                                                        height: screenHeight *
                                                                            0.04,
                                                                      ),
                                                                      Text(
                                                                        "650"
                                                                            .tr,
                                                                        style: TextStyle(
                                                                            fontFamily:
                                                                                'Cairo',
                                                                            color: Colors
                                                                                .black,
                                                                            fontSize: screenWidth *
                                                                                0.012,
                                                                            fontWeight:
                                                                                FontWeight.w500),
                                                                      )
                                                                    ],
                                                                  )),
                                                            );
                                                          }
                                                          return ListView
                                                              .builder(
                                                                  scrollDirection:
                                                                      Axis
                                                                          .horizontal,
                                                                  itemCount: snapshot
                                                                      .data[
                                                                          'data']
                                                                      .length,
                                                                  shrinkWrap:
                                                                      true,
                                                                  itemBuilder:
                                                                      (context,
                                                                          i) {
                                                                    if (snapshot
                                                                        .hasData) {
                                                                      return Padding(
                                                                          padding: EdgeInsets.only(
                                                                              top: screenHeight * 0.03,
                                                                              bottom: screenHeight * 0.01),
                                                                          child: Padding(
                                                                              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.000001),
                                                                              child: InkWell(
                                                                                  onTap: () {},
                                                                                  child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                                                                                    AnimatedContainer(
                                                                                      duration: Duration(milliseconds: 750),
                                                                                      width: screenWidth * 0.07,
                                                                                      height: screenHeight / 20,
                                                                                      decoration: BoxDecoration(
                                                                                        shape: BoxShape.circle,
                                                                                        color: Color(int.parse(snapshot.data['data'][i]['color'].toString())),
                                                                                      ),
                                                                                    )
                                                                                  ]))));
                                                                    }
                                                                  });
                                                        })))),

                                        ////////////////////Sizes
                                        Padding(
                                            padding: EdgeInsets.only(
                                                bottom: screenHeight * 0.13),
                                            child: Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Text("حجم المنتج".tr,
                                                  style: TextStyle(
                                                      fontSize:
                                                          screenWidth * 0.012,
                                                      fontFamily: 'Cairo',
                                                      color: Colors.black)),
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                bottom: screenHeight * 0.04),
                                            child: Align(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: Container(
                                                    alignment: Alignment.center,
                                                    width: screenWidth,
                                                    height: screenHeight / 13,
                                                    child: FutureBuilder(
                                                        future: productsManageController
                                                            .getSizesTheProducts(
                                                                productsManageController
                                                                    .products
                                                                    .idProduct
                                                                    .toString()),
                                                        builder: (BuildContext
                                                                context,
                                                            AsyncSnapshot
                                                                snapshot) {
                                                          var data =
                                                              snapshot.data;
                                                          if (data == null) {
                                                            return Align(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Padding(
                                                                  padding: EdgeInsets.only(
                                                                      top: screenHeight *
                                                                          0.1),
                                                                  child: Column(
                                                                    children: [
                                                                      Container(
                                                                          width: screenWidth *
                                                                              0.1,
                                                                          height: screenHeight *
                                                                              0.1,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Colors.amber,
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Text(
                                                                              "!",
                                                                              style: TextStyle(fontFamily: 'Cairo', color: Colors.white, fontSize: screenWidth * 0.015, fontWeight: FontWeight.w900),
                                                                              textAlign: TextAlign.center,
                                                                            ),
                                                                          )),
                                                                      SizedBox(
                                                                        height: screenHeight *
                                                                            0.04,
                                                                      ),
                                                                      Text(
                                                                        "650"
                                                                            .tr,
                                                                        style: TextStyle(
                                                                            fontFamily:
                                                                                'Cairo',
                                                                            color: Colors
                                                                                .black,
                                                                            fontSize: screenWidth *
                                                                                0.012,
                                                                            fontWeight:
                                                                                FontWeight.w500),
                                                                      )
                                                                    ],
                                                                  )),
                                                            );
                                                          } else
                                                            return ListView
                                                                .builder(
                                                                    scrollDirection:
                                                                        Axis
                                                                            .horizontal,
                                                                    itemCount: snapshot
                                                                        .data[
                                                                            'data']
                                                                        .length,
                                                                    shrinkWrap:
                                                                        true,
                                                                    itemBuilder:
                                                                        (context,
                                                                            i) {
                                                                      if (snapshot
                                                                          .hasData) {
                                                                        return Padding(
                                                                            padding:
                                                                                EdgeInsets.only(top: screenHeight * 0.03, bottom: screenHeight * 0.01),
                                                                            child: Padding(
                                                                              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.0000001),
                                                                              child: InkWell(
                                                                                onTap: () {},
                                                                                child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                                                                                  AnimatedContainer(
                                                                                      alignment: Alignment.center,
                                                                                      duration: Duration(milliseconds: 750),
                                                                                      height: screenHeight / 11,
                                                                                      decoration: BoxDecoration(color: Colors.white),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                                                                                        child: Text(
                                                                                          "${snapshot.data['data'][i]['size']}",
                                                                                          style: TextStyle(fontFamily: 'Cairo', color: Colors.black, fontSize: screenWidth * 0.010, fontWeight: FontWeight.w400),
                                                                                          textAlign: TextAlign.center,
                                                                                        ),
                                                                                      ))
                                                                                ]),
                                                                              ),
                                                                            ));
                                                                      }
                                                                    });
                                                        })))),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              bottom: screenHeight * 0.00),
                                          child: Align(
                                              alignment: Alignment.bottomCenter,
                                              child: InkWell(
                                                onTap: () {
                                                  productsManageController
                                                          .products.idProduct =
                                                      snapshot.data['data'][i]
                                                              ['id_product']
                                                          .toString();
                                                  productsManageController
                                                          .products.idType =
                                                      snapshot.data['data'][i]
                                                              ['id_type']
                                                          .toString();
                                                  productsManageController
                                                          .products.subType =
                                                      snapshot.data['data'][i]
                                                              ['id_subtype']
                                                          .toString();
                                                  productsManageController
                                                          .products.idBrand =
                                                      snapshot.data['data'][i]
                                                              ['id_brand']
                                                          .toString();
                                                  productsManageController
                                                          .products.idBrand =
                                                      snapshot.data['data'][i]
                                                              ['id_brand']
                                                          .toString();
                                                  productsManageController
                                                          .products
                                                          .nameProduct =
                                                      snapshot.data['data'][i]
                                                              ['name_product']
                                                          .toString();
                                                  productsManageController
                                                          .products
                                                          .bodyProduct =
                                                      snapshot.data['data'][i]
                                                              ['body_product']
                                                          .toString();
                                                  productsManageController
                                                          .products
                                                          .nameProductEn =
                                                      snapshot.data['data'][i][
                                                              'name_product_en']
                                                          .toString();
                                                  productsManageController
                                                          .products
                                                          .bodyEnProduct =
                                                      snapshot.data['data'][i][
                                                              'body_product_en']
                                                          .toString();

                                                  ///
                                                  productsManageController
                                                          .products
                                                          .imageProductOne =
                                                      snapshot.data['data'][i]
                                                              ['image_product']
                                                          .toString();

                                                  productsManageController
                                                          .products
                                                          .priceProduct =
                                                      snapshot.data['data'][i]
                                                              ['price_product']
                                                          .toString();
                                                  productsManageController
                                                          .products
                                                          .priceoldProduct =
                                                      snapshot.data['data'][i]
                                                              ['old_price']
                                                          .toString();
                                                  productsManageController
                                                      .showTheOptions
                                                      .value = true;
                                                },
                                                child: Container(
                                                    width: screenWidth * 0.25,
                                                    height: screenHeight / 30,
                                                    decoration: BoxDecoration(
                                                        color: Colors.red,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(3)),
                                                    child: Center(
                                                      child: Text(
                                                        "352".tr,
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
                            childAspectRatio: (1 / 1.0),
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
          GetX<ProductsManageController>(
              builder: (controller) => Visibility(
                    visible: controller.showTheOptions.value,
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
                              controller.showTheOptions.value = false;
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
                          width: screenWidth * 0.5,
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
                                  "معلومات حول المنتج".tr,
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
                                  "القيام بحذف او تعديل المنتج".tr,
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
                                    productsManageController
                                        .editTheProduct.value = true;
                                  },
                                  child: Container(
                                    width: screenWidth * 0.1,
                                    decoration: BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius: BorderRadius.circular(2)),
                                    child: Text(
                                      "تعديل المنتج".tr,
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
                                  EdgeInsets.only(top: screenHeight * 0.12),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: InkWell(
                                  onTap: () {
                                    productsManageController
                                        .getTheColors.value = true;
                                  },
                                  child: Container(
                                    width: screenWidth * 0.1,
                                    decoration: BoxDecoration(
                                        color: Colors.orange,
                                        borderRadius: BorderRadius.circular(2)),
                                    child: Text(
                                      "إدارة الالوان".tr,
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
                                  EdgeInsets.only(top: screenHeight * 0.12),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: InkWell(
                                  onTap: () {
                                    productsManageController.getTheSizes.value =
                                        true;
                                  },
                                  child: Container(
                                    width: screenWidth * 0.1,
                                    decoration: BoxDecoration(
                                        color: Colors.pink,
                                        borderRadius: BorderRadius.circular(2)),
                                    child: Text(
                                      "إدارة الاحجام".tr,
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
                                    controller.deleteProduct(controller
                                        .products.idProduct
                                        .toString());

                                    Get.offAll(ProductsDeskTopWidget());
                                  },
                                  child: Container(
                                    width: screenWidth * 0.1,
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(2)),
                                    child: Text(
                                      "حذف المنتج".tr,
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
          TheMenu(),

          //////////////////////////Edit////////////////////////////////////////
          GetX<ProductsManageController>(
            builder: (controller) => Visibility(
              visible: controller.editTheProduct.value,
              child: Container(
                width: screenWidth,
                height: screenHeight,
                color: Colors.white,
                child: Stack(
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
                                    "تعديل المنتج".tr,
                                    style: TextStyle(
                                      fontFamily: 'Cairo',
                                      color: Colors.white,
                                      fontSize: screenWidth * 0.015,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: screenHeight * 0.10,
                              ),
                              GetX<ProductsManageController>(
                                  builder: (controller) => Padding(
                                        padding: EdgeInsets.only(
                                            left: screenWidth * 0.03,
                                            right: screenWidth * 0.03),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            !controller.isUploadImageOne.value
                                                ? Text("171".tr)
                                                : kIsWeb
                                                    ? Image.memory(
                                                        controller.webImageOne,
                                                        width:
                                                            screenWidth * 0.10,
                                                        fit: BoxFit.fill,
                                                      )
                                                    : Image.file(
                                                        controller
                                                            .imagePickerOne!,
                                                        width:
                                                            screenWidth * 0.10,
                                                        fit: BoxFit.fill,
                                                      ),
                                          ],
                                        ),
                                      )),
                              SizedBox(
                                height: screenHeight * 0.05,
                              ),
                              InkWell(
                                  onTap: () {
                                    controller.chooseImageOne();

                                    setState(() {});
                                  },
                                  child: GetX<ProductsManageController>(
                                      builder: (controller) => Container(
                                            width: screenWidth * 0.15,
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
                                                        screenWidth * 0.010),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ))),
                              SizedBox(
                                height: screenHeight * 0.03,
                              ),
                              Container(
                                  width: screenWidth,
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                          left: screenWidth * 0.00,
                                          right: screenWidth * 0.0),
                                      child: GetX<ProductsManageController>(
                                        builder: (controller) => Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "176".tr,
                                              style: TextStyle(
                                                fontFamily: 'Cairo',
                                                color: Colors.black,
                                                fontSize: screenWidth * 0.015,
                                              ),
                                            ),
                                            SizedBox(
                                              width: screenWidth * 0.03,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                controller.whatIsTypeOfProduct
                                                    .value = 5;

                                                controller.products.idType =
                                                    5.toString();
                                              },

                                              /////////////////////////////////// Types OF Prdoucts ///////////////////////////
                                              child: AnimatedContainer(
                                                  duration: Duration(
                                                      milliseconds: 300),
                                                  width: screenWidth * 0.08,
                                                  decoration: BoxDecoration(
                                                      color: controller
                                                                  .whatIsTypeOfProduct
                                                                  .value ==
                                                              5
                                                          ? const Color
                                                              .fromARGB(
                                                              255, 248, 186, 0)
                                                          : Color.fromARGB(
                                                              255, 48, 47, 47),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: Text(
                                                    "ملابس",
                                                    style: TextStyle(
                                                      fontFamily: 'Cairo',
                                                      color: Colors.white,
                                                      fontSize:
                                                          screenWidth * 0.012,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  )),
                                            ),
                                            SizedBox(
                                              width: screenWidth * 0.03,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                controller.whatIsTypeOfProduct
                                                    .value = 6;

                                                controller.products.idType =
                                                    6.toString();
                                              },
                                              child: AnimatedContainer(
                                                  duration: Duration(
                                                      milliseconds: 300),
                                                  width: screenWidth * 0.08,
                                                  decoration: BoxDecoration(
                                                      color: controller
                                                                  .whatIsTypeOfProduct
                                                                  .value ==
                                                              6
                                                          ? const Color
                                                              .fromARGB(
                                                              255, 248, 186, 0)
                                                          : Color.fromARGB(
                                                              255, 48, 47, 47),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: Text(
                                                    "أحذية",
                                                    style: TextStyle(
                                                      fontFamily: 'Cairo',
                                                      color: Colors.white,
                                                      fontSize:
                                                          screenWidth * 0.012,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  )),
                                            ),
                                            SizedBox(
                                              width: screenWidth * 0.03,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                controller.whatIsTypeOfProduct
                                                    .value = 7;
                                                controller.products.idType =
                                                    7.toString();
                                              },
                                              child: AnimatedContainer(
                                                  duration: Duration(
                                                      milliseconds: 300),
                                                  width: screenWidth * 0.08,
                                                  decoration: BoxDecoration(
                                                      color: controller
                                                                  .whatIsTypeOfProduct
                                                                  .value ==
                                                              7
                                                          ? const Color
                                                              .fromARGB(
                                                              255, 248, 186, 0)
                                                          : Color.fromARGB(
                                                              255, 48, 47, 47),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: Text(
                                                    "رياضة",
                                                    style: TextStyle(
                                                      fontFamily: 'Cairo',
                                                      color: Colors.white,
                                                      fontSize:
                                                          screenWidth * 0.012,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  )),
                                            ),
                                            SizedBox(
                                              width: screenWidth * 0.03,
                                            ),
                                            InkWell(
                                                onTap: () {
                                                  controller.whatIsTypeOfProduct
                                                      .value = 8;
                                                  controller.products.idType =
                                                      8.toString();
                                                },
                                                child: AnimatedContainer(
                                                    duration: Duration(
                                                        milliseconds: 300),
                                                    width: screenWidth * 0.08,
                                                    decoration: BoxDecoration(
                                                        color: controller
                                                                    .whatIsTypeOfProduct
                                                                    .value ==
                                                                8
                                                            ? const Color
                                                                .fromARGB(255,
                                                                248, 186, 0)
                                                            : Color.fromARGB(
                                                                255,
                                                                48,
                                                                47,
                                                                47),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: Text(
                                                      "عطور",
                                                      style: TextStyle(
                                                        fontFamily: 'Cairo',
                                                        color: Colors.white,
                                                        fontSize:
                                                            screenWidth * 0.012,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ))),
                                          ],
                                        ),
                                      ))),
                              SizedBox(
                                height: screenHeight * 0.03,
                              ),
                              Container(
                                  width: screenWidth,
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                          left: screenWidth * 0.00,
                                          right: screenWidth * 0.0),
                                      child: GetX<ProductsManageController>(
                                        builder: (controller) => Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "الاقسام الفرعية".tr,
                                              style: TextStyle(
                                                fontFamily: 'Cairo',
                                                color: Colors.black,
                                                fontSize: screenWidth * 0.015,
                                              ),
                                            ),
                                            SizedBox(
                                              width: screenWidth * 0.03,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                controller
                                                    .whatIsTheSubTypeOFProduct
                                                    .value = 0;
                                                controller.products.subType =
                                                    0.toString();
                                              },

                                              /////////////////////////////////// Types OF Prdoucts ///////////////////////////
                                              child: AnimatedContainer(
                                                  duration: Duration(
                                                      milliseconds: 300),
                                                  width: screenWidth * 0.08,
                                                  decoration: BoxDecoration(
                                                      color: controller
                                                                  .whatIsTheSubTypeOFProduct
                                                                  .value ==
                                                              0
                                                          ? const Color
                                                              .fromARGB(
                                                              255, 248, 186, 0)
                                                          : Color.fromARGB(
                                                              255, 48, 47, 47),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: Text(
                                                    "لايوجد",
                                                    style: TextStyle(
                                                      fontFamily: 'Cairo',
                                                      color: Colors.white,
                                                      fontSize:
                                                          screenWidth * 0.012,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  )),
                                            ),
                                            SizedBox(
                                              width: screenWidth * 0.03,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                controller
                                                    .whatIsTheSubTypeOFProduct
                                                    .value = 1;
                                                controller.products.subType =
                                                    1.toString();
                                              },
                                              child: AnimatedContainer(
                                                  duration: Duration(
                                                      milliseconds: 300),
                                                  width: screenWidth * 0.08,
                                                  decoration: BoxDecoration(
                                                      color: controller
                                                                  .whatIsTheSubTypeOFProduct
                                                                  .value ==
                                                              1
                                                          ? const Color
                                                              .fromARGB(
                                                              255, 248, 186, 0)
                                                          : Color.fromARGB(
                                                              255, 48, 47, 47),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: Text(
                                                    "أقمصة",
                                                    style: TextStyle(
                                                      fontFamily: 'Cairo',
                                                      color: Colors.white,
                                                      fontSize:
                                                          screenWidth * 0.012,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  )),
                                            ),
                                            SizedBox(
                                              width: screenWidth * 0.03,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                controller
                                                    .whatIsTheSubTypeOFProduct
                                                    .value = 2;
                                                controller.products.subType =
                                                    2.toString();
                                              },
                                              child: AnimatedContainer(
                                                  duration: Duration(
                                                      milliseconds: 300),
                                                  width: screenWidth * 0.08,
                                                  decoration: BoxDecoration(
                                                      color: controller
                                                                  .whatIsTheSubTypeOFProduct
                                                                  .value ==
                                                              2
                                                          ? const Color
                                                              .fromARGB(
                                                              255, 248, 186, 0)
                                                          : Color.fromARGB(
                                                              255, 48, 47, 47),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: Text(
                                                    "فساتين",
                                                    style: TextStyle(
                                                      fontFamily: 'Cairo',
                                                      color: Colors.white,
                                                      fontSize:
                                                          screenWidth * 0.012,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  )),
                                            ),
                                            SizedBox(
                                              width: screenWidth * 0.03,
                                            ),
                                            InkWell(
                                                onTap: () {
                                                  controller
                                                      .whatIsTheSubTypeOFProduct
                                                      .value = 3;
                                                  controller.products.subType =
                                                      3.toString();
                                                },
                                                child: AnimatedContainer(
                                                    duration: Duration(
                                                        milliseconds: 300),
                                                    width: screenWidth * 0.08,
                                                    decoration: BoxDecoration(
                                                        color: controller
                                                                    .whatIsTheSubTypeOFProduct
                                                                    .value ==
                                                                3
                                                            ? const Color
                                                                .fromARGB(255,
                                                                248, 186, 0)
                                                            : Color.fromARGB(
                                                                255,
                                                                48,
                                                                47,
                                                                47),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: Text(
                                                      "بنطلونات",
                                                      style: TextStyle(
                                                        fontFamily: 'Cairo',
                                                        color: Colors.white,
                                                        fontSize:
                                                            screenWidth * 0.012,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ))),
                                            SizedBox(
                                              width: screenWidth * 0.03,
                                            ),
                                            InkWell(
                                                onTap: () {
                                                  controller
                                                      .whatIsTheSubTypeOFProduct
                                                      .value = 4;
                                                  controller.products.subType =
                                                      4.toString();
                                                },
                                                child: AnimatedContainer(
                                                    duration: Duration(
                                                        milliseconds: 300),
                                                    width: screenWidth * 0.08,
                                                    decoration: BoxDecoration(
                                                        color: controller
                                                                    .whatIsTheSubTypeOFProduct
                                                                    .value ==
                                                                4
                                                            ? const Color
                                                                .fromARGB(255,
                                                                248, 186, 0)
                                                            : Color.fromARGB(
                                                                255,
                                                                48,
                                                                47,
                                                                47),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: Text(
                                                      "جاكيتات",
                                                      style: TextStyle(
                                                        fontFamily: 'Cairo',
                                                        color: Colors.white,
                                                        fontSize:
                                                            screenWidth * 0.012,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ))),
                                            SizedBox(
                                              width: screenWidth * 0.03,
                                            ),
                                            InkWell(
                                                onTap: () {
                                                  controller
                                                      .whatIsTheSubTypeOFProduct
                                                      .value = 6;
                                                  controller.products.subType =
                                                      6.toString();
                                                },
                                                child: AnimatedContainer(
                                                    duration: Duration(
                                                        milliseconds: 300),
                                                    width: screenWidth * 0.08,
                                                    decoration: BoxDecoration(
                                                        color: controller
                                                                    .whatIsTheSubTypeOFProduct
                                                                    .value ==
                                                                6
                                                            ? const Color
                                                                .fromARGB(255,
                                                                248, 186, 0)
                                                            : Color.fromARGB(
                                                                255,
                                                                48,
                                                                47,
                                                                47),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: Text(
                                                      "حقائب",
                                                      style: TextStyle(
                                                        fontFamily: 'Cairo',
                                                        color: Colors.white,
                                                        fontSize:
                                                            screenWidth * 0.012,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ))),
                                          ],
                                        ),
                                      ))),
                              SizedBox(
                                height: screenHeight * 0.05,
                              ),
                              Container(
                                width: screenWidth * 0.50,
                                child: TextFormFiledCusDeskTop(
                                  keyboardType: TextInputType.name,
                                  controllerData: controller.nameProdu,
                                  value: (value) {
                                    controller.products.nameProduct =
                                        value.toString();

                                    return null;
                                  },
                                  hintData: "177".tr,
                                  iconData: Icons.menu_book,
                                  labelData: "177".tr,
                                  fillColor: Color.fromARGB(255, 48, 47, 47),
                                  iconColor: Colors.white,
                                  hintColor: Colors.red,
                                  fontColor: Colors.white,
                                  borderSideColor:
                                      Color.fromARGB(255, 48, 47, 47),
                                ),
                              ),
                              SizedBox(
                                height: screenHeight * 0.05,
                              ),
                              Container(
                                width: screenWidth * 0.50,
                                child: TextFormFiledCusDeskTop(
                                  keyboardType: TextInputType.name,
                                  controllerData: controller.nameProduEn,
                                  value: (value) {
                                    controller.products.nameProduct =
                                        value.toString();

                                    return null;
                                  },
                                  hintData: "178".tr,
                                  iconData: Icons.menu_book,
                                  labelData: "178".tr,
                                  fillColor: Color.fromARGB(255, 48, 47, 47),
                                  iconColor: Colors.white,
                                  hintColor: Colors.red,
                                  fontColor: Colors.white,
                                  borderSideColor:
                                      Color.fromARGB(255, 48, 47, 47),
                                ),
                              ),
                              Text(
                                "نوع البرند".tr,
                                style: TextStyle(
                                  fontFamily: 'Cairo',
                                  color: Colors.black,
                                  fontSize: screenWidth * 0.015,
                                ),
                              ),
                              SizedBox(
                                height: screenHeight * 0.05,
                              ),
                              Container(
                                  width: screenWidth,
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                          left: screenWidth * 0.00,
                                          right: screenWidth * 0.0),
                                      child: SizedBox(
                                        height: screenHeight / 2,
                                        child: FutureBuilder(
                                          future: productsManageController
                                              .getAllDataBrands(),
                                          builder: (BuildContext context,
                                              AsyncSnapshot snapshot) {
                                            var data = snapshot.data;
                                            if (data == null) {
                                              return Align(
                                                alignment: Alignment.center,
                                                child: Padding(
                                                    padding: EdgeInsets.only(
                                                        top:
                                                            screenHeight * 0.1),
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                            width: screenWidth *
                                                                0.1,
                                                            height:
                                                                screenHeight *
                                                                    0.1,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.amber,
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child: Center(
                                                              child: Text(
                                                                "!",
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'Cairo',
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        screenWidth *
                                                                            0.015,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w900),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                            )),
                                                        SizedBox(
                                                          height: screenHeight *
                                                              0.04,
                                                        ),
                                                        Text(
                                                          "650".tr,
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Cairo',
                                                              color:
                                                                  Colors.black,
                                                              fontSize:
                                                                  screenWidth *
                                                                      0.012,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        )
                                                      ],
                                                    )),
                                              );
                                            } else if (snapshot.hasData) {
                                              return GridView.builder(
                                                  itemCount: snapshot
                                                      .data['data'].length,
                                                  shrinkWrap: true,
                                                  itemBuilder: (context, i) {
                                                    // var number = snapshot.data['data'].length;//

                                                    controller
                                                            .products.idBrand =
                                                        snapshot.data['data'][i]
                                                                ['id_brand']
                                                            .toString();
                                                    productsManageController
                                                            .brands.id_brands =
                                                        snapshot.data['data'][i]
                                                                ['id_brand']
                                                            .toString();
                                                    productsManageController
                                                            .brands
                                                            .name_brand_ar =
                                                        snapshot.data['data'][i]
                                                                [
                                                                'name_brand_ar']
                                                            .toString();

                                                    productsManageController
                                                            .brands
                                                            .name_brand_en =
                                                        snapshot.data['data'][i]
                                                                [
                                                                'name_brand_en']
                                                            .toString();
                                                    productsManageController
                                                            .brands
                                                            .image_brand =
                                                        snapshot.data['data'][i]
                                                                ['image_brand']
                                                            .toString();
                                                    productsManageController
                                                            .brands.id_brands =
                                                        snapshot.data['data'][i]
                                                                ['id_brand']
                                                            .toString();
                                                    productsManageController
                                                            .brands
                                                            .name_brand_ar =
                                                        snapshot.data['data'][i]
                                                                [
                                                                'name_brand_ar']
                                                            .toString();

                                                    productsManageController
                                                            .brands
                                                            .name_brand_en =
                                                        snapshot.data['data'][i]
                                                                [
                                                                'name_brand_en']
                                                            .toString();
                                                    productsManageController
                                                            .brands
                                                            .image_brand =
                                                        snapshot.data['data'][i]
                                                                ['image_brand']
                                                            .toString();

                                                    ///

                                                    return Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 2,
                                                                horizontal: 2),
                                                        child: GetX<
                                                            ProductsManageController>(
                                                          builder:
                                                              (controller) =>
                                                                  InkWell(
                                                            onTap: () async {
                                                              ////////////////
                                                              controller.brands
                                                                      .id_brands =
                                                                  snapshot.data[
                                                                          'data']
                                                                          [i][
                                                                          'id_brand']
                                                                      .toString();

                                                              controller
                                                                  .whatIsBrand
                                                                  .value = controller
                                                                      .brands
                                                                      .id_brands =
                                                                  snapshot.data[
                                                                          'data']
                                                                          [i][
                                                                          'id_brand']
                                                                      .toString();

                                                              /////////////////////
                                                            },
                                                            child:
                                                                AnimatedContainer(
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            1200),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: controller.whatIsBrand.value ==
                                                                              snapshot.data['data'][i]['id_brand']
                                                                                  .toString()
                                                                          ? Colors
                                                                              .amber
                                                                          : Colors
                                                                              .white,
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          color: controller.whatIsBrand.value == snapshot.data['data'][i]['id_brand'].toString()
                                                                              ? Colors.amber
                                                                              : Color.fromARGB(255, 248, 245, 245).withOpacity(0.7),
                                                                          spreadRadius:
                                                                              10,
                                                                          blurRadius:
                                                                              10,
                                                                          offset: Offset(
                                                                              0,
                                                                              3), // changes position of shadow
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    width:
                                                                        screenWidth *
                                                                            0.10,
                                                                    height:
                                                                        screenHeight *
                                                                            0.20,
                                                                    child:
                                                                        Stack(
                                                                      children: [
                                                                        Align(
                                                                            alignment:
                                                                                Alignment.topCenter,
                                                                            child: changeController.isChange.value == false
                                                                                ? Text((snapshot.data['data'][i]['name_brand_ar']),
                                                                                    style: TextStyle(
                                                                                      fontFamily: 'Cairo',
                                                                                      color: Colors.black,
                                                                                      fontSize: screenWidth * 0.014,
                                                                                      fontWeight: FontWeight.w700,
                                                                                    ))
                                                                                : Text(("${controller.brands.name_brand_en}"),
                                                                                    style: TextStyle(
                                                                                      fontFamily: 'Cairo',
                                                                                      color: Colors.black,
                                                                                      fontSize: screenWidth * 0.014,
                                                                                      fontWeight: FontWeight.w700,
                                                                                    ))),
                                                                        Padding(
                                                                            padding:
                                                                                EdgeInsets.only(top: screenHeight * 0.06),
                                                                            child: Align(
                                                                              alignment: Alignment.topCenter,
                                                                              child: Container(
                                                                                width: screenWidth * 0.60,
                                                                                height: screenHeight * 0.18,
                                                                                child: Image.network(
                                                                                  snapshot.data['data'][i]['image_brand'].toString(),
                                                                                  width: screenWidth * 0.60,
                                                                                  height: screenHeight * 0.18,
                                                                                ),
                                                                              ),
                                                                            )),
                                                                      ],
                                                                    )),
                                                          ),
                                                        ));
                                                  },
                                                  gridDelegate:
                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                    childAspectRatio: (1 / 0.5),
                                                    crossAxisCount: 3,
                                                    mainAxisSpacing: 20.0,
                                                    crossAxisSpacing: 5.0,
                                                  ));
                                            } else if (snapshot.hasError) {
                                              return Center(
                                                child:
                                                    Text("${snapshot.error}"),
                                              );
                                            } else {
                                              return Center(
                                                child:
                                                    Text("${snapshot.error}"),
                                              );
                                            }
                                          },
                                        ),
                                      ))),
                              SizedBox(
                                height: screenHeight * 0.05,
                              ),
                              SizedBox(
                                height: screenHeight * 0.05,
                              ),
                              Container(
                                  width: screenWidth * 0.70,
                                  child: TextFormFiledCusDeskTop(
                                    keyboardType: TextInputType.name,
                                    controllerData: controller.bodyProdu,
                                    value: (value) {
                                      controller.products.bodyProduct =
                                          value.toString();
                                      return null;
                                    },
                                    hintData: "185".tr,
                                    iconData: Icons.menu_book,
                                    labelData: "185".tr,
                                    fillColor: Color.fromARGB(255, 48, 47, 47),
                                    iconColor: Colors.white,
                                    hintColor: Colors.red,
                                    fontColor: Colors.white,
                                    borderSideColor:
                                        Color.fromARGB(255, 48, 47, 47),
                                  )),
                              SizedBox(
                                height: screenHeight * 0.05,
                              ),
                              Container(
                                  width: screenWidth * 0.70,
                                  child: TextFormFiledCusDeskTop(
                                    keyboardType: TextInputType.name,
                                    controllerData: controller.bodyProduEn,
                                    value: (value) {
                                      controller.products.bodyEnProduct =
                                          value.toString();
                                      return null;
                                    },
                                    hintData: "186".tr,
                                    iconData: Icons.menu_book,
                                    labelData: "186".tr,
                                    fillColor: Color.fromARGB(255, 48, 47, 47),
                                    iconColor: Colors.white,
                                    hintColor: Colors.red,
                                    fontColor: Colors.white,
                                    borderSideColor:
                                        Color.fromARGB(255, 48, 47, 47),
                                  )),
                              SizedBox(
                                height: screenHeight * 0.05,
                              ),
                              /*  Container(
                            width: screenWidth,
                            child: Padding(
                                padding: EdgeInsets.only(
                                    left: changeController.isChange.value == false
                                        ? 0
                                        : screenWidth * 0.045,
                                    right: screenWidth * 0.0),
                                child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: screenWidth * 0.2,
                                            right: screenWidth * 0.2),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "لون المنتج",
                                              style: TextStyle(
                                                fontFamily: 'Cairo',
                                                color: Colors.black,
                                                fontSize: screenWidth * 0.018,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            Container(
                                                alignment: Alignment.center,
                                                width: screenWidth / 2,
                                                height: screenHeight / 10,
                                                child: FutureBuilder(
                                                    future: addProductsController
                                                        .getViewColors(),
                                                    builder: (BuildContext context,
                                                        AsyncSnapshot snapshot) {
                                                      if (snapshot.hasError) {
                                                        return Text(
                                                            'Something went wrong');
                                                      } else if (snapshot.hasData) {
                                                        return ListView.builder(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            itemCount: snapshot
                                                                .data['data'].length,
                                                            shrinkWrap: true,
                                                            itemBuilder: (context, i) {
                                                              if (snapshot.hasData) {
                                                                return Padding(
                                                                    padding: EdgeInsets.only(
                                                                        top:
                                                                            screenHeight *
                                                                                0.03,
                                                                        bottom:
                                                                            screenHeight *
                                                                                0.01),
                                                                    child: Padding(
                                                                        padding: EdgeInsets
                                                                            .symmetric(
                                                                                horizontal:
                                                                                    screenWidth *
                                                                                        0.01),
                                                                        child: GetX<
                                                                            AddProductsController>(
                                                                          builder:
                                                                              (theNewController) =>
                                                                                  InkWell(
                                                                            onTap: () {
                                                                              theNewController
                                                                                  .whatIsTheColor
                                                                                  .value = int.parse(snapshot.data[
                                                                                      'data']
                                                                                      [
                                                                                      i]
                                                                                      [
                                                                                      'id_color']
                                                                                  .toString());
                                                                            },
                                                                            child: Row(
                                                                                mainAxisAlignment:
                                                                                    MainAxisAlignment.center,
                                                                                children: [
                                                                                  AnimatedContainer(
                                                                                    duration:
                                                                                        Duration(milliseconds: 750),
                                                                                    width: theNewController.whatIsTheColor.value == int.parse(snapshot.data['data'][i]['id_color'].toString())
                                                                                        ? screenWidth * 0.09
                                                                                        : screenWidth * 0.05,
                                                                                    height:
                                                                                        screenHeight / 20,
                                                                                    decoration:
                                                                                        BoxDecoration(
                                                                                      shape: BoxShape.rectangle,
                                                                                      color: Color(int.parse(snapshot.data['data'][i]['color'].toString())),
                                                                                    ),
                                                                                  )
                                                                                ]),
                                                                          ),
                                                                        )));
                                                              } else {
                                                                return Center(
                                                                    child: Center(
                                                                        child:
                                                                            CircularProgressIndicator(
                                                                  color: Colors.red,
                                                                )));
                                                              }
                                                            });
                                                      } else {
                                                        return Center(
                                                            child: Center(
                                                                child:
                                                                    CircularProgressIndicator(
                                                                        color: Colors
                                                                            .red)));
                                                      }
                                                    })),
                                          ],
                                        ),
                                      ),
                                    )))),*/
                              SizedBox(
                                height: screenHeight * 0.05,
                              ),
                              Container(
                                  width: screenWidth * 0.30,
                                  child: TextFormFiledCusDeskTop(
                                    keyboardType: TextInputType.name,
                                    controllerData: controller.priceProdu,
                                    value: (value) {
                                      controller.products.priceProduct =
                                          value.toString();

                                      return null;
                                    },
                                    hintData: "197".tr,
                                    iconData: Icons.menu_book,
                                    labelData: "197".tr,
                                    fillColor: Color.fromARGB(255, 48, 47, 47),
                                    iconColor: Colors.white,
                                    hintColor: Colors.red,
                                    fontColor: Colors.white,
                                    borderSideColor:
                                        Color.fromARGB(255, 48, 47, 47),
                                  )),
                              SizedBox(
                                height: screenHeight * 0.05,
                              ),
                              Container(
                                  width: screenWidth * 0.30,
                                  child: TextFormFiledCusDeskTop(
                                    keyboardType: TextInputType.name,
                                    controllerData: controller.priceProduOld,
                                    value: (value) {
                                      controller.products.priceoldProduct =
                                          value.toString();

                                      return null;
                                    },
                                    hintData: "سعر المنتج القديم".tr,
                                    iconData: Icons.menu_book,
                                    labelData: "سعر المنتج القديم".tr,
                                    fillColor: Color.fromARGB(255, 48, 47, 47),
                                    iconColor: Colors.white,
                                    hintColor: Colors.red,
                                    fontColor: Colors.white,
                                    borderSideColor:
                                        Color.fromARGB(255, 48, 47, 47),
                                  )),
                              SizedBox(
                                height: screenHeight * 0.05,
                              ),
                              InkWell(
                                onTap: () {
                                  controller.editProducts(
                                      controller.products.idProduct.toString(),
                                      controller.products.nameProduct
                                          .toString(),
                                      controller.products.nameProductEn
                                          .toString(),
                                      controller.products.bodyProduct
                                          .toString(),
                                      controller.products.bodyEnProduct
                                          .toString(),
                                      controller.products.priceProduct
                                          .toString(),
                                      controller.products.priceoldProduct
                                          .toString(),
                                      controller.products.idType.toString(),
                                      controller.products.subType.toString(),
                                      controller.products.idBrand.toString(),
                                      controller.products.imageProductOne
                                          .toString());

                                  controller.isAddIntoDatabase.value = true;
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      bottom: screenHeight * 0.05),
                                  child: Container(
                                    width: screenWidth * 0.15,
                                    height: screenHeight * 0.05,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 251, 189, 1),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Center(
                                      child: Text(
                                        "تعديل المنتج".tr,
                                        style: TextStyle(
                                            fontFamily: 'Cairo',
                                            color: Colors.black,
                                            fontSize: screenWidth * 0.012),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: screenWidth * 0.03, top: screenHeight * 0.1),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: InkWell(
                          onTap: () {
                            controller.editTheProduct.value = false;
                          },
                          child: Container(
                            width: screenWidth * 0.1,
                            height: screenHeight * 0.07,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(5)),
                            child: Center(
                              child: Text(
                                "الإخفاء".tr,
                                style: TextStyle(
                                  fontFamily: 'Cairo',
                                  color: Colors.white,
                                  fontSize: screenWidth * 0.015,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GetX<ProductsManageController>(
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
                                        fontSize: screenWidth * 0.018,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ]),
                            )),
                    GetX<ProductsManageController>(
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
                                    width: screenWidth * 0.3,
                                    height: screenHeight * 0.23,
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Stack(children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: screenHeight * 0.03),
                                        child: Align(
                                          alignment: Alignment.topCenter,
                                          child: Text(
                                            "لقد تم تعديل المنتج بنجاح ".tr,
                                            style: TextStyle(
                                                fontFamily: 'Cairo',
                                                color: Colors.white,
                                                fontSize: screenWidth * 0.018,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: screenWidth * 0.00),
                                        child: Align(
                                          alignment: Alignment.bottomCenter,
                                          child: InkWell(
                                            onTap: () {
                                              controller.isUploadimage.value =
                                                  false;
                                              controller.isAddIntoDatabase
                                                  .value = false;
                                              controller.editTheProduct.value =
                                                  false;
                                              Get.offAll(ProductsManage());
                                            },
                                            child: Container(
                                              width: screenWidth * 0.1,
                                              decoration: BoxDecoration(
                                                  color: Colors.red,
                                                  borderRadius:
                                                      BorderRadius.circular(2)),
                                              child: Text(
                                                "العودة للرئيسية".tr,
                                                style: TextStyle(
                                                    fontFamily: 'Cairo',
                                                    color: Colors.white,
                                                    fontSize:
                                                        screenWidth * 0.012,
                                                    fontWeight:
                                                        FontWeight.w500),
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
                  ],
                ),
              ),
            ),
          ),
          /////////////////////////////////////////////////////////////////Colors Manage//////////////////////////
          GetX<ProductsManageController>(
              builder: (controller) => Visibility(
                  visible: controller.getTheColors.value,
                  child: Container(
                    width: screenWidth,
                    height: screenHeight,
                    color: Colors.white,
                    child: Stack(children: [
                      Padding(
                        padding: EdgeInsets.only(top: screenHeight * 0.02),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            "الالوان المراد إضافتها للمنتج".tr,
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
                                width: screenWidth * 0.45,
                                height: screenHeight * 0.60,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Stack(children: [
                                  Align(
                                      alignment:
                                          changeController.isChange.value ==
                                                  false
                                              ? Alignment.topRight
                                              : Alignment.topLeft,
                                      child: Padding(
                                          padding: EdgeInsets.only(
                                              top: screenHeight * 0.01,
                                              right: changeController
                                                          .isChange.value ==
                                                      false
                                                  ? screenWidth * 0.034
                                                  : 0,
                                              left: changeController
                                                          .isChange.value ==
                                                      false
                                                  ? 0
                                                  : screenWidth * 0.034),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                "اسم اللون".tr,
                                                style: TextStyle(
                                                    fontFamily: 'Cairo',
                                                    color: Colors.black,
                                                    fontSize:
                                                        screenWidth * 0.012,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              SizedBox(
                                                width: screenWidth * 0.06,
                                              ),
                                              Text(
                                                "كود اللون".tr,
                                                style: TextStyle(
                                                    fontFamily: 'Cairo',
                                                    color: Colors.black,
                                                    fontSize:
                                                        screenWidth * 0.012,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              SizedBox(
                                                width: screenWidth * 0.06,
                                              ),
                                              Text(
                                                "اللون".tr,
                                                style: TextStyle(
                                                    fontFamily: 'Cairo',
                                                    color: Colors.black,
                                                    fontSize:
                                                        screenWidth * 0.012,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              SizedBox(
                                                width: screenWidth * 0.05,
                                              ),
                                              Text(
                                                "الأختيار".tr,
                                                style: TextStyle(
                                                    fontFamily: 'Cairo',
                                                    color: Colors.black,
                                                    fontSize:
                                                        screenWidth * 0.012,
                                                    fontWeight:
                                                        FontWeight.w500),
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
                                      future: controller.getAllDataColors(),
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
                                                        width:
                                                            screenWidth * 0.1,
                                                        height:
                                                            screenHeight * 0.1,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.amber,
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            "!",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Cairo',
                                                                color: Colors
                                                                    .white,
                                                                fontSize:
                                                                    screenWidth *
                                                                        0.015,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w900),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                        )),
                                                    SizedBox(
                                                      height:
                                                          screenHeight * 0.06,
                                                    ),
                                                    Text(
                                                      "650".tr,
                                                      style: TextStyle(
                                                          fontFamily: 'Cairo',
                                                          color: Colors.black,
                                                          fontSize:
                                                              screenWidth *
                                                                  0.012,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    )
                                                  ],
                                                )),
                                          );
                                        } else if (snapshot.hasData) {
                                          return ListView.builder(
                                              itemCount:
                                                  snapshot.data['data'].length,
                                              shrinkWrap: true,
                                              itemBuilder: (context, i) {
                                                controller.color.id_color =
                                                    snapshot.data['data'][i]
                                                            ['id_color']
                                                        .toString();
                                                controller.color.color_name =
                                                    snapshot.data['data'][i]
                                                            ['color_name']
                                                        .toString();
                                                controller.color.color_name =
                                                    snapshot.data['data'][i]
                                                            ['color']
                                                        .toString();

                                                return InkWell(
                                                    onTap: () {
                                                      controller
                                                              .color.id_color =
                                                          snapshot.data['data']
                                                                  [i]
                                                                  ['id_color']
                                                              .toString();
                                                      controller.color
                                                              .color_name =
                                                          snapshot.data['data']
                                                                  [i]
                                                                  ['color_name']
                                                              .toString();
                                                      controller.color
                                                              .color_name =
                                                          snapshot.data['data']
                                                                  [i]['color']
                                                              .toString();
                                                    },
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                        top:
                                                            screenHeight * 0.01,
                                                      ),
                                                      child: Container(
                                                        width: screenWidth,
                                                        height:
                                                            screenHeight * 0.1,
                                                        decoration:
                                                            BoxDecoration(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        238,
                                                                        236,
                                                                        236)),
                                                        child: Stack(children: [
                                                          Align(
                                                              alignment: changeController
                                                                          .isChange
                                                                          .value ==
                                                                      false
                                                                  ? Alignment
                                                                      .topRight
                                                                  : Alignment
                                                                      .topLeft,
                                                              child: Padding(
                                                                  padding: EdgeInsets.only(
                                                                      top: screenHeight *
                                                                          0.01,
                                                                      right: changeController.isChange.value ==
                                                                              false
                                                                          ? screenWidth *
                                                                              0.043
                                                                          : 0,
                                                                      left: changeController.isChange.value ==
                                                                              false
                                                                          ? 0
                                                                          : screenWidth *
                                                                              0.040),
                                                                  child: Text(
                                                                    "${snapshot.data['data'][i]['color_name'].toString()}",
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            'Cairo',
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            screenWidth *
                                                                                0.013,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ))),
                                                          Align(
                                                              alignment: changeController
                                                                          .isChange
                                                                          .value ==
                                                                      false
                                                                  ? Alignment
                                                                      .topRight
                                                                  : Alignment
                                                                      .topLeft,
                                                              child: Padding(
                                                                  padding: EdgeInsets.only(
                                                                      top: screenHeight *
                                                                          0.01,
                                                                      right: changeController.isChange.value ==
                                                                              false
                                                                          ? screenWidth *
                                                                              0.12
                                                                          : 0,
                                                                      left: changeController.isChange.value ==
                                                                              false
                                                                          ? 0
                                                                          : screenWidth *
                                                                              0.11),
                                                                  child: Text(
                                                                    "${snapshot.data['data'][i]['color'].toString()}",
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            'Cairo',
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            screenWidth *
                                                                                0.013,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ))),
                                                          Align(
                                                              alignment: changeController
                                                                          .isChange
                                                                          .value ==
                                                                      false
                                                                  ? Alignment
                                                                      .topRight
                                                                  : Alignment
                                                                      .topLeft,
                                                              child: Padding(
                                                                  padding: EdgeInsets.only(
                                                                      top: screenHeight *
                                                                          0.01,
                                                                      right: changeController.isChange.value ==
                                                                              false
                                                                          ? screenWidth *
                                                                              0.22
                                                                          : 0,
                                                                      left: changeController.isChange.value ==
                                                                              false
                                                                          ? 0
                                                                          : screenWidth *
                                                                              0.195),
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        screenWidth *
                                                                            0.05,
                                                                    decoration: BoxDecoration(
                                                                        shape: BoxShape
                                                                            .circle,
                                                                        color: Color(
                                                                            int.parse("${snapshot.data['data'][i]['color'].toString()}"))),
                                                                  ))),
                                                          Align(
                                                              alignment: changeController
                                                                          .isChange
                                                                          .value ==
                                                                      false
                                                                  ? Alignment
                                                                      .topRight
                                                                  : Alignment
                                                                      .topLeft,
                                                              child: Padding(
                                                                  padding: EdgeInsets.only(
                                                                      top: screenHeight *
                                                                          0.01,
                                                                      right: changeController.isChange.value ==
                                                                              false
                                                                          ? screenWidth *
                                                                              0.3
                                                                          : 0,
                                                                      left: changeController.isChange.value ==
                                                                              false
                                                                          ? 0
                                                                          : screenWidth *
                                                                              0.75),
                                                                  child: InkWell(
                                                                      onTap: () {
                                                                        controller
                                                                            .isChoesColor
                                                                            .value = snapshot.data['data'][i]
                                                                                ['id_color']
                                                                            .toString();
                                                                      },
                                                                      child: GetX<ProductsManageController>(
                                                                        builder:
                                                                            (Thecontroller) =>
                                                                                Container(
                                                                          width:
                                                                              screenWidth * 0.05,
                                                                          height:
                                                                              screenHeight * 0.07,
                                                                          decoration: BoxDecoration(
                                                                              color: Thecontroller.isChoesColor.value == snapshot.data['data'][i]['id_color'].toString() ? Colors.amber : Colors.red,
                                                                              borderRadius: BorderRadius.circular(5)),
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Text(
                                                                              "ألاختيار".tr,
                                                                              style: TextStyle(fontFamily: 'Cairo', color: Colors.white, fontSize: screenWidth * 0.010, fontWeight: FontWeight.w500),
                                                                              textAlign: TextAlign.center,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      )))),
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
                      Padding(
                        padding: EdgeInsets.only(bottom: screenHeight * 0.04),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: InkWell(
                            onTap: () {
                              controller.addColorsProsuct(
                                  controller.products.idProduct.toString(),
                                  controller.isChoesColor.value.toString());

                              controller.getTheColors.value = false;

                              controller.showTheOptions.value = false;

                              Get.offAll(ProductsManage);
                            },
                            child: Container(
                              width: screenWidth * 0.25,
                              decoration: BoxDecoration(
                                  color: Colors.green[700],
                                  borderRadius: BorderRadius.circular(2)),
                              child: Text(
                                "اضافة اللون للمنتج".tr,
                                style: TextStyle(
                                    fontFamily: 'Cairo',
                                    color: Colors.white,
                                    fontSize: screenWidth * 0.017,
                                    fontWeight: FontWeight.w500),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: screenWidth * 0.03, top: screenHeight * 0.1),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: InkWell(
                            onTap: () {
                              controller.getTheColors.value = false;
                            },
                            child: Container(
                              width: screenWidth * 0.1,
                              height: screenHeight * 0.07,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: Text(
                                  "الإخفاء".tr,
                                  style: TextStyle(
                                    fontFamily: 'Cairo',
                                    color: Colors.white,
                                    fontSize: screenWidth * 0.015,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ))),

          /////////////////////////////////////Colors////////////////////

          //////////////////////////Sizes////////////////////////////////////////////
          GetX<ProductsManageController>(
              builder: (controller) => Visibility(
                  visible: controller.getTheSizes.value,
                  child: Container(
                      width: screenWidth,
                      height: screenHeight,
                      color: Colors.white,
                      child: Stack(children: [
                        Padding(
                          padding: EdgeInsets.only(top: screenHeight * 0.02),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              "قائمة الأحجام المراد اختيارها".tr,
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
                                  width: screenWidth * 0.35,
                                  height: screenHeight * 0.60,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Stack(children: [
                                    Align(
                                        alignment:
                                            changeController.isChange.value ==
                                                    false
                                                ? Alignment.topRight
                                                : Alignment.topLeft,
                                        child: Padding(
                                            padding: EdgeInsets.only(
                                                top: screenHeight * 0.01,
                                                right: changeController
                                                            .isChange.value ==
                                                        false
                                                    ? screenWidth * 0.034
                                                    : 0,
                                                left: changeController
                                                            .isChange.value ==
                                                        false
                                                    ? 0
                                                    : screenWidth * 0.034),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "معرف الحجم".tr,
                                                  style: TextStyle(
                                                      fontFamily: 'Cairo',
                                                      color: Colors.black,
                                                      fontSize:
                                                          screenWidth * 0.012,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                SizedBox(
                                                  width: screenWidth * 0.06,
                                                ),
                                                Text(
                                                  "الحجم".tr,
                                                  style: TextStyle(
                                                      fontFamily: 'Cairo',
                                                      color: Colors.black,
                                                      fontSize:
                                                          screenWidth * 0.012,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                SizedBox(
                                                  width: screenWidth * 0.08,
                                                ),
                                                Text(
                                                  "التحكم".tr,
                                                  style: TextStyle(
                                                      fontFamily: 'Cairo',
                                                      color: Colors.black,
                                                      fontSize:
                                                          screenWidth * 0.012,
                                                      fontWeight:
                                                          FontWeight.w500),
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
                                        future: controller.getAllDataSizes(),
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
                                                          width:
                                                              screenWidth * 0.1,
                                                          height: screenHeight *
                                                              0.1,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.amber,
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              "!",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      'Cairo',
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      screenWidth *
                                                                          0.015,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w900),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                          )),
                                                      SizedBox(
                                                        height:
                                                            screenHeight * 0.06,
                                                      ),
                                                      Text(
                                                        "650".tr,
                                                        style: TextStyle(
                                                            fontFamily: 'Cairo',
                                                            color: Colors.black,
                                                            fontSize:
                                                                screenWidth *
                                                                    0.012,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      )
                                                    ],
                                                  )),
                                            );
                                          } else if (snapshot.hasData) {
                                            return ListView.builder(
                                                itemCount: snapshot
                                                    .data['data'].length,
                                                shrinkWrap: true,
                                                itemBuilder: (context, i) {
                                                  controller.sizes.id_size =
                                                      snapshot.data['data'][i]
                                                              ['id_size']
                                                          .toString();
                                                  controller.sizes.size =
                                                      snapshot.data['data'][i]
                                                              ['size']
                                                          .toString();

                                                  return InkWell(
                                                      onTap: () {
                                                        controller
                                                                .sizes.id_size =
                                                            snapshot
                                                                .data['data'][i]
                                                                    ['id_size']
                                                                .toString();
                                                        controller.sizes.size =
                                                            snapshot
                                                                .data['data'][i]
                                                                    ['size']
                                                                .toString();
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                          top: screenHeight *
                                                              0.01,
                                                        ),
                                                        child: Container(
                                                          width: screenWidth,
                                                          height: screenHeight *
                                                              0.1,
                                                          decoration:
                                                              BoxDecoration(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          238,
                                                                          236,
                                                                          236)),
                                                          child: Stack(
                                                              children: [
                                                                Align(
                                                                    alignment: changeController.isChange.value ==
                                                                            false
                                                                        ? Alignment
                                                                            .topRight
                                                                        : Alignment
                                                                            .topLeft,
                                                                    child: Padding(
                                                                        padding: EdgeInsets.only(top: screenHeight * 0.01, right: changeController.isChange.value == false ? screenWidth * 0.06 : 0, left: changeController.isChange.value == false ? 0 : screenWidth * 0.040),
                                                                        child: Text(
                                                                          "${snapshot.data['data'][i]['id_size'].toString()}",
                                                                          style: TextStyle(
                                                                              fontFamily: 'Cairo',
                                                                              color: Colors.black,
                                                                              fontSize: screenWidth * 0.013,
                                                                              fontWeight: FontWeight.w600),
                                                                        ))),
                                                                Align(
                                                                    alignment: changeController.isChange.value ==
                                                                            false
                                                                        ? Alignment
                                                                            .topRight
                                                                        : Alignment
                                                                            .topLeft,
                                                                    child: Padding(
                                                                        padding: EdgeInsets.only(top: screenHeight * 0.01, right: changeController.isChange.value == false ? screenWidth * 0.15 : 0, left: changeController.isChange.value == false ? 0 : screenWidth * 0.11),
                                                                        child: Text(
                                                                          "${snapshot.data['data'][i]['size'].toString()}",
                                                                          style: TextStyle(
                                                                              fontFamily: 'Cairo',
                                                                              color: Colors.black,
                                                                              fontSize: screenWidth * 0.013,
                                                                              fontWeight: FontWeight.w600),
                                                                        ))),
                                                                Align(
                                                                    alignment: changeController.isChange.value ==
                                                                            false
                                                                        ? Alignment
                                                                            .topRight
                                                                        : Alignment
                                                                            .topLeft,
                                                                    child: Padding(
                                                                        padding: EdgeInsets.only(top: screenHeight * 0.01, right: changeController.isChange.value == false ? screenWidth * 0.25 : 0, left: changeController.isChange.value == false ? 0 : screenWidth * 0.195),
                                                                        child: InkWell(
                                                                            onTap: () {
                                                                              controller.sizes.id_size = snapshot.data['data'][i]['id_size'].toString();
                                                                              controller.sizes.size = snapshot.data['data'][i]['size'].toString();

                                                                              controller.isChoesSize.value = snapshot.data['data'][i]['id_size'].toString();
                                                                            },
                                                                            child: GetX<ProductsManageController>(
                                                                              builder: (Thecontroller) => Container(
                                                                                width: screenWidth * 0.05,
                                                                                height: screenHeight * 0.07,
                                                                                decoration: BoxDecoration(color: Thecontroller.isChoesSize.value == snapshot.data['data'][i]['id_size'].toString() ? Colors.amber : Colors.red, borderRadius: BorderRadius.circular(5)),
                                                                                child: Center(
                                                                                  child: Text(
                                                                                    "أختيار الحجم".tr,
                                                                                    style: TextStyle(fontFamily: 'Cairo', color: Colors.white, fontSize: screenWidth * 0.010, fontWeight: FontWeight.w500),
                                                                                    textAlign: TextAlign.center,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            )))),
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
                        Padding(
                          padding: EdgeInsets.only(bottom: screenHeight * 0.04),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: InkWell(
                              onTap: () {
                                controller.addSizesProsuct(
                                    controller.products.idProduct.toString(),
                                    controller.isChoesSize.value.toString());
                                controller.getTheSizes.value = false;
                                controller.getTheColors.value = false;

                                controller.showTheOptions.value = false;

                                Get.offAll(ProductsManage);
                              },
                              child: Container(
                                width: screenWidth * 0.25,
                                decoration: BoxDecoration(
                                    color: Colors.green[700],
                                    borderRadius: BorderRadius.circular(2)),
                                child: Text(
                                  "اضافة الحجم للمنتج".tr,
                                  style: TextStyle(
                                      fontFamily: 'Cairo',
                                      color: Colors.white,
                                      fontSize: screenWidth * 0.017,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: screenWidth * 0.03,
                              top: screenHeight * 0.1),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: InkWell(
                              onTap: () {
                                controller.getTheSizes.value = false;
                              },
                              child: Container(
                                width: screenWidth * 0.1,
                                height: screenHeight * 0.07,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Center(
                                  child: Text(
                                    "الإخفاء".tr,
                                    style: TextStyle(
                                      fontFamily: 'Cairo',
                                      color: Colors.white,
                                      fontSize: screenWidth * 0.015,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ])))),
        ],
      ),
    );
  }
}
