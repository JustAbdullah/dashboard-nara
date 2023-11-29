import 'package:flutter/material.dart';

import '../responsive_screen.dart';

import '../widgets/desktop_widgets/celebs_desktop_widget/celebs_desktop_widget.dart';
import '../widgets/desktop_widgets/manage_size_desktop/manage_sizes_desktop.dart';
import '../widgets/desktop_widgets/orders_desktop_widget/orders_desktop_widget.dart';
import '../widgets/mobile_widgets/celebs_manage/celebs_manage.dart';
import '../widgets/mobile_widgets/manage_sizes/manage_sizes_mobile.dart';
import '../widgets/mobile_widgets/orders_manage_mobile/orders_manage_mobile.dart';

class ManageSizes extends StatelessWidget {
  const ManageSizes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ResponsiveTheScreen(
              desktop: ManageDeskTopSizes(), mobile: ManageMobileSizes()),
        ],
      ),
    );
  }
}
