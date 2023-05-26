import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facetrip/core/config/user_server.dart';
import 'package:facetrip/core/shered/widget/error_widget.dart';
import 'package:facetrip/core/shered/widget/my_circular_indicator.dart';
import 'package:facetrip/injection.dart';
import 'package:facetrip/modules/login/domain/entities/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_bloc.dart';
import 'home_widget.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<UserEntity>(
          stream: UserService(getIt<FirebaseAuth>(), getIt<FirebaseFirestore>())
              .loadCurrentUser(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var listContacts = snapshot.data;
              return BlocProvider<HomeBloc>(
                create: (_) => getIt<HomeBloc>(),
                child: BlocConsumer<HomeBloc, HomeState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state.status.isInitial) {
                      context
                          .read<HomeBloc>()
                          .add(HomeEvent.started(listContacts!));
                      return const MyCircularIndicator();
                    } else if (state.status.isLoading) {
                      return const MyCircularIndicator();
                    } else if (state.status.isError) {
                      return const FailureWidget();
                    }
                    return const HomeWidget();
                  },
                ),
              );
            } else if (snapshot.hasError) {
              return const FailureWidget();
            } else {
              return const MyCircularIndicator();
            }
          }),
    );
  }
}
