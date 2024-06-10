import 'package:flutter/material.dart';
import 'package:easystate/easystate.dart';

class MyState extends ChangeNotifier {
  int count = 0;
  void increment() {
    count++;
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
