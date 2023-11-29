import 'package:flutter/material.dart';

import '../responsive_screen.dart';
import '../widgets/desktop_widgets/login_desktop/login_desktop_widget.dart';
import '../widgets/mobile_widgets/login_mobile/login_mobile_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveTheScreen(
        desktop: LoginDeskTopWidget(),
        mobile: LoginMobileWidget(),
      ),
    );
  }
}
