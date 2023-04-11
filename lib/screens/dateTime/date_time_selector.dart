import 'package:flutter/material.dart';

class UsingDateTimePicker extends StatelessWidget {
  UsingDateTimePicker({Key? key}) : super(key: key);
  final DateTime _currentDateTime = DateTime.now();
  final TimeOfDay _currentTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Date And Time Picker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: _currentDateTime,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2030)
                ).then((selectedDate) {
                  debugPrint(selectedDate!.toString());
                  debugPrint('${selectedDate.year}/${selectedDate.month}/${selectedDate.day}');
                });
              },
              child: const Text('Date Selection')
            ),
            ElevatedButton(
                onPressed: () {
                  showTimePicker(
                      context: context,
                      initialTime: _currentTime,
                  ).then((selectedTime) {
                    debugPrint(selectedTime!.toString());
                    debugPrint('${selectedTime.hour}:${selectedTime.minute}');
                  });
                },
                child: const Text('Time Selection')
            ),
          ],
        ),
      ),
    );
  }
}
