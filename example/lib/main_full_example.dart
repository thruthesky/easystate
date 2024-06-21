import 'dart:async';

import 'package:easystate/easystate.dart';
import 'package:flutter/material.dart';

class MyState extends ChangeNotifier {
  int count = 0;
  String appName = 'EasyState Example';

  void increment() {
    count++;
    notifyListeners();
  }

  void updateAppName() {
    count++;
    appName = 'EasyState Example Updated: ${count}';
    notifyListeners();
  }
}

class NextState with ChangeNotifier {
  int count = 0;

  void increment() {
    count++;
    notifyListeners();
  }
}

class CherryCounterState with ChangeNotifier {
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
    // You may want to put EasyState on the root widget
    return EasyState(
      state: MyState(),
      // You can nest EasyState
      child: EasyState(
        state: NextState(),
        child: MaterialApp(
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const MyHomePage(),
        ),
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
    FocusScope.of(context).unfocus();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: EasyStateBuilder<MyState>(
          builder: (context, state) {
            return Text(state.appName);
          },
        ),
      ),
      body: Center(
        child: Column(
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
            SizedBox(height: 20),
            EasyStateBuilder<NextState>(builder: (context, state) {
              return Text(
                'Next Count: ${state.count}',
              );
            }),
            ElevatedButton(
              onPressed: () {
                EasyState.of<NextState>(context).increment();
              },
              child: Text("Increment Next Counter"),
            ),
            SizedBox(height: 20),
            EasyState(
              state: CherryCounterState(),
              child: CherryCounterWidget(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Scaffold(
                            appBar: AppBar(
                              title: Text('Update app name'),
                            ),
                            body: Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  EasyState.of<MyState>(context)
                                      .updateAppName();
                                  Navigator.of(context).pop();
                                },
                                child: Text('Update App Name'),
                              ),
                            )),
                      ),
                    ),
                child: Text('Next Screen')),
          ],
        ),
      ),
    );
  }
}

class CherryCounterWidget extends StatefulWidget {
  const CherryCounterWidget({
    super.key,
  });

  @override
  State<CherryCounterWidget> createState() => _CherryCounterWidgetState();
}

class _CherryCounterWidgetState extends State<CherryCounterWidget> {
  int count = 0;
  CherryCounterState get cherryState =>
      EasyState.of<CherryCounterState>(context);

  @override
  void didChangeDependencies() {
    print('---> didChangeDependencies');
    cherryState
      ..removeListener(worker)
      ..addListener(worker);
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant CherryCounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    print('---> didUpdateWidget');
  }

  @override
  void dispose() {
    cherryState.removeListener(worker);
    super.dispose();
  }

  worker() {
    count = cherryState.count;
    print('worker: $count');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print('---> build');
    return EasyStateBuilder<CherryCounterState>(
      builder: (context, state) => Column(
        children: [
          Text(
              'Cherry Count: ${state.count}, Cherry Count with Listener: $count'),
          Theme(
            data: Theme.of(context),
            child: ElevatedButton(
              onPressed: state.increment,
              child: Text('Increment Cherry Counter'),
            ),
          )
        ],
      ),
    );
  }
}
