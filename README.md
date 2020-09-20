# Easystate

EasyState is the easiest and the simplest Flutter state manager library for beginners.

This is not the perfect state manager, but will give you great understanding about what state management is.

## Installation

Add EasyState to your pubspec.yaml file:

``` yaml
dependencies:
  easystate:
```

then, import it

``` dart
import 'package:get/get.dart';
```

## Examples

* Define your model

```dart
class CountModel extends EasyState {
  int value = 0;
  increase() {
    value ++;
    update();
  }
}
CountModel countModel = CountModel();
```

* And consume it with `StreamBuidler`.

```dart
StreamBuilder(
  stream: countModel.stream,
  builder: (context, snapshot) => Text(
    snapshot.data != null ? snapshot.data.value.toString() : '0',
    style: Theme.of(context).textTheme.headline4,
  ),
),
```


## Reference

* See [Easystate Sample App](https://github.com/thruthesky/easystate_sample) for example.

