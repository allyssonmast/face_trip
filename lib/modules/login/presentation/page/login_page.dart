import 'package:auto_route/auto_route.dart';
import 'package:facetrip/core/shered/route/go_route.dart';
import 'package:facetrip/core/shered/widget/react_widget.dart';
import 'package:facetrip/injection.dart';
import 'package:facetrip/modules/login/presentation/widget/divide_widget.dart';
import 'package:facetrip/modules/login/presentation/widget/signup_widget.dart';
import 'package:facetrip/modules/login/presentation/widget/topwelcome_widget.dart';
import 'package:facetrip/routes/routes_imports.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../bloc/login_bloc.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final FormGroup _form;
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

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
        body: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginFailure) {
              _btnController.reset();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage),
                ),
              );
              _btnController.reset();
            } else if (state is LoginSuccess) {
              _btnController.success();
              GoTo().route(context, '/');
            }
          },
          builder: (context, state) {
            return SafeArea(
              child: ReactiveForm(
                formGroup: _form,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const WidgetTopWelcome(),
                      const SizedBox(height: 32),
                      const ReactWidget(name: 'Email'),
                      const ReactWidget(name: 'Password'),
                      RoundedLoadingButton(
                        color: Theme.of(context).cardColor,
                        controller: _btnController,
                        onPressed: () {
                          if (_form.valid) {
                            final email = _form.value['email'] as String;
                            final password = _form.value['password'] as String;

                            context.read<LoginBloc>().add(
                                  LoginWithEmailButtonPressed(
                                    email: email,
                                    password: password,
                                  ),
                                );
                          } else {
                            _form.markAllAsTouched();
                            _btnController.reset();
                          }
                        },
                        child: const Text('Login'),
                      ),
                      const SignupWidget(),
                      const SizedBox(height: 16),
                      const DivideWidget(),
                      SignInButton(
                        Buttons.Google,
                        onPressed: () {
                          context.read<LoginBloc>().add(
                                LoginWithGoogleButtonPressed(),
                              );
                        },
                      ),
                      SignInButton(
                        Buttons.Facebook,
                        onPressed: () {
                          context.read<LoginBloc>().add(
                                LoginWithFacebookButtonPressed(),
                              );
                        },
                      ),
                      SignInButtonBuilder(
                        text: 'Sign in with Email',
                        icon: Icons.phone_android,
                        onPressed: () {},
                        backgroundColor: Colors.blueGrey[700]!,
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
