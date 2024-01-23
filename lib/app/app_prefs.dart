import 'package:flutter/material.dart';
import 'package:basic_code_for_any_project/presentation/resources/language_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';


const String langKey = 'lang_key';
const String prefsKeyIsUserLoggedIn = "PREFS_KEY_IS_USER_LOGGED_IN";
const String prefsKeyOnBoardingScreenViewed = "PREFS_KEY_ON_BOARDING_SCREEN_VIEWED";
const String prefsKeySaveToken = "PREFS_KEY_SAVE_TOKEN";



class AppPreferences {

  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  String getAppLanguage() {
    String? language = _sharedPreferences.getString(langKey);
    if(language!=null && language.isNotEmpty)
    {
      return language;
    }
    else
    {
      return LanguageType.ENGLISH.getValue();
    }
  }

  Future<void> changeAppLanguage() async {
    String currentLanguage = getAppLanguage();
    if(currentLanguage == LanguageType.ENGLISH.getValue()){
      _sharedPreferences.setString(langKey, LanguageType.ARABIC.getValue());
    }else{
      _sharedPreferences.setString(langKey, LanguageType.ENGLISH.getValue());
    }
  }

  Future<Locale> getLocale() async {
    String currentLanguage = getAppLanguage();
    if(currentLanguage == LanguageType.ENGLISH.getValue()){
      return ENGLISH_LOCALE;
    }else{
      return ARABIC_LOCALE;
    }
  }

   Future<void> setUserLoggedIn() async {
    await _sharedPreferences.setBool(prefsKeyIsUserLoggedIn, true);
  }

   bool isUserLoggedIn() {
    return _sharedPreferences.getBool(prefsKeyIsUserLoggedIn)??false;
  }

  Future<void> setOnBoardingScreenViewed() async {
    _sharedPreferences.setBool(prefsKeyOnBoardingScreenViewed, true);
  }

  bool isOnBoardingScreenViewed() {
    return _sharedPreferences.getBool(prefsKeyOnBoardingScreenViewed) ?? false;
  }

  Future<void> saveToken(String token) async {
    await _sharedPreferences.setString(prefsKeySaveToken, token);
  }

  String getToken() {
    return _sharedPreferences.getString(prefsKeySaveToken)??'';
  }

   Future<void> logout() async {
    await Future.wait([
      _sharedPreferences.remove(prefsKeyIsUserLoggedIn),
      _sharedPreferences.remove(prefsKeySaveToken),
    ]);
  }
}
