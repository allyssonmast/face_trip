import 'package:auto_route/auto_route.dart';
import 'package:facetrip/core/shered/widget/my_circular_indicator.dart';
import 'package:facetrip/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_bloc.dart';
import 'home_widget.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<HomeBloc>(
        create: (_) => getIt<HomeBloc>(),
        child: BlocConsumer<HomeBloc, HomeState>(
          bloc: getIt<HomeBloc>(),
          listener: (context, state) {
            print(state);
          },
          builder: (context, state) {
            switch (state.status) {
              case HomeStatus.initial:
                getIt<HomeBloc>().add(const HomeEvent.started());
                return const MyCircularIndicator();
              case HomeStatus.loaded:
                return const HomeWidget();
              case HomeStatus.loading:
                return const MyCircularIndicator();
              case HomeStatus.error:
                return const Center(
                  child: Text('Error'),
                );
            }
          },
        ),
      ),
    );
  }
}
