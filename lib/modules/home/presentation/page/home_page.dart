import 'package:auto_route/auto_route.dart';
import 'package:facetrip/core/shered/widget/my_circular_indicator.dart';
import 'package:facetrip/core/shered/widget/react_widget.dart';
import 'package:facetrip/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../bloc/home_bloc.dart';
import 'home_widget.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final FormGroup _form;
  @override
  void initState() {
    super.initState();

    _form = FormGroup({
      'email': FormControl<String>(
        validators: [Validators.required, Validators.email],
      ),
      'name': FormControl<String>(
        validators: [Validators.required, Validators.minLength(6)],
      ),
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> listEmail = [];
    return Scaffold(
      body: BlocProvider<HomeBloc>(
        create: (_) => getIt<HomeBloc>(),
        child: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state.status.isAddContact) {
              showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      content: ReactiveForm(
                          formGroup: _form,
                          child: const ReactWidget(name: 'Name')),
                      actions: [
                        TextButton(
                          onPressed: () {},
                          child: const Text('Add contact'),
                        )
                      ],
                    );
                  });
            }
          },
          builder: (context, state) {
            return const HomeWidget();
          },
        ),
      ),
    );
  }
}
