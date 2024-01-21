import 'package:flutter/material.dart';

class InputFormView extends StatefulWidget {
  const InputFormView({super.key});

  @override
  State<InputFormView> createState() => _InputFormViewState();
}

class _InputFormViewState extends State<InputFormView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Input form"),
    );
  }
}
