import 'package:auto_route/auto_route.dart';
import 'package:facetrip/core/shered/widget/error_widget.dart';
import 'package:facetrip/core/shered/widget/my_circular_indicator.dart';
import 'package:facetrip/injection.dart';
import 'package:facetrip/modules/contact_details/presentation/bloc/contact_details_bloc.dart';
import 'package:facetrip/modules/login/domain/entities/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';

import 'contact_details_widget.dart';

@RoutePage()
class ContactDetailsPage extends StatefulWidget {
  final UserEntity userEntity;
  const ContactDetailsPage({Key? key, required this.userEntity})
      : super(key: key);

  @override
  _ContactDetailsPageState createState() {
    return _ContactDetailsPageState();
  }
}

class _ContactDetailsPageState extends State<ContactDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ContactDetailsBloc>(
      create: (context) => getIt<ContactDetailsBloc>(),
      child: BlocConsumer<ContactDetailsBloc, ContactDetailsState>(
        listener: (context, state) async {
          if (state.status.isGeneratedDeep) {
            var uri = state.uri;
            await Share.share(uri.toString());
          }
        },
        builder: (context, state) {
          if (state.status.isInitial) {
            context
                .read<ContactDetailsBloc>()
                .add(const ContactDetailsEvent.started());
            return const MyCircularIndicator();
          } else if (state.status.isError) {
            return const FailureWidget();
          } else if (state.status.isLoaded) {
            return ContactDetailsWidget(userEntity: widget.userEntity);
          }
          return const FailureWidget();
        },
      ),
    );
  }
}
