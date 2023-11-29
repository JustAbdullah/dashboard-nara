import 'dart:html' as html;
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:mime_type/mime_type.dart';
import 'package:nara_dashboard/controller/d_controller.dart';
import 'package:nara_dashboard/crud.dart';
import 'package:path/path.dart' as Path;

class tess extends StatefulWidget {
  const tess({super.key});

  @override
  State<tess> createState() => _tessState();
}

class _tessState extends State<tess> {
  @override
  Widget build(BuildContext context) {
    Crud crud = Crud();
    html.File cloudFile;
    var fileBytes;
    Image imageWidget;

    tController add = Get.put(tController());
    return Scaffold(
      body: Stack(children: [
        Align(
          alignment: Alignment.center,
          child: InkWell(
            onTap: () async {
              Image? fromPicker = await ImagePickerWeb.getImageAsWidget();
              var mediaData = await ImagePickerWeb.getImageInfo;
              String? mimeType = mime(Path.basename(mediaData!.fileName!));
              html.File mediaFile = new html.File(
                  mediaData.data!, mediaData.fileName!, {'type': mimeType});

              if (mediaFile != null) {
                setState(() {
                  cloudFile = mediaFile;
                  fileBytes = mediaData.data;
                  imageWidget = Image.memory(mediaData.data!);
                  File file = mediaFile as File;
                  File filen = mediaData.data as File;
                  File filens = mediaFile as File;

                  Future.delayed(Duration(seconds: 15), () async {
                    add.upIm(cloudFile as File);
                    add.upIm(fileBytes);
                    add.upIm(imageWidget as File);
                    add.upIm(mediaFile as File);
                    add.upIm(file);
                    add.upIm(filen);
                    add.upIm(filens);
                  });
                });
              }
            },
            child: Container(
              height: 300,
              width: 500,
              color: Colors.amber,
              child: Text(
                "ClickNow",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
