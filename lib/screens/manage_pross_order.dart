import 'package:flutter/material.dart';

import '../responsive_screen.dart';

import '../widgets/desktop_widgets/celebs_desktop_widget/celebs_desktop_widget.dart';
import '../widgets/desktop_widgets/manage_pross_order/manage_pross_order.dart';
import '../widgets/desktop_widgets/orders_desktop_widget/orders_desktop_widget.dart';
import '../widgets/mobile_widgets/celebs_manage/celebs_manage.dart';
import '../widgets/mobile_widgets/manage_pross_mobile_order/manage_orders_pross_mobie.dart';
import '../widgets/mobile_widgets/orders_manage_mobile/orders_manage_mobile.dart';

class OrdersProssManage extends StatelessWidget {
  const OrdersProssManage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ResponsiveTheScreen(
              desktop: ProssOrdersDeskTopWidget(),
              mobile: ProssOrdersMobileWidget()),
        ],
      ),
    );
  }
}
