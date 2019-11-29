import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';

/// First plugin test method.
void main() => runApp(_EzLocalizationDemoApp());

/// The demo material app.
class _EzLocalizationDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    EzLocalizationDelegate localizationDelegate = EzLocalizationDelegate(
      supportedLocales: [
        Locale('en'),
        Locale('fr'),
        Locale('es'),
      ],
    );
    return MaterialApp(
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
    );
  }
}

/// The main demo widget.
class _EzLocalizationDemoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(EzLocalization.of(context).get('format', {'name': 'Bond'}));
    print('If your language is set to French or Spanish, here\'s the word "Hello !" in your language :');
    print(EzLocalization.of(context).get('hello'));
    print('(Otherwise it should display a simple "Hello !".)');
    print('Oh, and here\'s an apple : ' + EzLocalization.of(context).get('fruits.apple') + '.');

    return Padding(
      padding: EdgeInsets.all(8),
      child: Center(
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: EzLocalization.of(context).get('format', {'name': 'Bond'}) + '\n\n',
                style: Theme.of(context).textTheme.body1.copyWith(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              TextSpan(text: 'If your language is set to French or Spanish, here\'s the word "Hello !" in your language :\n'),
              TextSpan(
                text: EzLocalization.of(context).get('hello'),
                style: Theme.of(context).textTheme.body1.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextSpan(text: '\n(Otherwise it should display a simple "Hello !".)\n\n'),
              TextSpan(text: 'Oh, and here\'s an apple : ' + EzLocalization.of(context).get('fruits.apple') + '.'),
            ],
            style: Theme.of(context).textTheme.body1.copyWith(fontSize: 18),
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
