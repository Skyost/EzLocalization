# EzLocalization

This package allows you to setup a localization system with ease and in only a few minutes.

## Getting started

It only takes a few steps in order to get EzLocalization to work!

First, add the following code to your `MaterialApp` definition (usually in `main.dart`):

```dart
EzLocalizationDelegate ezLocalization = EzLocalizationDelegate(supportedLocales: [Locale('en'), Locale('fr')]); // The first language is your default language.

return MaterialApp(
  // ...
  localizationsDelegates: ezLocalization.localizationDelegates,
  supportedLocales: ezLocalization.supportedLocales,
  localeResolutionCallback: ezLocalization.localeResolutionCallback,
);
```

> The definition of `ezLocalization` is best done outside of the `build` method.

Then you create a folder named `languages` in your `assets` directory with the defined languages in it.
An example structure could be:

```
assets
└── languages
    ├── en.json
    └── fr.json
```

> You can change from the default path of `assets/languages/$languageCode.json` by passing `getPathFunction` to `EzLocalizationDelegate`.

Here's an example of `en.json` :

```json
{
  "hello": "Hello!"
}
```

And a translated `fr.json` :

```json
{
  "hello": "Bonjour!"
}
```

Don't forget to add the assets in your `pubspec.yml`:

```yml
flutter:
  # ...
  assets:
    - "assets/languages/"
```

**That's it!** To get your string you only have to call `EzLocalization.of(context).get('hello')`.

## Nested strings

You can nest translation strings as such :

```json
{
  "tabs": {
    "home": "Home"
  }
}
```

And it can be access using `EzLocalization.of(context).get('tabs.home')`.

## Arguments

In your translation string, you may add arguments using `{}` :

```json
{
  "greeting": "Hello {target}, my name is {me} !"
}
```

You can then fill them with `EzLocalization.of(context).get('greeting', {target: 'John', me: 'Bob'})`.

> Instead of a map you can pass a list and get your arguments by their indexes !

## Features

Here are some features:

* Easy, lightweight, open-source.
* MIT licensed.
* Easily extensible.

## Contributing

You have a lot of options to contribute to this project ! You can :

* [Fork it](https://github.com/Skyost/EzLocalization/fork) on Github.
* [Submit](https://github.com/Skyost/EzLocalization/issues/new/choose) a feature request or a bug report.
* [Donate](https://paypal.me/Skyost) to the developer.
* [Watch a little ad](https://utip.io/skyost) on uTip.
