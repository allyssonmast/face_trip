import 'package:facetrip/core/shered/route/go_route.dart';
import 'package:facetrip/routes/names_routes.dart';
import 'package:flutter/material.dart';

class SignupWidget extends StatelessWidget {
  const SignupWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Text('Don\'t have an account yet? '),
        TextButton(
            onPressed: () {
              GoTo().route(context, REGISTER_USER);
            },
            child: const Text('SignUp'))
      ],
    );
  }
}
