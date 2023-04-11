import 'package:flutter/material.dart';

class OtherFormWidgets extends StatefulWidget {
  const OtherFormWidgets({Key? key}) : super(key: key);

  @override
  State<OtherFormWidgets> createState() => _OtherFormWidgetsState();
}

class _OtherFormWidgetsState extends State<OtherFormWidgets> {
  bool _checkBoxTileState = false;
  bool _checkBoxState = false;
  bool _switchListTileState = false;
  double _sliderValue = 0;
  String? _dropDownValue;
  final List<String> _dropDownValues = ['Monday', 'Tuesday', 'Wednesday'];
  String _day = 'Monday';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Other Form Widgets'),
      ),
      body: ListView(
        children: [
          CheckboxListTile(
            title: const Text('CheckBoxTile'),
            subtitle: const Text('Subtitle'),
            activeColor: Colors.blue,
            controlAffinity: ListTileControlAffinity.leading,
            value: _checkBoxTileState,
            onChanged: (selected) {
              setState(() {
                _checkBoxTileState = selected!;
              });
            }
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Checkbox(
                  value: _checkBoxState,
                  onChanged: (state) {
                    setState(() {
                      _checkBoxState = state!;
                    });
                  }
                ),
              ),
              const Text('Single CheckBox')
            ],
          ),
          RadioListTile(
            title: const Text('Monday Title'),
            subtitle: const Text('Monday Subtitle'),
            value: 'Monday',
            groupValue: _day,
            onChanged: (day) {
              setState(() {
                _day = day!;
              });
            },
          ),
          RadioListTile(
            title: const Text('Tuesday Title'),
            subtitle: const Text('Tuesday Subtitle'),
            value: 'Tuesday',
            groupValue: _day,
            onChanged: (day) {
              setState(() {
                _day = day!;
              });
            },
          ),
          RadioListTile(
            title: const Text('Wednesday Title'),
            subtitle: const Text('Wednesday Subtitle'),
            value: 'Wednesday',
            groupValue: _day,
            onChanged: (day) {
              setState(() {
                _day = day!;
              });
            },
          ),
          SwitchListTile(
            title: const Text('SwitchListTile title'),
            subtitle: const Text('SwitchListTile subtitle'),
            value: _switchListTileState,
            onChanged: (state) {
              setState(() {
                _switchListTileState = state;
              });
            }
          ),
          Slider(
            value: _sliderValue,
            min: 0,
            max: 10,
            onChanged: (value) {
              setState(() {
                _sliderValue = value;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: DropdownButton(
              hint: const Text('Select day'),
              value: _dropDownValue,
              items: _dropDownValues.map(
                (day) => DropdownMenuItem(
                  value: day,
                  child: Text(day)
                )
              ).toList(),
              onChanged: (day) {
                setState(() {
                  _dropDownValue = day!;
                });
              }
            ),
          )
        ],
      ),
    );
  }
}
