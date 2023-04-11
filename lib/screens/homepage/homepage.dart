import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, 'usingTextField'),
                  child: const Text('TextField')
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, 'usingTextFormField'),
                child: const Text('TextFormField')
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, 'usingGlobalKey'),
                child: const Text('GlobalKey')
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, 'usingOtherFormWidgets'),
                child: const Text('OtherFormWidgets')
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, 'usingDateTimePicker'),
                child: const Text('DateTimePicker')
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, 'usingStepperWidget'),
                  child: const Text('StepperWidget')
              ),
            ),
          ],
        ),
      ),
    );
  }
}
