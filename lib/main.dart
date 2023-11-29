import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nara_dashboard/appservices.dart';
import 'package:nara_dashboard/controller/ttt.dart';
import 'package:nara_dashboard/firebase_options.dart';
import 'package:nara_dashboard/localization/changelanguage.dart';
import 'package:nara_dashboard/localization/translation.dart';
import 'package:nara_dashboard/screens/add_brands.dart';
import 'package:nara_dashboard/screens/add_celebs.dart';
import 'package:nara_dashboard/screens/add_products.dart';
import 'package:nara_dashboard/screens/home_dashboard.dart';
import 'package:nara_dashboard/screens/loading.dart';
import 'package:nara_dashboard/screens/login_screen.dart';
import 'package:nara_dashboard/screens/manage_celebs.dart';
import 'package:nara_dashboard/screens/manage_orders.dart';
import 'package:nara_dashboard/screens/manage_sizes.dart';
import 'package:nara_dashboard/screens/products_manage.dart';
import 'package:nara_dashboard/widgets/desktop_widgets/add_brands_desktop_widgets/add_brands_desktop_widgets.dart';
import 'package:nara_dashboard/widgets/desktop_widgets/add_celebs_desktop_widget/add_celebs_desktop_widgets.dart';
import 'package:nara_dashboard/widgets/desktop_widgets/login_desktop/login_desktop_widget.dart';
import 'package:nara_dashboard/widgets/tes.dart';
import 'package:firebase_core/firebase_core.dart';

import 'screens/manage_brands.dart';
import 'screens/manage_colors.dart';
import 'screens/manage_offers.dart';
import 'screens/manage_pross_order.dart';
import 'screens/manage_users.dart';
import 'widgets/desktop_widgets/add_products_desktop_widget.dart/add_products_desktop_widget.dart';
import 'widgets/desktop_widgets/brands_desktop_widget/brands_desktop_widget.dart';
import 'widgets/desktop_widgets/celebs_desktop_widget/celebs_desktop_widget.dart';
import 'widgets/desktop_widgets/get_offers_desktop.dart/get_offers_desktop.dart';
import 'widgets/desktop_widgets/home/home_desktop.dart';
import 'widgets/desktop_widgets/manage_colors/manage_colors.dart';
import 'widgets/desktop_widgets/manage_pross_order/manage_pross_order.dart';
import 'widgets/desktop_widgets/manage_size_desktop/manage_sizes_desktop.dart';
import 'widgets/desktop_widgets/orders_desktop_widget/orders_desktop_widget.dart';
import 'widgets/desktop_widgets/products_desktop/products_desktop_widget.dart';
import 'widgets/desktop_widgets/users_manage_desktop/users_desktop_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: const MyApp()));
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}

ChangeLanguageToLocale chagnelangcontroller = Get.put(ChangeLanguageToLocale());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: chagnelangcontroller.language,
      translations: AppTranslation(),
      title: "لوحة تحكم نارة".tr,
      home: LoginScreen(),
      builder: (context, child) {
        final mediaQueryData = MediaQuery.of(context);

        final scale = mediaQueryData.textScaleFactor.clamp(0.9, 0.9);

        return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: scale),
            child: child!);
      },
    );
  }
}
