# Flutter Localization Demo

This is a Flutter project to demonstrate localization functionality. The project consists of a simple mobile application with a welcome screen displaying "Hello, User!" and a dropdown menu that lets you switch between English and Spanish languages.

## Code Explanation

### Main Entry Point (`main.dart`)

The application starts by running `LocalizationDemo()`. `LocalizationDemo` is a StatefulWidget that holds the current locale in its state. When the `setLocale` function is called, it updates the current locale state and triggers a rebuild of the widget tree, therefore applying the newly selected locale to the entire app.

### Home Screen (`home_view.dart`)

The `HomeView` is the app's main (and only) screen, it uses a `HomeController` to handle locale changes and translation calls. The HomeController is initialized with the `setLocale` function from LocalizationDemo and the current BuildContext.

The screen is a simple layout with a welcoming message and a dropdown menu for language selection. The message text is obtained by calling `_controller.translate('hello')`, this method fetches the correct translation from our localization setup.

The dropdown is a custom widget `LanguageDropdown` that uses the HomeController to switch between locales.

### Controller (`home_controller.dart`)

The `HomeController` is a simple class that exposes methods for translating keys and changing the language. It uses the `AppLocalizations` class to get the correct translation for a given key and delegates the language change process to the `setLocale` function from `LocalizationDemo`.

### Localization Delegate (`app_localizations_delegate.dart`)

`AppLocalizationsDelegate` is a custom localization delegate that loads and provides an instance of `AppLocalizations` which contains all our translated strings. The delegate checks if a locale is supported using the `isSupported` method and loads the localization data using the `load` method.

### Localization Class (`app_localizations.dart`)

`AppLocalizations` is a class that loads and stores translated strings. It loads a JSON file named after the current language code (e.g., 'en.json' or 'es.json') and maps it into `_localizedStrings`. It exposes the `translate` method that returns the correct translated string for a given key.

### Supported Locales (`supported_locales.dart`)

This is a simple list that contains all the locales that the app supports. For this task, it's just English (US) and Spanish (ES).

## How It Works

1. Run the application. It starts with the default language, English.
2. The welcome screen shows a message: "Hello, User!" and a dropdown menu with two language options: "English" and "Spanish".
3. Select a language from the dropdown menu.
4. The application language switches instantly. If Spanish is chosen, the welcome message changes to "¡Hola, usuario!".
5. Choose another language from the dropdown to switch back.

## Future Improvements

1. Add more languages: The localization setup allows easy addition of more languages.
2. Optimize loading of language files: Currently, the language JSON files are loaded each time a language is switched. Caching or preloading them could improve performance.

That's it! A simple localization demo in Flutter.
