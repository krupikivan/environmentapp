import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Iris Test App',
      home: Scaffold(
          body: Center(
        child: Semantics(
          label: 'textfield_email_label',
          child: const TextField(
            decoration: InputDecoration(
              label: Text('Label'),
              helperText: 'Helper Text',
              hintText: 'Hint Text',
            ),
          ),
        ),
      )),
    );
  }
}
