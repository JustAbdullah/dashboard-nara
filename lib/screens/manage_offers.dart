import 'package:flutter/material.dart';

import '../responsive_screen.dart';

import '../widgets/desktop_widgets/celebs_desktop_widget/celebs_desktop_widget.dart';
import '../widgets/desktop_widgets/get_offers_desktop.dart/get_offers_desktop.dart';
import '../widgets/desktop_widgets/manage_colors/manage_colors.dart';
import '../widgets/mobile_widgets/celebs_manage/celebs_manage.dart';
import '../widgets/mobile_widgets/manage_colors/manage_mobile_colors.dart';
import '../widgets/mobile_widgets/manage_offers_mobile/manage_offer_mobile.dart';

class OffersManage extends StatelessWidget {
  const OffersManage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ResponsiveTheScreen(
              desktop: ManageDeskTopOffers(), mobile: ManageMobileOffers()),
        ],
      ),
    );
  }
}
