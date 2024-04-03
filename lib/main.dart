import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:multi_language_app/home_screen.dart';

import 'localization/language_constat.dart';
import 'localization/localizations_delegate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static void setLocale(BuildContext context, Locale newLocale) {
    var state = context.findAncestorStateOfType<_MyAppState>();
    state!.setLocale(newLocale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? locale;

  void setLocale(Locale newLocale) {
    setState(() {
      locale = newLocale;
    });
  }

  @override
  void initState() {
    super.initState();
    getLocal();
  }

  getLocal() async {
    locale = await getLocale();
    setState(() {});
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      locale: locale,
      supportedLocales: const [
        Locale('en', ''),
        Locale('gu', ''),
        Locale('hi', ''),
      ],
      localizationsDelegates: const [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale!.languageCode &&
              supportedLocale.countryCode == locale!.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales!.first;
      },
      home: const HomeScreen(),
    );
  }
}
