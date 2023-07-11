import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization_task/data/supported_locales.dart';
import 'package:localization_task/services/localization/app_localizations_delegate.dart';
import 'package:localization_task/views/home/home_view.dart';

void main() {
  runApp(const LocalizationDemo());
}

class LocalizationDemo extends StatefulWidget {
  const LocalizationDemo({Key? key}) : super(key: key);

  @override
  State<LocalizationDemo> createState() => _LocalizationDemoState();
}

class _LocalizationDemoState extends State<LocalizationDemo> {
  Locale _locale = supportedLocales.first;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      locale: _locale,
      supportedLocales: supportedLocales,
      localizationsDelegates: const [
        AppLocalizationsDelegate(),
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Localization Demo'),
        ),
        child: HomeView(
          setLocale: setLocale,
        ),
      ),
    );
  }
}
