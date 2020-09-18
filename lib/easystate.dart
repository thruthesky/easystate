library easystate;
import 'package:rxdart/rxdart.dart';

class EasyState {


  BehaviorSubject<T> init<T>(T v) {
    return BehaviorSubject<T>.seeded(v);
  }

}


