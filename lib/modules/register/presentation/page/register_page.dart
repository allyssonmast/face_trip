import 'package:auto_route/auto_route.dart';
import 'package:facetrip/core/shered/widget/react_widget.dart';
import 'package:facetrip/modules/register/presentation/bloc/register_bloc.dart';
import 'package:facetrip/modules/register/presentation/bloc/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../injection.dart';
import '../bloc/register_event.dart';

@RoutePage()
class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final FormGroup _form;
  @override
  void initState() {
    super.initState();

    _form = FormGroup({
      'email': FormControl<String>(
        validators: [Validators.required, Validators.email],
      ),
      'password': FormControl<String>(
        validators: [Validators.required, Validators.minLength(6)],
      ),
      'name': FormControl<String>(
        validators: [Validators.required, Validators.minLength(3)],
      ),
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterBloc>(
      create: (_) => getIt<RegisterBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('SingUp'),
          centerTitle: true,
        ),
        body: BlocConsumer<RegisterBloc, RegisterState>(
            listener: (context, state) {
          print(state);
          print('inicial');
        }, builder: (context, state) {
          print(state);
          return ReactiveForm(
            formGroup: _form,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const ReactWidget(name: 'Name'),
                    const ReactWidget(name: 'Email'),
                    const ReactWidget(name: 'Password'),
                    ElevatedButton(
                      onPressed: () {
                        if (_form.valid) {
                          final email = _form.value['email'] as String;
                          final password = _form.value['password'] as String;

                          getIt<RegisterBloc>().add(
                            RegisterEvent.registerWithEmailAndPasswordPressed(
                                email, password),
                          );
                        } else {
                          _form.markAllAsTouched();
                        }
                      },
                      child: const Text('Register'),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
