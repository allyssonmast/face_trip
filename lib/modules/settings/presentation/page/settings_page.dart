import 'package:auto_route/auto_route.dart';
import 'package:facetrip/core/shered/widget/error_widget.dart';
import 'package:facetrip/core/shered/widget/my_circular_indicator.dart';
import 'package:facetrip/injection.dart';
import 'package:facetrip/modules/settings/presentation/bloc/settings_bloc.dart';
import 'package:facetrip/modules/settings/presentation/page/setting_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<SettingsBloc>(
        create: (context) => getIt<SettingsBloc>(),
        child: BlocConsumer<SettingsBloc, SettingsState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            print(state.status);
            if (state.status.isInitial) {
              context.read<SettingsBloc>().add(const SettingsEvent.started());
              return const MyCircularIndicator();
            }
            if (state.status.isLoaded) {
              var user = context.watch<SettingsBloc>().state.user;
              return SettingWidget(user: user!);
            } else if (state.status.isError) {
              return const FailureWidget();
            } else if (state.status.isUpdated) {
              var user = context.watch<SettingsBloc>().state.user;
              return SettingWidget(user: user!);
            } else {
              return const MyCircularIndicator();
            }
          },
        ),
      ),
    );
  }
}
