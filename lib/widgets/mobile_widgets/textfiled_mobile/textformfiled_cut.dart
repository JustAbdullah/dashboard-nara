import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class TextFormFiledCus extends StatelessWidget {
  final String labelData;
  final String hintData;
  final IconData iconData;
  TextInputType? keyboardType;
  final TextEditingController? controllerData;
  var fillColor;
  var hintColor;
  var iconColor;
  var borderSideColor;
  var fontColor;

  final String? Function(String?) value;
  TextFormFiledCus({
    super.key,
    required this.labelData,
    required this.hintData,
    required this.iconData,
    required this.controllerData,
    required this.value,
    required this.fillColor,
    required this.hintColor,
    required this.iconColor,
    required this.borderSideColor,
    required this.fontColor,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final screenWidth = _size.width;
    return TextFormField(
      keyboardType: keyboardType,
      controller: controllerData,
      onChanged: value,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor,
        hintText: hintData.tr,
        hintStyle: TextStyle(color: hintColor, fontSize: screenWidth * 0.007),
        suffixIcon: Icon(iconData, color: iconColor),
        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        label: Text(
          labelData,
        ),
        labelStyle: TextStyle(
          fontFamily: 'Cairo',
          color: fontColor,
          fontSize: screenWidth * 0.035,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderSideColor, width: 2),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderSideColor, width: 2),
        ),
      ),
    );
  }
}
