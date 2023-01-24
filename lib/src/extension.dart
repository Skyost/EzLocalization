import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';

/// Contains some useful methods for build contexts.
extension EzLocalizationExtension on BuildContext {
  /// Returns the string associated to the specified key using EzLocalization.
  String getString(String key, [dynamic args]) => EzLocalization.of(this)!.get(key, args);
}
