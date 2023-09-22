import 'package:flutter/material.dart';
import 'package:persistent_data_example/shared_data/shared_prefs.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  final CustomSharedPref _pref = CustomSharedPref();
 

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    _counter = await _pref.getInt(key: "entrycount") ?? 0;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          CustomSharedPref().setInt(_counter, "entrycount");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
