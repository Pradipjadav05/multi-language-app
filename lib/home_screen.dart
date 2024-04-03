import 'package:flutter/material.dart';
import 'package:multi_language_app/model/string_caption.dart';

import 'localization/language_constat.dart';
import 'model/langauge_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.language,
          color: Colors.white,
        ),
        title: Text(StringCaption.of(context)!.appName),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(30),
        child: Center(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 80,
              ),
              Text(
                StringCaption.of(context)!.labelWelcome,
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                StringCaption.of(context)!.labelInfo,
                style: const TextStyle(fontSize: 20, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 70,
              ),
              _createLanguageDropDown()
            ],
          ),
        ),
      ),
    );
  }

  _createLanguageDropDown() {
    return DropdownButton<LanguageData>(
      iconSize: 30,
      hint: Text(StringCaption.of(context)!.labelSelectLanguage),
      onChanged: (LanguageData? language){
        changeLanguage(context, language!.languageCode);
      },
      items: LanguageData.languageList()
          .map<DropdownMenuItem<LanguageData>>(
            (e) => DropdownMenuItem<LanguageData>(
              value: e,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    e.flag,
                    style: const TextStyle(fontSize: 30),
                  ),
                  Text(e.name)
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
