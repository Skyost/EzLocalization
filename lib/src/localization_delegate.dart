import 'dart:async';

import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

/// The EzLocalization delegate class.
class EzLocalizationDelegate extends LocalizationsDelegate<EzLocalization> {
  /// Contains all supported locales.
  final Iterable<Locale> supportedLocales;

  /// Directory containing all JSON locales.
  final String path;

  /// The get path function.
  final GetPathFunction getPathFunction;

  /// Creates a new app localization delegate instance.
  const EzLocalizationDelegate({
    this.supportedLocales = const [Locale('en')],
    this.getPathFunction,
    this.path = defaultLanguagesPath,
  });

  @override
  bool isSupported(Locale locale) =>
      _isLocaleSupported(supportedLocales, locale) != null;

  @override
  Future<EzLocalization> load(Locale locale) async {
    final ezLocalization = EzLocalization(
      locale: locale,
      path: path,
      getPathFunction: getPathFunction,
    );

    await ezLocalization.load();

    return ezLocalization;
  }

  @override
  bool shouldReload(LocalizationsDelegate<EzLocalization> old) => false;

  /// The default locale resolution callback.
  Locale localeResolutionCallback(
    Locale locale,
    Iterable<Locale> supportedLocales,
  ) {
    if (locale == null) {
      return supportedLocales.first;
    }

    return _isLocaleSupported(supportedLocales, locale) ??
        supportedLocales.first;
  }

  /// The localization delegates to add in your application.
  List<LocalizationsDelegate<dynamic>> get localizationDelegates => [
        this,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ];

  /// Returns the locale if it's supported by this localization delegate, null otherwise.
  Locale _isLocaleSupported(List<Locale> supportedLocales, Locale locale) {
    for (final supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode ||
          supportedLocale.countryCode == locale.countryCode) {
        return supportedLocale;
      }
    }

    return null;
  }
}
