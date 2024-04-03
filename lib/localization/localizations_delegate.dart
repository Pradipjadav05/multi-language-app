/// this class call in Material property: localizationsDelegates
/// this class contains only override methods for check locale is supported and load() for loading our locale class


import 'package:flutter/material.dart';
import 'package:multi_language_app/model/en_language.dart';
import 'package:multi_language_app/model/gu_language.dart';
import 'package:multi_language_app/model/hi_language.dart';
import 'package:multi_language_app/model/string_caption.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<StringCaption>{

  const AppLocalizationsDelegate();


  @override
  bool isSupported(Locale locale) => ['en', 'gu', 'hi'].contains(locale.languageCode);

  @override
  Future<StringCaption> load(Locale locale) => _load(locale);

  static Future<StringCaption> _load(Locale locale) async {
    switch (locale.languageCode) {
      case 'en':
        return EnLanguage();
      case 'gu':
        return GuLanguage();
      case 'hi':
        return HiLanguage();
      default:
        return EnLanguage();
    }
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<StringCaption> old) => false;
  
}