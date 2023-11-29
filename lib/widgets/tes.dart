import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nara_dashboard/controller/add_products_controller.dart';

import '../localization/changelanguage.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    ChangeLanguageToLocale changeController = Get.put(ChangeLanguageToLocale());

    AddProductsController addProductsController =
        Get.put(AddProductsController());
    final size = MediaQuery.of(context).size;
    final screenHeight = size.height;
    final screenWidth = size.width;
    return Scaffold(
      body: Stack(children: [
        Padding(
            padding: EdgeInsets.only(bottom: screenHeight * 0.09),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                    child: Container(
                        alignment: Alignment.center,
                        width: screenWidth,
                        height: screenHeight / 10,
                        child: FutureBuilder(
                            future: addProductsController.getViewColors(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasError) {
                                return Text('Something went wrong');
                              } else if (snapshot.hasData) {
                                return ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: snapshot.data['data'].length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, i) {
                                      if (snapshot.hasData) {
                                        return Padding(
                                            padding: EdgeInsets.only(
                                                top: screenHeight * 0.03,
                                                bottom: screenHeight * 0.01),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      screenWidth * 0.01),
                                              child: InkWell(
                                                onTap: () {},
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      AnimatedContainer(
                                                        duration: Duration(
                                                            milliseconds: 750),
                                                        width:
                                                            screenWidth * 0.16,
                                                        height:
                                                            screenHeight / 20,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Color(
                                                              int.parse(snapshot
                                                                  .data['data']
                                                                      [i]
                                                                      ['color']
                                                                  .toString())),
                                                        ),
                                                      )
                                                    ]),
                                              ),
                                            ));
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
                                        child: CircularProgressIndicator(
                                            color: Colors.red)));
                              }
                            })))))
      ]),
    );
  }
}
