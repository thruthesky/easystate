import 'package:easystate/easystate.dart';
import 'package:flutter/material.dart';

class CountModel extends EasyState {
  int value = 0;
  increase() {
    value++;
    update();
  }
}

CountModel countModel = CountModel();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EasyState'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'EasyState Counter :',
            ),
            StreamBuilder(
              stream: countModel.stream,
              builder: (context, snapshot) => Text(
                snapshot.data != null ? snapshot.data.value.toString() : '0',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => countModel.increase(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
