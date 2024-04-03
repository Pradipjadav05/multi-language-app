/// this file contains constant properties.
/// this file is used to store and get locale in shared preference


import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

const String prefSelectedLanguageCode = "SelectedLanguageCode";

// set locale in pref
Future<Locale> setLocale(String languageCode) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(prefSelectedLanguageCode, languageCode);
  return _locale(languageCode);
}


// get locale from pref
Future<Locale> getLocale() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String languageCode = prefs.getString(prefSelectedLanguageCode) ?? "en";
  return _locale(languageCode);
}

// validate locale code
Locale _locale(String languageCode) {
  return languageCode != null && languageCode.isNotEmpty
      ? Locale(languageCode, '')
      : const Locale('en', '');
}

// call from dropdown for change locale
void changeLanguage(BuildContext context, String selectedLanguageCode) async {
  var locale = await setLocale(selectedLanguageCode);
  MyApp.setLocale(context, locale);
}