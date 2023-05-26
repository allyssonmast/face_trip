import 'package:facetrip/core/constants/constants.dart';
import 'package:facetrip/core/shered/deeplink/deeplink_entity.dart';
import 'package:facetrip/injection.dart';
import 'package:facetrip/modules/contact_details/presentation/bloc/contact_details_bloc.dart';
import 'package:facetrip/modules/contact_details/presentation/widget/grid_interess_widget.dart';
import 'package:facetrip/modules/contact_details/presentation/widget/trips_widget.dart';
import 'package:facetrip/modules/contact_details/presentation/widget/user_details_widget.dart';
import 'package:facetrip/modules/home/presentation/bloc/home_bloc.dart';
import 'package:facetrip/modules/login/domain/entities/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactDetailsWidget extends StatelessWidget {
  final UserEntity userEntity;

  const ContactDetailsWidget({
    Key? key,
    required this.userEntity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var current = getIt<HomeBloc>().state.user!;
    var listTrip = context.watch<ContactDetailsBloc>().state.listTrip;
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
                  icon: const Icon(Icons.notifications),
                ),
              ),
              const SizedBox(width: 8),
              CircleAvatar(
                child: IconButton(
                  onPressed: () {
                    var deepLink = DeepLinkEntity(
                      title: userEntity.name,
                      body: userEntity.description,
                      id: userEntity.id,
                      url: userEntity.url,
                    );
                    context
                        .read<ContactDetailsBloc>()
                        .add(ContactDetailsEvent.shareContact(deepLink));
                  },
                  icon: const Icon(Icons.ios_share),
                ),
              ),
              const SizedBox(width: 8),
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
              GridInteressWidget(
                listInteress: userEntity.listInterests,
              ),
              Padding(
                padding: paddingTiteleMediaum,
                child: Text(
                  'Trips',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                padding: paddingHorizonteLarge,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: listTrip.length,
                itemBuilder: (_, index) {
                  var trip = listTrip[index];
                  return TripsWidget(trip: trip);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
