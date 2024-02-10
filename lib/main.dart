import 'package:basic_code_for_any_project/app/di.dart';
import 'package:basic_code_for_any_project/data/network/dio_helper.dart';
import 'package:basic_code_for_any_project/presentation/resources/language_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:basic_code_for_any_project/app/app.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    EasyLocalization.ensureInitialized(),
    DioHelper.init(),
    initAppModule(),
  ]);
  runApp(EasyLocalization(
      supportedLocales: const [ENGLISH_LOCALE, ARABIC_LOCALE],
      path: ASSET_PASS_LANGUAGE,
      child: Phoenix(child: MyApp())));
}