import 'package:flutter/material.dart';

class UsingTextField extends StatefulWidget {
  const UsingTextField({Key? key}) : super(key: key);

  @override
  State<UsingTextField> createState() => _UsingTextFieldState();
}

class _UsingTextFieldState extends State<UsingTextField> {
  late final TextEditingController _nameController;
  late final FocusNode _focusNode;
  int _maxLineCount = 1;

  @override
  void initState() {
    _nameController = TextEditingController();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _maxLineCount = 5;
      } else {
        _maxLineCount = 1;
      }
      setState(() { });
    });
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TextField'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _nameController,
              focusNode: _focusNode,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              autofocus: true,
              maxLines: _maxLineCount,
              maxLength: 20,
              onChanged: (String value) {
                setState(() {});
                // _nameController.value = TextEditingValue(
                //   text: value,
                //   selection: TextSelection.collapsed(offset: 5)
                // );
              },
              onSubmitted: (String value) {
                debugPrint('submitted value is $value');
              },
              decoration: const InputDecoration(
                labelText: 'Enter text here',
                hintText: 'Sujan',
                prefixIcon: Icon(Icons.ac_unit),
                suffixIcon: Icon(Icons.abc),
                border: OutlineInputBorder()
              ),
            ),
          ),
          Text(_nameController.text, style: const TextStyle(fontSize: 24),),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
