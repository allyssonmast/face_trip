import 'package:facetrip/core/shered/widget/react_widget.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class SettingWidget extends StatefulWidget {
  const SettingWidget({Key? key}) : super(key: key);

  @override
  _SettingWidgetState createState() => _SettingWidgetState();
}

class _SettingWidgetState extends State<SettingWidget> {
  late final FormGroup _form;
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  @override
  void initState() {
    super.initState();

    _form = FormGroup({
      'name': FormControl<String>(
        validators: [Validators.required, Validators.email],
      ),
      'description': FormControl<String>(
        validators: [Validators.required, Validators.email],
      ),
      'email': FormControl<String>(
        validators: [Validators.required, Validators.email],
      ),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ReactiveForm(
        formGroup: _form,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Card(
                      margin: const EdgeInsets.only(top: 64, bottom: 16),
                      child: SizedBox(
                        width: 200,
                        height: 200,
                        child: Container(),
                      ),
                    ),
                  ),
                  SwitchListTile(
                      title: const Text('Is traveling'),
                      value: false,
                      onChanged: (onChanged) {}),
                  const SizedBox(
                    height: 10,
                  ),
                  const ReactWidget(name: 'Name'),
                  const ReactWidget(name: 'Email'),
                  const ReactWidget(name: 'Description'),
                  RoundedLoadingButton(
                    color: Theme.of(context).cardColor,
                    controller: _btnController,
                    onPressed: () {
                      if (_form.valid) {
                        final email = _form.value['email'] as String;
                        final password = _form.value['password'] as String;
                      } else {
                        _form.markAllAsTouched();
                        _btnController.reset();
                      }
                    },
                    child: const Text('Login'),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
