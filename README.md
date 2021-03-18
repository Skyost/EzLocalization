# EzLocalization

This package allows you to setup a powerful localization system with ease and in only a few minutes.

## Features

Here are some features:

* Easy, lightweight, open-source.
* MIT licensed.
* Easily extensible.

## Getting started

It only takes a few steps in order to get EzLocalization to work !  
First, add the following code to your `MaterialApp` definition (usually in `main.dart`) :

```dart
EzLocalizationDelegate ezLocalization = EzLocalizationDelegate(supportedLocales: [Locale('en'), Locale('fr')]); // The first language is your default language.

return MaterialApp(
  // ...
  localizationsDelegates: ezLocalization.localizationDelegates,
  supportedLocales: ezLocalization.supportedLocales,
  localeResolutionCallback: ezLocalization.localeResolutionCallback,
);
```

Then you create a folder named `languages` in your `assets` directory with the defined languages in it.
An example structure could be :

```
assets
└── languages
    ├── en.json
    └── fr.json
```

Here's an example of `en.json` :

```json
{
  "hello": "Hello !"
}
```

And a translated `fr.json` :

```json
{
  "hello": "Bonjour !"
}
```

Don't forget to add the assets in your `pubspec.yml` :

```yml
flutter:
  # ...
  assets:
    - "assets/languages/"
```

**That's it !** To get your string you only have to call `EzLocalization.of(context)!.get('hello')`.

## Advanced

### Extension method

With the extension method, it's even easier to get a localized string !
The only thing you have to do is to replace `EzLocalization.of(context)!.get('key')` by `context.getString('key')`.

_You may have to manually import EzLocalization in your file._

### Builder widget

EzLocalization provides a builder widget called `EzLocalizationBuilder`. You can use it as such :

```dart
EzLocalizationBuilder(
  delegate: EzLocalizationDelegate(
    supportedLocales: [
      Locale('en'),
      Locale('fr'),
      Locale('es'),
    ],
  ),
  builder: (context, localizationDelegate) => MaterialApp(
    title: 'Beautifully localized app',
    home: MyMainWidget(),
    localizationsDelegates: localizationDelegate.localizationDelegates,
    supportedLocales: localizationDelegate.supportedLocales,
    localeResolutionCallback: localizationDelegate.localeResolutionCallback,
  ),
);
```

It has two advantages :
* It helps reducing boilerplate.
* You can dynamically change the current locale using `EzLocalizationBuilder.of(context)!.changeLocale(yourLocale)`.

### Nested strings

You can nest translation strings as such :

```json
{
  "tabs": {
    "home": "Home"
  }
}
```

And it can be access using `EzLocalization.of(context)!.get('tabs.home')`.

### Format arguments

In your translation string, you may add arguments using `{}` :

```json
{
  "greeting": "Hello {target}, my name is {me} !"
}
```

You can then fill them with `EzLocalization.of(context)!.get('greeting', {'target': 'John', 'me': 'Bob'})`.
Also, instead of a map you can pass a list and get your arguments by their indexes.

### Change the files path

You can change from the default path of `assets/languages/$languageCode.json` by passing `getPathFunction`
to `EzLocalizationDelegate`. You will then have to provide a valid asset path according to the specified locale.

Don't forget to update your `assets` entry in your pubspec !

### Updating the iOS app bundle

See [the official flutter.dev documentation](https://flutter.dev/docs/development/accessibility-and-localization/internationalization#appendix-updating-the-ios-app-bundle)
about updating the iOS app bundle.

## Contributing

You have a lot of options to contribute to this project ! You can :

* [Fork it](https://github.com/Skyost/EzLocalization/fork) on Github.
* [Submit](https://github.com/Skyost/EzLocalization/issues/new/choose) a feature request or a bug report.
* [Donate](https://paypal.me/Skyost) to the developer.
* [Watch a little ad](https://www.clipeee.com/creator/skyost) on Clipeee.
