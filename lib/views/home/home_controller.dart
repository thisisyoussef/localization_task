import 'package:flutter/material.dart';
import 'package:localization_task/services/localization/app_localizations.dart';

class HomeController {
  final BuildContext context;
  final Function setLocale;

  HomeController({required this.context, required this.setLocale});

  // A method to translate a given key by delegating it to the AppLocalizations class
  String? translate(String key) {
    return AppLocalizations.of(context).translate(key);
  }

  // A method to change the language by delegating it to the setLocale function
  void changeLanguage(Locale locale) {
    setLocale(locale);
  }
}
