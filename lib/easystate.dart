library easystate;

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

/// The easiest and simplest Flutter state manager library for beginners.
///
/// This is not a perfect state manager but will give Flutter learners great
/// oppotunity to learn what state management is.
class EasyState {
  /// The is the stream to observe whenever value changes.
  BehaviorSubject stream;

  /// Initialize the stream.
  EasyState();

  /// Update the listeners.
  update() {
    stream.add(this);
  }
}

/// Builder widget to update UI when model updates.
///
/// This is an experimental feature and not recommended. Use `StreamBuilder`
/// instead.
/// [model] is the instance of the model.
/// [builder] is the widget builder method.
class EasyBuilder extends StatelessWidget {
  EasyBuilder({
    this.model,
    this.builder,
    Key key,
  }) : super(key: key);

  final EasyState model;
  final Function builder;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: model.stream,
      initialData: model.stream,
      builder: builder,
    );
  }
}
