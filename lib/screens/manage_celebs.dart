import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/products_controller.dart';
import '../responsive_screen.dart';

import '../widgets/desktop_widgets/brands_desktop_widget/brands_desktop_widget.dart';
import '../widgets/desktop_widgets/celebs_desktop_widget/celebs_desktop_widget.dart';
import '../widgets/desktop_widgets/products_desktop/products_desktop_widget.dart';
import '../widgets/mobile_widgets/brands_manage/brands_manage.dart';
import '../widgets/mobile_widgets/celebs_manage/celebs_manage.dart';
import '../widgets/mobile_widgets/products_manage/products_manage_mobile.dart';

class CelebsManage extends StatelessWidget {
  const CelebsManage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ResponsiveTheScreen(
              desktop: CelebsDeskTopWidget(), mobile: CelebsMobileWidget()),
        ],
      ),
    );
  }
}
