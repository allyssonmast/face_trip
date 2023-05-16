import 'dart:math';

import 'package:facetrip/core/constants/constants.dart';
import 'package:facetrip/injection.dart';
import 'package:facetrip/modules/contact_details/presentation/widget/grid_interess_widget.dart';
import 'package:facetrip/modules/contact_details/presentation/widget/user_details_widget.dart';
import 'package:facetrip/modules/home/presentation/bloc/home_bloc.dart';
import 'package:facetrip/modules/login/domain/entities/user.dart';
import 'package:flutter/material.dart';

class ContactDetailsWidget extends StatelessWidget {
  final UserEntity userEntity;

  const ContactDetailsWidget(
      {Key? key, required this.userEntity, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var current = getIt<HomeBloc>().state.user ??
        const UserEntity(
            id: 'id',
            email: 'email',
            name: 'name',
            description: 'description',
            isTraveled: false,
            url: 'url',
            listContact: []);

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) =>
            [
          SliverAppBar(
            expandedHeight: 170,
            leading: Container(
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.all(8.0),
              child: const CircleAvatar(
                child: BackButton(),
              ),
            ),
            actions: [
              CircleAvatar(
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.ios_share),
                ),
              ),
            ],
            flexibleSpace: Image.network(
              'https://www.carpemundi.com.br/wp-content/uploads/2022/01/frases-de-viagem-cm.jpg',
              fit: BoxFit.cover,
            ),
            pinned: true,
          )
        ],
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserDetailsWidget(
                userEntity: userEntity,
                currentUser: current,
                isContact: current.listContact.contains(userEntity.email),
              ),
              Padding(
                padding: paddingTitele,
                child: Text(userEntity.description),
              ),
              Padding(
                padding: paddingTiteleMediaum,
                child: Text(
                  'Interests',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              const GridInteressWidget(),
              Padding(
                padding: paddingTiteleMediaum,
                child: Text(
                  'Viagens',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Color getRandomColor() {
  Random random = Random();
  return Color.fromRGBO(
    random.nextInt(256),
    random.nextInt(256),
    random.nextInt(256),
    1,
  );
}
