library easystate;
import 'package:rxdart/rxdart.dart';



 class EasyState {

  dynamic stream;
  EasyState() {
    stream = BehaviorSubject.seeded(this);
  }

  BehaviorSubject<T> observe<T>(T v) {
    return BehaviorSubject<T>.seeded(v);
  }

  update() {
    stream.add(this);
  }

 }
