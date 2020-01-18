import 'package:flutter/material.dart';
import 'package:ppanda/dictionary/en.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;

import 'doctionary_keys.dart';

class AppDictionary {
  final Locale locale;

  static AppDictionary instance;

  AppDictionary(this.locale);

  static AppDictionary of(BuildContext context) {
    return Localizations.of<AppDictionary>(context, AppDictionary);
  }

  static void init(BuildContext context) {
    instance = AppDictionary.of(context);
  }

  static Map<String, Map<DictionaryKeys, String>> _localizedValues = {'en': EN};

  String get title {
    return _localizedValues[locale.languageCode][DictionaryKeys.title];
  }

  static String getByKey(DictionaryKeys key) {
    return _localizedValues[instance.locale.languageCode][key];
  }

  static const List<String> _rtlLanguages = <String>[
    'ar', // Arabic
    'fa', // Farsi
    'he', // Hebrew
    'ps', // Pashto
    'ur', // Urdu
  ];

  static bool isRTL(BuildContext context) {
    return _rtlLanguages.contains(Localizations.localeOf(context).languageCode);
  }
}

class AppDictionaryDelegate extends LocalizationsDelegate<AppDictionary> {
  const AppDictionaryDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en'].contains(locale.languageCode);
  }

  @override
  Future<AppDictionary> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of DemoLocalizations.
    return SynchronousFuture<AppDictionary>(AppDictionary(locale));
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppDictionary> old) {
    return false;
  }
}
