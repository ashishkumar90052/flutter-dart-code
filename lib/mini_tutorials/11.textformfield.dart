import 'package:flutter/material.dart';

class ErrorProperty extends StatefulWidget {
  const ErrorProperty({super.key});

  @override
  State<ErrorProperty> createState() => _ErrorPropertyState();
}

class _ErrorPropertyState extends State<ErrorProperty> {
  bool _value = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Switch.adaptive(
        value: _value,
        onChanged: (newValue) => setState(() => _value = newValue),
      ),
    ));
  }
}
