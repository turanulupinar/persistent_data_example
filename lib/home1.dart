import 'package:flutter/material.dart';
import 'package:persistent_data_example/shared_data/shared_prefs.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _counter2x = 0;
  final CustomSharedPref _pref = CustomSharedPref();
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    _pref.setInt(_counter);
    _pref.setInt((_counter * 2), key: "counter2x");
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    _counter = await _pref.getInt(key: "counter") ?? 0;
    _counter2x = await _pref.getInt(key: "counter2x") ?? 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              '2x: $_counter2x',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
