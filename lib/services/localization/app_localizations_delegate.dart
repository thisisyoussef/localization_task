// This code imports necessary packages and files for localization
import 'package:flutter/cupertino.dart';
import 'package:localization_task/data/supported_locales.dart';
import 'package:localization_task/services/localization/app_localizations.dart';

// This class is responsible for handling the localization delegate
class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  // This method checks if the provided locale is supported by the app it checks the language codes from the supported_locales.dart file in the data folder
  @override
  bool isSupported(Locale locale) {
    return supportedLocales
        .map((locale) => locale.languageCode)
        .contains(locale.languageCode);
  }

  // This method loads the necessary localizations for the app
  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load(locale);
    return localizations;
  }

  // This method determines whether the delegate should reload or not
  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
