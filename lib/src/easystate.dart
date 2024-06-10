import 'package:flutter/material.dart';

class EasyState<T> extends InheritedWidget {
  final T state;

  const EasyState({
    super.key,
    required this.state,
    required super.child,
  });

  @override
  bool updateShouldNotify(EasyState oldWidget) {
    return state != oldWidget.state;
  }

  static T of<T>(BuildContext context) {
    final EasyState<T>? result =
        context.dependOnInheritedWidgetOfExactType<EasyState<T>>();
    if (result == null) {
      throw Exception('Could not find EasyState<$T> in the widget tree');
    }
    return result.state;
  }
}
