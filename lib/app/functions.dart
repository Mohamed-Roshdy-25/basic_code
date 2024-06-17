import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';

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
      animation: StyledToastAnimation.slideFromTopFade,
      reverseAnimation: StyledToastAnimation.slideToTopFade,
      position: StyledToastPosition.top,
      animDuration: const Duration(seconds: 2),
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

  static Future<void> navigateTo(BuildContext context, Widget screen) async {
    await Navigator.of(context).push(PageTransition(
      child: screen,
      type: PageTransitionType.rightToLeft,
      alignment: Alignment.center,
      duration: const Duration(milliseconds: 500),
      reverseDuration: const Duration(milliseconds: 500),
    ));
  }

  static void navigateToAndReplacement(BuildContext context, Widget screen){
    Navigator.of(context).pushReplacement(PageTransition(
      child: screen,
      type: PageTransitionType.rightToLeft,
      alignment: Alignment.center,
      duration: const Duration(milliseconds: 500),
      reverseDuration: const Duration(milliseconds: 500),
    ));
  }

  static void navigateToAndFinish(BuildContext context, Widget screen){
    Navigator.of(context).pushAndRemoveUntil(PageTransition(
      child: screen,
      type: PageTransitionType.fade,
      alignment: Alignment.center,
      duration: const Duration(milliseconds: 500),
      reverseDuration: const Duration(milliseconds: 500),
    ),(route) => false,);
  }

  static void popThenNavigateTo(BuildContext context, Widget screen){
    Navigator.pop(context);
    Navigator.of(context).push(PageTransition(
      child: screen,
      type: PageTransitionType.rightToLeft,
      alignment: Alignment.center,
      duration: const Duration(milliseconds: 500),
      reverseDuration: const Duration(milliseconds: 500),
    ));
  }

  static String convertToArabic(int number) {
    List<String> arabicDigits = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];

    String result = '';
    String numberStr = number.toString();

    for (int i = 0; i < numberStr.length; i++) {
      int digit = int.parse(numberStr[i]);
      result += arabicDigits[digit];
    }

    return result;
  }
}