## [1.1.0] - 2023-01-24

* `EzLocalization.DEFAULT_NOT_FOUND_STRING` renamed to `EzLocalization.defaultNotFoundString`.
* `EzLocalizationBuilderState.changeLocale` now accepts a `null` parameter.
* Various fixes and improvements.

## [1.0.0+2] - 2021-03-18

* You can get the default `notFoundString` by calling `EzLocalization.DEFAULT_NOT_FOUND_STRING`.

## [1.0.0+1] - 2021-03-18

* `notFoundString` is now non null. This means that `getString` methods always return a `String` (and not a `String?` anymore).

## [1.0.0] - 2021-03-05

* Migrated to null safety.

## [0.3.0+1] - 2020-08-05

* Updated README and ran `dartfmt` on the _lib_ folder.

## [0.3.0] - 2020-05-17

* Added the ability to change the current locale.
* Various fixes and improvements.

## [0.2.2] - 2020-04-21

* Added an extension that allows to easily get a localized string.
* Updated Dart version.

## [0.2.1+1] - 2020-03-06

* Updated README.
* Updated dependencies.
* Added an `EzLocalizationBuilder` widget.

## [0.2.1] - 2020-02-04

* Added the ability to return a string if the given translation is not found.
* Updated README (added a link to Updating the iOS app bundle on flutter.dev).

## [0.2.0] - 2019-11-30

* Added arguments.
* Some fixes.

## [0.1.1] - 2019-11-22

* Some last minute fixes.

## [0.1.0] - 2019-11-22

* First public release.
