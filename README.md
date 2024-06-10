# EasyState: A Simple and Intuitive State Management Package

EasyState is more than just a user-friendly state manager. It's a tool designed to simplify the learning process of Flutter's State Management system.

Many Flutter developers start their journey with Provider, often without a deep understanding of its internal mechanism. On my third day of using Flutter, I decided to create a simpler alternative for my own learning - and thus, EasyState was born.

For the past four years since EasyState's inception, I hesitated to recommend it for production apps, primarily because I wasn't using it in my own projects. However, times have changed. Recently, I've felt a strong need for a simpler state management tool. Now, I confidently use EasyState in my production apps and encourage others to experience its simplicity and effectiveness.


## Tips of state management in Flutter


### Why do we need a state manager?

In Flutter, `setState()` is a function that updates the state and triggers a rebuild of the widget. However, it's limited to updating widgets within the same stateful widget. What if you need to update the state on a different screen? Unfortunately, `setState()` won't work in this scenario.

The solution is to have a global state that can be accessed from anywhere in your app. This state can then be updated, triggering a rebuild of any widgets that depend on it. While there are various ways to implement this, such as using socket events or real-time database events, state management is a particularly effective solution.

State management tools provide a structured way to manage global state, making it easier to update and respond to changes in state across multiple screens.



## Installation

Add EasyState to your pubspec.yaml file:

```yaml
dependencies:
  easystate: latest-version
```



## How to use

- Below is the simplest use case of `EasyState`.


```dart
import 'package:flutter/material.dart';
import 'package:easystate/easystate.dart';

// Define your state class extending(or mixing with) the ChangeNotifier
class MyState extends ChangeNotifier {
  int count = 0;
  void increment() {
    count++;
    // Notify listeners to rebuild the widgets.
    notifyListeners();
  }
}

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Provide your state model
    return EasyState(
      state: MyState(),
      child: MaterialApp(
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('EasyState Example'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Build your widget
          EasyStateBuilder<MyState>(builder: (context, state) {
            return Text(
              'My Count: ${state.count}',
            );
          }),
          ElevatedButton(
            onPressed: () {
              EasyState.of<MyState>(context).increment();
            },
            child: Text("Increment My Counter"),
          ),
        ],
      ),
    );
  }
}
```



## Examples

- See src/main_full_example.dart to see the full example.


## Common Pattern of State Management

1. Define your state model

2. Provide it to the app

3. Inject the builder

4. Update & notify the listeners.



## Reference

- See [Easystate Sample App](https://github.com/thruthesky/easystate_sample/tree/master/lib) for examples.

## Developers

- To develop easystate package, clond `https://github.com/thruthesky/easystate` in your project and test it.
