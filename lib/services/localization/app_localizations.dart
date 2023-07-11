import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  final Locale locale;

  // Constructor to initialize with current locale
  AppLocalizations(this.locale);

  // Get the instance of AppLocalizations from the current context
  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  // A map to hold localized string key-value pairs
  late Map<String, String> _localizedStrings;

  // Load the JSON file for the current locale
  Future<bool> load(Locale locale) async {
    String jsonString =
        await rootBundle.loadString('assets/lang/${locale.languageCode}.json');

    // Decode the JSON string into a JSON map
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    // Convert the dynamic values of the JSON map to string
    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return true;
  }

  String? translate(String key) {
    // Get the localized string value for the given key
    return _localizedStrings[key];
  }
}
