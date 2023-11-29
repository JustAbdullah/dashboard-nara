import 'package:flutter/material.dart';

import '../responsive_screen.dart';
import '../widgets/desktop_widgets/loading_desktop_widget.dart';
import '../widgets/mobile_widgets/loading_mobile_widget.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ResponsiveTheScreen(
              desktop: LoadingWidgetDeskTop(), mobile: LoadingWidget()),
        ],
      ),
    );
  }
}
