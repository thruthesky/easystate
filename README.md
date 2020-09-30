# EasyState

* EasyState is the easiest and the simplest Flutter state managemnt package for beginners.

* This is not the perfect state manager, but will give you great understanding about what state management is.

* To make EasyState simple,
  * You can create your model,
  * And use it with `StreamBuilder` to render UI. (You may optioanlly use `EasyBuilder`.)
  * Whenever you need to re-render the UI, call `update()`.

## Installation

Add EasyState to your pubspec.yaml file:

``` yaml
dependencies:
  easystate:
```

## Examples


* Import `easystate.dart`.

``` dart
import 'package:easystate/easystate.dart';
```


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
  builder: (context, snapshot) => Text(snapshot.data.value.toString()),
),
floatingActionButton: FloatingActionButton(
  onPressed: () => countModel.increase(), // trigger UI update.
  tooltip: 'Increase',
  child: Icon(Icons.add),
),
```
That's it. This is how I recommend to use `EasyState`.

### Example of Traditional State Management Pattern

* A lot of state management packages have a common pattern on their usage. That is;
  * First, create a model
  * Second, register the model (and put it into container).
  * Third, render the model value with some custom widget like `Consumer` in `Provider` or `GetBuilder` in `GetX`.
  * Forth, get instance and do something(or update the UI). `Provider.of()` and `Get.find()` are one of those.

> Why? Because it is more easy with this pattern.

* `EasyState` has also provide the same pattern.
  * First, create a model.
  * Second, when the model is instantiated, the model is automactially registered into container. So, you need to simple create the model and instantiate it somewhere. No need to register explicitly.
  * Third, render the model value with `EasyBuilder` widget.
  * Forth, to get the instance of the model, do `EasyState.get<T>()`.



```dart
class CountModel extends EasyState { // your model
  int value = 0;
  increase() {
    value++;
    update();
  }
}

void main() {
  CountModel countModel = CountModel(); // instantiate your model
  runApp(MyApp());
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Column( childiren: [
         EasyBuilder<CountModel>( // use it with generic class type.
            builder: (context, snapshot) => Text(
              snapshot.data.value.toString(),
              ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              EasyState.get<CountModel>().increase(); // get instance and re-render
            }
          ),
       ])
```

### Listening the stream event

* You can listen the stream and do some logic without updating UI.

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

* See [Easystate Sample App](https://github.com/thruthesky/easystate_sample/tree/master/lib) for examples.



## Developers

* To develop easystate package, clond `https://github.com/thruthesky/easystate` in your project and test it.