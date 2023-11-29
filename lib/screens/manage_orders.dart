import 'package:flutter/material.dart';

import '../responsive_screen.dart';

import '../widgets/desktop_widgets/celebs_desktop_widget/celebs_desktop_widget.dart';
import '../widgets/desktop_widgets/orders_desktop_widget/orders_desktop_widget.dart';
import '../widgets/mobile_widgets/celebs_manage/celebs_manage.dart';
import '../widgets/mobile_widgets/orders_manage_mobile/orders_manage_mobile.dart';

class OrdersManage extends StatelessWidget {
  const OrdersManage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ResponsiveTheScreen(
              desktop: OrdersDeskTopWidget(), mobile: OrdersMobileWidget()),
        ],
      ),
    );
  }
}
