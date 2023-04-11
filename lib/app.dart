import 'package:flutter/material.dart';
import 'package:input_widgets/screens/counter_button/using_global_key.dart';
import 'package:input_widgets/screens/dateTime/date_time_selector.dart';
import 'package:input_widgets/screens/homepage/homepage.dart';
import 'package:input_widgets/screens/other_form_widgets/other_form_widget.dart';
import 'package:input_widgets/screens/stepper_widget/stepper_widget.dart';
import 'package:input_widgets/screens/text_form_field/using_text_form_field_widget.dart';
import 'package:input_widgets/screens/textfield/textfield.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Input Widgets',
      theme: ThemeData(primarySwatch: Colors.purple),
      routes: {
        '/': (context) => const HomePage(),
        'usingTextField': (context) => UsingTextField(),
        'usingTextFormField': (context) => UsingTextFormField(),
        'usingGlobalKey': (context) => UsingGlobalKey(),
        'usingOtherFormWidgets': (context) => OtherFormWidgets(),
        'usingDateTimePicker': (context) => UsingDateTimePicker(),
        'usingStepperWidget': (context) => UsingStepperWidget()
      },
    );
  }
}
