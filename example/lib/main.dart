import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';

/// First plugin test method.
void main() => runApp(_EzLocalizationDemoApp());

/// The demo material app.
class _EzLocalizationDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => EzLocalizationBuilder(
    delegate: EzLocalizationDelegate(
      supportedLocales: [
        Locale('en'),
        Locale('fr'),
        Locale('es'),
      ],
    ),
    builder: (context, localizationDelegate) => MaterialApp(
      title: 'EzLocalization Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('EzLocalization Demo'),
        ),
        body: _EzLocalizationDemoWidget(),
      ),
      localizationsDelegates: localizationDelegate.localizationDelegates,
      supportedLocales: localizationDelegate.supportedLocales,
      localeResolutionCallback: localizationDelegate.localeResolutionCallback,
    ),
  );
}

/// The main demo widget.
class _EzLocalizationDemoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(context.getString('format', {'name': 'Bond'}));
    print('If your language is set to French or Spanish, here\'s the word "Hello !" in your language :');
    print(context.getString('hello'));
    print('(Otherwise it should display a simple "Hello !".)');
    print('Oh, and here\'s an apple : ' + context.getString('fruits.apple')! + '.');

    Locale nextLocale = _getNextLocale(context)!;
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: context.getString('format', {'name': 'Bond'})! + '\n\n',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                TextSpan(text: 'If your language is set to French or Spanish, here\'s the word "Hello !" in your language :\n'),
                TextSpan(
                  text: context.getString('hello'),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextSpan(text: '\n(Otherwise it should display a simple "Hello !".)\n\n'),
                TextSpan(text: 'Oh, and here\'s an apple : ' + context.getString('fruits.apple')! + '.'),
              ],
              style: TextStyle(fontSize: 18, color: Colors.black87),
            ),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ElevatedButton(
              child: Text('Switch to "${nextLocale.languageCode}"'),
              onPressed: () => EzLocalizationBuilder.of(context)!.changeLocale(nextLocale),
            ),
          ),
        ],
      ),
    );
  }

  /// Returns the next locale to switch on.
  Locale? _getNextLocale(BuildContext context) {
    String lang = EzLocalization.of(context)!.locale.languageCode;
    switch (lang) {
      case 'en':
        return Locale('fr');
      case 'fr':
        return Locale('es');
      case 'es':
        return Locale('en');
    }
    return null;
  }
}
