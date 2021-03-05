import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';

/// A simple but useful widget that allows to load EzLocalization easier.
class EzLocalizationBuilder extends StatefulWidget {
  /// The delegate builder.
  final EzLocalizationDelegate delegate;

  /// The widget builder.
  final Widget Function(
          BuildContext context, EzLocalizationDelegate ezLocalizationDelegate)
      builder;

  /// Creates a new EzLocalization builder instance.
  const EzLocalizationBuilder({
    this.delegate = const EzLocalizationDelegate(),
    required this.builder,
  });

  @override
  State<StatefulWidget> createState() => EzLocalizationBuilderState();

  /// Allows to change the preferred locale (if using the builder).
  static EzLocalizationBuilderState? of(BuildContext context) =>
      context.findAncestorStateOfType<EzLocalizationBuilderState>();
}

/// The EzLocalization builder state.
class EzLocalizationBuilderState extends State<EzLocalizationBuilder> {
  /// The current EzLocalization delegate.
  late EzLocalizationDelegate _ezLocalizationDelegate;

  @override
  void initState() {
    super.initState();
    _ezLocalizationDelegate = widget.delegate;
  }

  @override
  Widget build(BuildContext context) =>
      widget.builder(context, _ezLocalizationDelegate);

  /// Allows to change the preferred locale.
  void changeLocale(Locale locale) {
    if (mounted) {
      setState(() {
        _ezLocalizationDelegate = EzLocalizationDelegate(
          supportedLocales: _ezLocalizationDelegate.supportedLocales,
          getPathFunction: _ezLocalizationDelegate.getPathFunction,
          notFoundString: _ezLocalizationDelegate.notFoundString,
          locale: locale,
        );
      });
    }
  }
}
