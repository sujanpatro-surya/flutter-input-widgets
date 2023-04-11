import 'package:flutter/material.dart';

class UsingStepperWidget extends StatefulWidget {
  const UsingStepperWidget({Key? key}) : super(key: key);

  @override
  State<UsingStepperWidget> createState() => _UsingStepperWidgetState();
}

class _UsingStepperWidgetState extends State<UsingStepperWidget> {
  int _activeStep = 0;
  String _username = '', _email = '', _password = '';
  bool _error = false;
  late List<Step> _allSteps;

  var key0 = GlobalKey<FormFieldState>();
  var key1 = GlobalKey<FormFieldState>();
  var key2 = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    _allSteps = _stepperSteps();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stepper'),
      ),
      body: SingleChildScrollView(
        child: Stepper(
          onStepContinue: () {
            setState(() {
              continueControl();
            });
            /*if (_activeStep < _allSteps.length-1) {
              setState(() {
                _activeStep++;
              });
            }*/
          },
          onStepCancel: () {
            if (_activeStep > 0) {
              setState(() {
                _activeStep--;
              });
            }
          },
          currentStep: _activeStep,
          /*onStepTapped: (selectedStep) {
            setState(() {
              _activeStep = selectedStep;
            });
          },*/
          steps: _allSteps,
        ),
      ),
    );
  }

  List<Step> _stepperSteps() {
    return [
      Step(
        title: const Text('Username title'),
        subtitle: const Text('Username subtitle'),
        state: setStepState(0),
        isActive: true,
        content: TextFormField(
          key: key0,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value!.length < 8) {
              return 'Username must be at least 8 characters!';
            }
          },
          decoration: const InputDecoration(
            labelText: 'Username',
            hintText: 'Username'
          ),
          onSaved: (value) {
            _username = value!;
          }
        )
      ),
      Step(
        title: const Text('Email title'),
        subtitle: const Text('Email subtitle'),
        state: setStepState(1),
        isActive: true,
        content: TextFormField(
          key: key1,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (!value!.contains('@')) {
              return 'Enter a valid email address!';
            }
          },
          decoration: const InputDecoration(
            labelText: 'Email',
            hintText: 'Email',
          ),
          onSaved: (value) {
            _email = value!;
          },
          keyboardType: TextInputType.emailAddress,
        )
      ),
      Step(
        title: const Text('Password title'),
        subtitle: const Text('Password subtitle'),
        state: setStepState(2),
        isActive: true,
        content: TextFormField(
          key: key2,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value!.length < 8) {
              return 'Password must be at least 8 characters!';
            }
          },
          decoration: const InputDecoration(
            labelText: 'Password',
            hintText: 'Password'
          ),
          onSaved: (value) {
            _password = value!;
          },
        )
      ),
    ];
  }

  StepState setStepState(int currentStep) {
    if (_activeStep  == currentStep) {
      if (_error) {
        return StepState.error;
      }
      else {
        return StepState.editing;
      }
    }
    else {
      return StepState.indexed;
    }
  }

  void continueControl() {
    switch(_activeStep) {
      case 0: {
        if (key0.currentState!.validate()) {
          key0.currentState!.save();
          _error = false;
          _activeStep = 1;
        } else {
          _error = true;
        }
        break;
      }
    case 1: {
      if (key1.currentState!.validate()) {
        key1.currentState!.save();
        _error = false;
        _activeStep = 2;
      } else {
        _error = true;
      }
      break;
    }
    case 2: {
      if (key2.currentState!.validate()) {
        key2.currentState!.save();
        _error = false;
      } else {
        _error = true;
      }
      break;
    }
    }
  }
}
