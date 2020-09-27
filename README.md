# EasyState

* EasyState is the easiest and the simplest Flutter state manager library for beginners.

* This is not the perfect state manager, but will give you great understanding about what state management is.

* To make EasyState simple,
  * It does not put the model instance into container unlike others do.
  * And so, it does not require a special widget builder specifiying generic type to rebiuld UI.
  * Hence, you don't need to learn those things and becomes deadly simple.
  * EasyState simply uses the fundamental `StreamBuilder` widget to rebuild UI.

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
  initialData: countModel.stream,
  builder: (context, snapshot) => Text(
    snapshot.data.value.toString(),
    style: Theme.of(context).textTheme.headline4,
  ),
),
```

* Experimental. You can use `EasyBuilder` which is merely a wrapper class of `StreamBuilder`. It is not recommended to use `EasyBuilder` though since it not standard widget and it takes extra work to learn.

```dart
EasyBuilder(
  builder: (context, snapshot) => Text(
    snapshot.data.value.toString(),
    style: Theme.of(context).textTheme.headline4,
  ),
  model: countModel,
),
```

* More example.

  * You can listen the stream and do some logic things without update UI.

``` dart
  StreamSubscription stream;

  @override
  void initState() {
    stream = countModel.stream.listen((value) => setState(() => null));
    super.initState();
  }

  @override
  void dispose() {
    stream.cancel();
    super.dispose();
  }
```


## Reference

* See [Easystate Sample App](https://github.com/thruthesky/easystate_sample) for example.



## Developers

* To develop easystate package, clond `https://github.com/thruthesky/easystate` in your project and test it.