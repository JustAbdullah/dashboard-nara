import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nara_dashboard/widgets/mobile_widgets/products_manage/products_manage_mobile.dart';

import '../controller/products_controller.dart';
import '../responsive_screen.dart';

import '../widgets/desktop_widgets/products_desktop/products_desktop_widget.dart';

class ProductsManage extends StatelessWidget {
  const ProductsManage({super.key});

  @override
  Widget build(BuildContext context) {
    ProductsManageController productsManageController =
        Get.put(ProductsManageController());
    return Scaffold(
      body: Stack(
        children: [
          ResponsiveTheScreen(
              desktop: ProductsDeskTopWidget(),
              mobile: ProductsTheMobileWidget()),
        ],
      ),
    );
  }
}
