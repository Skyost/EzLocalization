import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';

/// A simple but useful widget that allows to load EzLocalization easier.
class EzLocalizationBuilder extends StatefulWidget {
  /// The delegate builder.
  final EzLocalizationDelegate Function() delegateBuilder;

  /// The widget builder.
  final Widget Function(BuildContext context, EzLocalizationDelegate ezLocalizationDelegate) builder;

  /// Creates a new EzLocalization builder instance.
  const EzLocalizationBuilder({
    this.delegateBuilder,
    @required this.builder,
  });

  @override
  State<StatefulWidget> createState() => _EzLocalizationBuilderState();
}

/// The EzLocalization builder state.
class _EzLocalizationBuilderState extends State<EzLocalizationBuilder> {
  /// The current EzLocalization delegate.
  EzLocalizationDelegate ezLocalizationDelegate;

  @override
  void initState() {
    super.initState();
    ezLocalizationDelegate = widget.delegateBuilder == null ? EzLocalizationDelegate() : widget.delegateBuilder();
  }

  @override
  Widget build(BuildContext context) => widget.builder(context, ezLocalizationDelegate);
}
