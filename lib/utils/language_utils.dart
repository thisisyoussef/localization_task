String getLanguageName(String languageCode) {
  switch (languageCode) {
    case 'en':
      return 'English';
    case 'es':
      return 'Spanish';
    // Add more cases for other language codes if needed
    default:
      return '';
  }
}
