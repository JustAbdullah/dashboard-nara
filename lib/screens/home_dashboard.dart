import 'package:flutter/material.dart';
import 'package:nara_dashboard/widgets/desktop_widgets/home/home_desktop.dart';

import '../responsive_screen.dart';
import '../widgets/desktop_widgets/loading_desktop_widget.dart';
import '../widgets/mobile_widgets/home_mobile/home_mobile.dart';

class HomeDashBoard extends StatelessWidget {
  const HomeDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ResponsiveTheScreen(desktop: HomeDeskTop(), mobile: HomeMobile()),
        ],
      ),
    );
  }
}
