import 'package:flutter/material.dart';
import 'package:basic_code_for_any_project/presentation/resources/font_manager.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color,double? height,TextDecoration? decoration)
{
  return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      height: height,
      decoration: decoration
  );
}

// light style

TextStyle getLightStyle({required double fontSize, required Color color, double? height,TextDecoration? decoration})
{
  return _getTextStyle(fontSize, FontWeightManager.light, color, height, decoration);
}

// regular style

TextStyle getRegularStyle({required double fontSize, required Color color, double? height,TextDecoration? decoration})
{
  return _getTextStyle(fontSize, FontWeightManager.regular, color, height, decoration);
}

// medium style

TextStyle getMediumStyle({required double fontSize , required Color color, double? height,TextDecoration? decoration})
{
  return _getTextStyle(fontSize, FontWeightManager.medium, color, height, decoration);
}

// bold style

TextStyle getBoldStyle({required double fontSize , required Color color, double? height,TextDecoration? decoration})
{
  return _getTextStyle(fontSize, FontWeightManager.bold, color, height, decoration);
}
