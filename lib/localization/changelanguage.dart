import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../appservices.dart';

class ChangeLanguageToLocale extends GetxController {
  Locale? language;

  bool themechage = false;
  RxBool isChange = false.obs;
  RxInt changeLangData = 1.obs;

  AppServices appServices = Get.find();
  /*ThemeData appTheme = themeAraib;*/

  changeLang(String langcode) {
    // ignore: unused_local_variable
    Locale locale = Locale(langcode);

    appServices.sharedPreferences.setString("lang", langcode);

    langcode == "ar" ? themechage = false : themechage = false;

/* Get.changeTheme(appTheme);*/
    if (langcode == "ar") {
      appServices.sharedPreferences.setInt("langData", 1);
      changeLangData.value =
          appServices.sharedPreferences.getInt('langData') as int;
      isChange.value = false;

      Get.changeTheme;
      update();
    } else if (langcode == "en") {
      appServices.sharedPreferences.setInt("langData", 1);
      changeLangData.value =
          appServices.sharedPreferences.getInt('langData') as int;

      isChange.value = false;
      Get.changeTheme;

      update();
    } else {
      update();
      Get.changeTheme;
    }
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    super.onInit();

    String? sharedPrefLang = appServices.sharedPreferences.getString("lang");
    if (sharedPrefLang == "ar") {
      language = Locale("ar");
      appServices.sharedPreferences.setInt("langData", 1);
      changeLangData.value =
          appServices.sharedPreferences.getInt('langData') as int;

      isChange.value = false;
      Get.changeTheme;
    } else if (sharedPrefLang == "ar") {
      language = Locale("ar");

      appServices.sharedPreferences.setInt("langData", 2);
      changeLangData.value =
          appServices.sharedPreferences.getInt('langData') as int;

      isChange.value = false;
      Get.changeTheme;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
  }
}
