import 'package:flutter/material.dart';

class UsingTextFormField extends StatefulWidget {
  const UsingTextFormField({Key? key}) : super(key: key);

  @override
  State<UsingTextFormField> createState() => _UsingTextFormFieldState();
}

class _UsingTextFormFieldState extends State<UsingTextFormField> {
  String _email = '';
  String _username = '';
  String _password = '';
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TextFormField'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (!value!.contains('@') || value.length < 6) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _email = value!;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Email'
                  ),
                ),
                const SizedBox(height: 15,),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.length < 6) {
                      return 'Username must be at least 6 characters';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _username = value!;
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                      hintText: 'Username'
                  ),
                ),
                const SizedBox(height: 15,),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  validator: (value) {
                    if (value!.length < 8) {
                      return 'Password must be a minimum of 8 characters';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _password = value!;
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Password'
                  ),
                ),
                const SizedBox(height: 15,),
                ElevatedButton(onPressed: () {
                  bool validate = _formKey.currentState!.validate();
                  if (validate) {
                    _formKey.currentState!.save();
                  }
                  String result = 'Email: $_email\nUsername: $_username\nPassword: $_password';
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(result))
                  );
                  _formKey.currentState!.reset();
                },
                child: const Text('OK')
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
