import 'dart:async';

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
            EasyBuilder(
              builder: (context, snapshot) => Text(
                snapshot.data.value.toString(),
              ),
              model: countModel,
            ),
            StreamBuilder(
              stream: countModel.stream,
              initialData: countModel.stream,
              builder: (context, snapshot) => Text(
                snapshot.data.value.toString(),
              ),
            ),
            RaisedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return NewScreen();
                  },
                ),
              ),
              child: Text('New Screen'),
            )
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

class NewScreen extends StatefulWidget {
  const NewScreen({
    Key key,
  }) : super(key: key);

  @override
  _NewScreenState createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Suggestions'),
      ),
      body: Column(
        children: [
          Text(countModel.value.toString()),
          RaisedButton(
            onPressed: () => setState(() => countModel.increase()),
            child: Text('Increase with setState()'),
          ),
          Divider(),
          Text(countModel.value.toString()),
          RaisedButton(
            onPressed: () => setState(() => countModel.increase()),
            child: Text('Increase with stream listing & setState()'),
          ),
          RaisedButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Back'),
          ),
        ],
      ),
    );
  }
}
