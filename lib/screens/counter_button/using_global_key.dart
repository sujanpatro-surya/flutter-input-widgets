import 'package:flutter/material.dart';

class UsingGlobalKey extends StatelessWidget {
  UsingGlobalKey({Key? key}) : super(key: key);
  final _counterKey = GlobalKey<_CounterWidgetState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Using Global Key'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Button is clicked: ', style: TextStyle(fontSize: 30)),
            CounterWidget(key: _counterKey)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _counterKey.currentState!._incrementCounter(),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({Key? key}) : super(key: key);

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Text(_counter.toString(), style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),);
  }

  void _incrementCounter() => setState(() => _counter++);
}
