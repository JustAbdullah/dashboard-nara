import 'dart:html' as html;
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:mime_type/mime_type.dart';
import 'package:nara_dashboard/linksapi.dart';
import 'package:path/path.dart' as Path;

import '../crud.dart';

class tController extends GetxController {
  Crud crud = Crud();
  html.File? cloudFile;
  var fileBytes;
  Image? imageWidget;
  Future getFile() async {
    Image? fromPicker = await ImagePickerWeb.getImageAsWidget();
    Uint8List? bytesFromPicker = await ImagePickerWeb.getImageAsBytes();
    html.File? imageFile = (await ImagePickerWeb.getMultiImagesAsFile())?[0];
    upIm(imageFile as File);
  }

  upIm(File? mfile) async {
    var response =
        await crud.postRequestFile(AppLinksApi.uploadimage, {}, mfile!);
  }
}
