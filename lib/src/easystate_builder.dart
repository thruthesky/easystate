import 'package:easystate/easystate.dart';
import 'package:flutter/material.dart';

class EasyStateBuilder<T> extends StatelessWidget {
  const EasyStateBuilder({super.key, required this.builder});

  final Widget Function(BuildContext context, T controller) builder;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: EasyState.of<T>(context) as ChangeNotifier,
      builder: (
        context,
        _,
      ) {
        return builder(context, EasyState.of<T>(context));
      },
    );
  }
}
