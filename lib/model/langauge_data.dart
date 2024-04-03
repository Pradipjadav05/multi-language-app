class LanguageData {
  final String flag;
  final String name;
  final String languageCode;

  LanguageData(this.flag, this.name, this.languageCode);

  static List<LanguageData> languageList() {
    return <LanguageData>[
      LanguageData('\u{1F1FA}\u{1F1F8}', "English", 'en'),
      LanguageData('\u{1F1EE}\u{1F1F3}', "ગુજરાતી", 'gu'),
      LanguageData('\u{1F1EE}\u{1F1F3}', "हिंदी", 'hi'),
    ];
  }
}