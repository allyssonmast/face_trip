import 'package:auto_route/auto_route.dart';
import 'package:facetrip/core/shered/route/go_route.dart';
import 'package:facetrip/injection.dart';
import 'package:facetrip/routes/routes_imports.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../bloc/login_bloc.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

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
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<LoginBloc>(),
      child: Scaffold(
        body: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            print(state);
            if (state is LoginFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage),
                ),
              );
            } else if (state is LoginSuccess) {
              GoTo().route(context, const HomePageRoute());
            }
          },
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              print(state);
              if (state is LoginLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return SafeArea(
                child: ReactiveForm(
                  formGroup: _form,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Welcome back!',
                          style: Theme.of(context).textTheme.headline6,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 32),
                        ReactiveTextField(
                          autofocus: false,
                          formControlName: 'email',
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 16),
                        ReactiveTextField(
                          formControlName: 'password',
                          obscureText: true,
                          autofocus: false,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        TextButton(
                          onPressed: () =>
                              GoTo().route(context, const RegisterPageRoute()),
                          child: const Text('Singup'),
                        ),
                        const SizedBox(height: 32),
                        SignInButton(
                          Buttons.Email,
                          text: 'Login with Email',
                          onPressed: () {
                            if (_form.valid) {
                              final email = _form.value['email'] as String;
                              final password =
                                  _form.value['password'] as String;

                              getIt<LoginBloc>().add(
                                LoginWithEmailButtonPressed(
                                  email: email,
                                  password: password,
                                ),
                              );
                            } else {
                              _form.markAllAsTouched();
                            }
                          },
                        ),
                        const SizedBox(height: 16),
                        SignInButton(
                          Buttons.Google,
                          text: 'Login with Google',
                          onPressed: () {
                            getIt<LoginBloc>().add(
                              LoginWithGoogleButtonPressed(),
                            );
                          },
                        ),
                        SignInButton(
                          Buttons.Facebook,
                          text: 'Login with Facebook',
                          onPressed: () {
                            getIt<LoginBloc>().add(
                              LoginWithFacebookButtonPressed(),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
