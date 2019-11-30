import 'dart:async';

import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

/// The EzLocalization delegate class.
class EzLocalizationDelegate extends LocalizationsDelegate<EzLocalization> {
  /// Contains all supported locales.
  final Iterable<Locale> supportedLocales;

  /// The get path function.
  final GetPathFunction getPathFunction;

  /// The string to return if the key is not found.
  final String notFoundString;

  /// Creates a new app localization delegate instance.
  const EzLocalizationDelegate({
    this.supportedLocales = const [Locale('en')],
    this.getPathFunction = EzLocalization.defaultGetPathFunction,
    this.notFoundString,
  });

  @override
  bool isSupported(Locale locale) => _isLocaleSupported(supportedLocales, locale) != null;

  @override
  Future<EzLocalization> load(Locale locale) async {
    EzLocalization ezLocalization = EzLocalization(
      locale: locale,
      getPathFunction: getPathFunction,
      notFoundString: notFoundString,
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

    return _isLocaleSupported(supportedLocales, locale) ?? supportedLocales.first;
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
    for (Locale supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode || supportedLocale.countryCode == locale.countryCode) {
        return supportedLocale;
      }
    }

    return null;
  }
}
