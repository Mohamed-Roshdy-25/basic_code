import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:intl/intl.dart';

class AppFunctions {
  static String reverseString(String originalString) {
    List<String> charList = originalString.split('');
    List<String> reversedList = charList.reversed.toList();
    String reversedString = reversedList.join();

    debugPrint('Original String: $originalString');
    debugPrint('Reversed String: $reversedString');

    return reversedString;
  }

  static void showsToast(String text,Color color, BuildContext context,
      {int seconds = 5}){
    showToast(text,
      context: context,
      backgroundColor: color,
      animation: StyledToastAnimation.slideFromRightFade,
      reverseAnimation: StyledToastAnimation.fadeScale,
      position: StyledToastPosition.top,
      animDuration: const Duration(seconds: 1),
      duration: Duration(seconds: seconds),
      curve: Curves.elasticOut,
      reverseCurve: Curves.easeInOutCirc,
    );
  }

  static String prettyTime(String timeString){
    DateTime time = DateTime.parse("2023-01-01 $timeString");

    String formattedTime = DateFormat('h:mm a').format(time);

    return formattedTime;
  }

  static String prettyDate(String dateString){
    DateTime date = DateTime.parse(dateString);

    String formattedTime = DateFormat('MM-dd-yyyy').format(date);

    return formattedTime;
  }
}