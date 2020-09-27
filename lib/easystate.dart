library easystate;

import 'package:rxdart/rxdart.dart';

/// The easiest and simplest Flutter state manager library for beginners.
///
/// This is not a perfect state manager but will give Flutter learners great
/// oppotunity to learn what state management is.
class EasyState {
  /// The is the stream to observe whenever value changes.
  dynamic stream = BehaviorSubject<dynamic>();

  /// Initialize the stream.
  EasyState();

  /// Update the listeners.
  update() {
    stream.add(this);
  }
}
