import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../responsive_screen.dart';
import '../desktop_widgets/home/home_desktop.dart';
import 'menu_desktop.dart';
import 'menu_mobile.dart';

class TheMenu extends StatelessWidget {
  const TheMenu({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return ResponsiveTheScreen(
      desktop: TheMenuDeskTop(),
      mobile: TheMenuMobile(),
    );
  }
}
