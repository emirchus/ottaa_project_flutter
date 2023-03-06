import 'package:flutter/material.dart';
import 'package:test/test.dart';

import 'package:ottaa_project_flutter/application/common/i18n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  I18N language = await I18N(const Locale('en', 'US')).init();

  setUp(() async {
    WidgetsFlutterBinding.ensureInitialized();
  });

  group('I18N Coverage', () {
    test('set Language', () async {
      language.changeLanguage('es_AR');

      expect(language.locale.languageCode, 'es');
    });
    test('set Language by Locale', () {
      language.changeLanguageFromLocale(const Locale('en', 'US'));
      expect(language.locale.languageCode, 'en');
    });
    test('null testing', () async {
      var result = await language.loadTranslation(const Locale('es', 'PT'));
      expect(result, null);
    });
    test('It should load the translations of en_US.json', () async {
      WidgetsFlutterBinding.ensureInitialized();

      final translation = await language.loadTranslation(const Locale('en', 'US'));

      expect(translation?.locale, const Locale('en', 'US'));
    });
    test('translation to english', () {
      language.changeLanguage('en_US');
      expect(language.currentLanguage?.translate("global.hello"), 'Hello');
    });
  });
}