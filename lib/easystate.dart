library easystate;

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

/// [_container] is the model container
List<dynamic> _container = [];

/// The easiest and simplest Flutter state manager library for beginners.
///
/// This is not a perfect state manager but will give Flutter learners great
/// oppotunity to learn what state management is.
class EasyState {
  /// The is the stream to observe whenever value changes.
  BehaviorSubject stream = BehaviorSubject();

  /// Initialize the stream.
  EasyState() {
    /// register the model into container
    int found = _container
        .indexWhere((element) => element.runtimeType == this.runtimeType);
    // print('found: $found');
    if (found == -1) {
      _container.add(this);
    }
  }

  /// Update the listeners.
  update() {
    stream.add(this);
  }

  static T get<T>() {
    return _container.where((element) => element is T).first;
  }
}

/// Builder widget to update UI when model updates.
///
/// This is an experimental feature and not recommended. Use `StreamBuilder`
/// instead.
/// [model] is the instance of the model.
/// [builder] is the widget builder method.
class EasyBuilder<T> extends StatelessWidget {
  EasyBuilder({
    this.model,
    this.builder,
    Key key,
  }) : super(key: key);

  final EasyState model;
  final Function builder;

  @override
  Widget build(BuildContext context) {
    EasyState m = model ?? EasyState.get<T>();
    return StreamBuilder(
      stream: m.stream,
      initialData: m,
      builder: (context, snapshot) => builder(context, snapshot.data),
    );
  }
}
