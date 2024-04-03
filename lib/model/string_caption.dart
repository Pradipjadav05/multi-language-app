import 'package:flutter/cupertino.dart';

abstract class StringCaption {
  static StringCaption? of(BuildContext context) {
    return Localizations.of<StringCaption>(context, StringCaption);
  }

  String get appName;

  String get labelWelcome;

  String get labelInfo;

  String get labelSelectLanguage;
}
