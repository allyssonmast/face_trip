import 'package:auto_route/auto_route.dart';
import 'package:facetrip/core/shered/route/go_route.dart';
import 'package:facetrip/core/shered/widget/react_widget.dart';
import 'package:facetrip/injection.dart';
import 'package:facetrip/modules/login/presentation/widget/divide_widget.dart';
import 'package:facetrip/modules/login/presentation/widget/signup_widget.dart';
import 'package:facetrip/modules/login/presentation/widget/topwelcome_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  _logginButton(BuildContext context) async {
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
      _btnController.error();
      await Future.delayed(const Duration(seconds: 1));
      _btnController.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<LoginBloc>(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) async {
            if (state is LoginFailure) {
              _btnController.error();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  key: const Key('error_snacl'),
                  content: Text(state.errorMessage),
                ),
              );
              await Future.delayed(const Duration(seconds: 1));
              _btnController.reset();
            } else if (state is LoginSuccess) {
              _btnController.success();
              GoTo().replace(context, '/dashboard');
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
                      const ReactWidget(
                          key: Key('emailField'),
                          name: 'Email'),
                      const ReactWidget(
                        key: Key('passwordField'),
                        name: 'Password',
                        isPassword: true,
                      ),
                      RoundedLoadingButton(
                        key: const Key('loginButton'),
                        color: Theme.of(context).cardColor,
                        controller: _btnController,
                        onPressed: () => _logginButton(context),
                        child: const Text('Login'),
                      ),
                      const SignupWidget(),
                      const SizedBox(height: 16),
                      const DivideWidget(),
                      SignInButton(Buttons.Google,
                          onPressed: () => context
                              .read<LoginBloc>()
                              .add(LoginWithGoogleButtonPressed())),
                      SignInButton(Buttons.Facebook,
                          onPressed: () => context
                              .read<LoginBloc>()
                              .add(LoginWithFacebookButtonPressed())),
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
