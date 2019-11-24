import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

/// Callback allowing to get the language path according to the specified locale.
typedef String GetPathFunction(Locale locale);

const defaultLanguagesPath = 'assets/languages';

/// The EzLocalization class.
class EzLocalization {
  /// The current locale.
  final Locale locale;

  /// Directory containing all JSON locales.
  final String path;

  /// The get path function.
  final GetPathFunction getPathFunction;

  /// The localized strings.
  Map<String, String> _strings = HashMap();

  /// Creates a new ez localization instance.
  EzLocalization({
    this.locale = const Locale('en'),
    this.getPathFunction,
    this.path = defaultLanguagesPath,
  });

  /// Returns the EzLocalization instance attached to the specified build config.
  static EzLocalization of(BuildContext context) =>
      Localizations.of<EzLocalization>(context, EzLocalization);

  /// Loads the localized strings.
  Future<bool> load() async {
    try {
      final data = await rootBundle.loadString(_getPath(locale));
      final Map<String, dynamic> strings = json.decode(data);
      strings.forEach((String key, dynamic data) => _addValues(key, data));
      return true;
    } catch (exception, stacktrace) {
      print(exception);
      print(stacktrace);
    }
    return false;
  }

  /// Returns the string associated to the specified key.
  String get(String key, [List<String> args]) {
    var value = this._strings[key];
    if (value == null) {
      return null;
    }

    if (args != null) {
      args.forEach((arg) {
        value = value.replaceFirst(RegExp(r'{}'), arg);
      });
    }

    return value;
  }

  /// The default get path function.
  String _getPath(Locale locale) => getPathFunction != null
      ? getPathFunction(locale)
      : '$path/${locale.languageCode}.json';

  /// Adds the values to the current map.
  void _addValues(String key, dynamic data) {
    if (data is Map) {
      data.forEach(
          (subKey, subData) => _addValues(key + '.' + subKey, subData));
      return;
    }

    if (data != null) {
      _strings[key] = data.toString();
    }
  }
}
