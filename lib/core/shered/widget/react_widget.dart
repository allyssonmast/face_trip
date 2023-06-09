import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ReactWidget extends StatelessWidget {
  final String name;
  final bool isPassword;
  const ReactWidget({this.isPassword = false, Key? key, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: ReactiveTextField(
        autofocus: false,
        obscureText: isPassword,
        formControlName: name.toLowerCase(),
        decoration: InputDecoration(
          labelText: name,
          isDense: true,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
