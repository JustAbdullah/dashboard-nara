import 'package:flutter/material.dart';

class ResponsiveTheScreen extends StatelessWidget {
  final Widget mobile;
  final Widget desktop;
  const ResponsiveTheScreen(
      {super.key, required this.mobile, required this.desktop});

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 750;

  static bool isDeskTop(BuildContext context) =>
      MediaQuery.of(context).size.width > 750;

  @override
  Widget build(BuildContext context) {
    if (isDeskTop(context)) {
      return desktop;
    } else
      return mobile;
  }
}
