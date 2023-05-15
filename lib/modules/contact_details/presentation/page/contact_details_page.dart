import 'package:auto_route/auto_route.dart';
import 'package:facetrip/injection.dart';
import 'package:facetrip/modules/contact_details/presentation/bloc/contact_details_bloc.dart';
import 'package:facetrip/modules/login/domain/entities/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return ContactDetailsWidget(userEntity: widget.userEntity);
        },
      ),
    );
  }
}
