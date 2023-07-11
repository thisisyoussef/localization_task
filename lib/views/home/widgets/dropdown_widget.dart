import 'package:flutter/cupertino.dart';
import 'package:localization_task/data/supported_locales.dart';
import 'package:localization_task/utils/language_utils.dart';
import 'package:localization_task/views/home/home_controller.dart';

class LanguageDropdown extends StatefulWidget {
  final HomeController controller;

  const LanguageDropdown({Key? key, required this.controller});

  @override
  _LanguageDropdownState createState() => _LanguageDropdownState();
}

class _LanguageDropdownState extends State<LanguageDropdown> {
  late Locale _selectedLanguage;

  @override
  void initState() {
    super.initState();
    // Do not include code that relies on Localizations in initState() because the widget tree hasn't been built yet and Localizations.of(context) will return null.
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //Do include code that relies on Localizations in didChangeDependencies() because this is called after initState() and whenever the dependencies change thereafter.
    _selectedLanguage = Localizations.localeOf(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),

      // Creating a CupertinoButton widget
      child: CupertinoButton(
        child: Text(
            _selectedLanguage.languageCode == 'en' ? 'English' : 'Spanish'),
        onPressed: () {
          // Showing a modal popup sheet on top of the current context
          showCupertinoModalPopup(
            context: context,
            builder: (BuildContext context) => CupertinoActionSheet(
              title: const Text('Select Language'),
              // Creating a list of language options
              actions: supportedLocales.map((locale) {
                return CupertinoActionSheetAction(
                  // Setting child of action as the language name
                  child: Text(getLanguageName(locale.languageCode)),
                  // Triggered when an action is pressed
                  onPressed: () {
                    // Updating the selected language
                    setState(() {
                      _selectedLanguage = locale;
                      widget.controller.changeLanguage(locale);
                    });
                    Navigator.pop(context);
                  },
                );
              }).toList(),
              cancelButton: CupertinoActionSheetAction(
                isDefaultAction: true,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
            ),
          );
        },
      ),
    );
  }
}
