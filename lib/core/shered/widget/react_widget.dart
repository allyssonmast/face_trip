import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ReactWidget extends StatelessWidget {
  final String name;
  const ReactWidget({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: ReactiveTextField(
        autofocus: false,
        formControlName: name.toLowerCase(),
        decoration: InputDecoration(
          labelText: name,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
