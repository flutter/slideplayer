import 'package:flutter/material.dart';

Color colorFromString(String colorString, {Color errorColor}) {
  try {
    String formattedString;
    //#RRGGBBAA format
    if (colorString.startsWith('#')) {
      formattedString =
          '0x${colorString.substring(colorString.length - 2)}${colorString.substring(1, colorString.length - 2)}';
    } else {
      //0XAARRGGBB format
      formattedString = colorString;
    }
    return Color(int.parse(formattedString));
  } catch (e) {
    print('Error parsing a Color from a string: $e');
    return errorColor;
  }
}
