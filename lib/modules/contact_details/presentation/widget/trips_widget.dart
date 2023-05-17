import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:facetrip/modules/trip/domain/entities/trip.dart';
import 'package:flutter/material.dart';

class TripsWidget extends StatelessWidget {
  final Trip trip;
  const TripsWidget({Key? key, required this.trip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: ListTile(
        onTap: () => context.router.pushNamed('/trip/:${trip.id}'),
        title: Text(trip.place),
        subtitle: Text(trip.comment),
        trailing: const Icon(Icons.arrow_forward_ios),
        leading: CircleAvatar(
          backgroundImage: CachedNetworkImageProvider(trip.url),
        ),
      ),
    );
  }
}
