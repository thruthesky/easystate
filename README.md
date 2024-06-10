# EasyState: A Simple and Intuitive State Management Package

EasyState is more than just a user-friendly state manager. It's a tool designed to simplify the learning process of Flutter's State Management system.




Many Flutter developers start their journey with Provider, often without a deep understanding of its internal mechanism. On my third day of using Flutter, I decided to create a simpler alternative for my own learning - and thus, EasyState was born.


For the past four years since EasyState's inception, I hesitated to recommend it for production apps, primarily because I wasn't using it in my own projects. However, times have changed. Recently, I've felt a strong need for a simpler state management tool. Now, I confidently use EasyState in my production apps and encourage others to experience its simplicity and effectiveness.



## Installation

Add EasyState to your pubspec.yaml file:

```yaml
dependencies:
  easystate:
```

## How to use


- To use `EasyState`,
  - Create your model,
  - Use it with `StreamBuilder` to render UI. (You may optioanlly use `EasyBuilder`.)
  - Call `update()` whenever you need to re-render the UI.



## Examples

- Import `easystate.dart`.

```dart
import 'package:easystate/easystate.dart';
```

- Define your model

```dart
class CountModel extends EasyState {
  int value = 0;
  increase() {
    value ++;
    update();
  }
}
class TestModel extends EasyState {
  int value = 100;
  decrease() {
    value--;
    update();
  }
}
```

- Create instance before using it. You can instantiate the model any where before use.

```dart
CountModel countModel;
void main() {
  countModel = CountModel();
  runApp(MyApp());
}
```

```dart
  @override
  Widget build(BuildContext context) {
    TestModel(); // You can instantiate before use.
     return Scaffold({...});
  }
```

- And use it with `StreamBuidler`.

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

## Common Pattern of State Management

- A lot of state management packages have a common pattern on their usage. Which is;
  - First, create a model
  - Second, register the model (and put it into container).
  - Third, render the model value with custom widget like `Consumer` in `Provider` or `GetBuilder` in `GetX`.
  - Forth, get instance and do something(or update the UI). `Provider.of()` and `Get.find()` are one of those.

> Why? Because it is more easy with the pattern.

- `EasyState` also provides the same pattern.
  - First, create a model.
  - Second, instantiate the model class before calling `runApp()` or before you use it.
  - Third, render the model value with `EasyBuilder` widget.
  - Forth, to get the instance of the model, do `EasyState.get<T>()`.

```dart
class CountModel extends EasyState { // your model
  int value = 0;
  increase() {
    value++;
    update();
  }
}

void main() {
  CountModel countModel = CountModel(); // instantiate your model.
  runApp(MyApp());
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column( childiren: [
          EasyBuilder<CountModel>( // use it with generic class type.
              builder: (context, CountModel model) => Text(
                model.value.toString(),
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

- You can listen the stream and do some logic without updating UI.

```dart
  StreamSubscription stream;

  @override
  void initState() {
    stream = countModel.stream.listen((value) { /* do something */ });
    super.initState();
  }

  @override
  void dispose() {
    stream.cancel();
    super.dispose();
  }
```

## Reference

- See [Easystate Sample App](https://github.com/thruthesky/easystate_sample/tree/master/lib) for examples.

## Developers

- To develop easystate package, clond `https://github.com/thruthesky/easystate` in your project and test it.
