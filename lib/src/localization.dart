import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

/// The function that allows to get the language path according to the specified locale.
typedef String GetPathFunction(Locale locale);

/// The ez localization class.
class EzLocalization {
  /// The current locale.
  final Locale locale;

  /// The get path function.
  final GetPathFunction getPathFunction;

  /// The localized strings.
  Map<String, String> _strings = HashMap();

  /// Creates a new ez localization instance.
  EzLocalization({
    this.locale = const Locale('en'),
    this.getPathFunction = _defaultGetPathFunction,
  });

  /// Returns the ez localization instance attached to the specified build config.
  static EzLocalization of(BuildContext context) => Localizations.of<EzLocalization>(context, EzLocalization);

  /// Loads the localized strings.
  Future<bool> load() async {
    try {
      String data = await rootBundle.loadString(getPathFunction(locale));
      Map<String, dynamic> strings = json.decode(data);
      strings.forEach((String key, dynamic data) => _addValues(key, data));
      return true;
    } catch (exception, stacktrace) {
      print(exception);
      print(stacktrace);
    }
    return false;
  }

  /// Returns the string associated to the specified key.
  String get(String key) => this._strings[key];

  /// The default get path function.
  static String _defaultGetPathFunction(Locale locale) => 'assets/languages/${locale.languageCode}.json';

  /// Adds the values to the current map.
  void _addValues(String key, dynamic data) {
    if(data is Map) {
      data.forEach((subKey, subData) => _addValues(key + '.' + subKey, subData));
      return;
    }

    if(data != null) {
      _strings[key] = data.toString();
    }
  }
}
