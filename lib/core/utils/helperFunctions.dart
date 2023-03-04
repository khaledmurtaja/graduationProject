
import 'package:flutter/material.dart';

/// Construct a color from a hex code string, of the format #RRGGBB.
Color hexToColor(String code) {
  return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}
///convert hexa color to material color
// MaterialColor primaryMaterialColor(int code, Map<int, Color> color){
// return MaterialColor(code, color);
// }