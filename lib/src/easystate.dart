import 'package:flutter/material.dart';

class EasyState<T> extends InheritedWidget {
  final T state;

  const EasyState({
    super.key,
    required this.state,
    required super.child,
  });

  static EasyState<T>? maybeOf<T>(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<EasyState<T>>();
  }

  static T of<T>(BuildContext context) {
    final EasyState<T>? result = maybeOf<T>(context);
    if (result == null) {
      throw Exception('Could not find EasyState<$T> in the widget tree');
    }
    return result.state;
  }

  @override
  bool updateShouldNotify(EasyState oldWidget) {
    return state != oldWidget.state;
  }
}
