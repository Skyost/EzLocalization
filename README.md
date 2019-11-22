# EzLocalization

This little package allows you to setup a localization system with ease and in only a few minutes.

## Getting started

It only takes a few steps in order to get EzLocalization to work !
First, go where you define your `MaterialApp` (usually in `main.dart`) and add the following code :

```dart
EzLocalizationDelegate localizationDelegate = EzLocalizationDelegate(supportedLocales: [Locale('en'), Locale('fr')]); // The first language is your default language.
return MaterialApp(
  // title, theme, etc...
  localizationsDelegates: localizationDelegate.localizationDelegates,
  supportedLocales: localizationDelegate.supportedLocales,
  localeResolutionCallback: localizationDelegate.localeResolutionCallback,
);
```

Then you create a folder named `languages` in your `assets` directory with the defined languages in it.
An example structure could be :

```
assets
|
|------ languages
        |
        |--------- en.json
        |--------- fr.json
```

Here's an example of what `en.json` can contain :

```json
{
  "hello": "Hello !"
}
```

Then you translate it in `fr.json` :

```json
{
  "hello": "Bonjour !"
}
```

Oh and don't forget to add these assets in your `pubspec.yml` :

```yml
flutter:
  # uses-material-design, ...
  assets:
    - "assets/languages/"
```

**That's it !** To get your string you only have to call `EzLocalization.of(context).get('hello')`.

## Features

Here are some features :

* Easy, lightweight, open-source.
* MIT licensed.
* Classes can easily be overridden.

## Contributions

You have a lot of options to contribute to this project ! You can :

* [Fork it](https://github.com/Skyost/EzLocalization/fork) on Github.
* [Submit](https://github.com/Skyost/EzLocalization/issues/new/choose) a feature request or a bug report.
* [Donate](https://paypal.me/Skyost) to the developer.
* [Watch a little ad](https://utip.io/skyost) on uTip.