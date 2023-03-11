import 'package:flutter/material.dart';

class LanguageManager {

  LanguageManager._init();
  static LanguageManager? _instance;
  static LanguageManager get instance {
    _instance ??= LanguageManager._init();
    return _instance!;
  }

  final enLocale = const Locale('en', 'US');
  final viLocale = const Locale('vi');

  List<Locale> get supportedLocales => [enLocale, viLocale];
}
