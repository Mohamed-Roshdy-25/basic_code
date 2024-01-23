import 'package:flutter/material.dart';
import 'package:basic_code_for_any_project/presentation/resources/font_manager.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color)
{
  return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight);
}

// medium style

TextStyle getLightStyle({required double fontSize, required Color color})
{
  return _getTextStyle(fontSize, FontWeightManager.light, color);
}

// regular style

TextStyle getRegularStyle({required double fontSize, required Color color})
{
  return _getTextStyle(fontSize, FontWeightManager.regular, color);
}

// medium style

TextStyle getMediumStyle({required double fontSize , required Color color})
{
  return _getTextStyle(fontSize, FontWeightManager.medium, color);
}

// semiBold style

TextStyle getSemiBoldStyle({required double fontSize , required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color);
}

// bold style

TextStyle getBoldStyle({required double fontSize , required Color color})
{
  return _getTextStyle(fontSize, FontWeightManager.bold, color);
}
