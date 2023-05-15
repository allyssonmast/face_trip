import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:facetrip/modules/login/domain/entities/user.dart';
import 'package:facetrip/routes/routes_imports.gr.dart';
import 'package:flutter/material.dart';

class ContactWidget extends StatelessWidget {
  final UserEntity contact;
  const ContactWidget({Key? key, required this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(contact.name),
      onTap: () =>
          context.pushRoute(ContactDetailsPageRoute(userEntity: contact)),
      subtitle: Text(
        contact.description,
        maxLines: 1,
      ),
      trailing: contact.isTraveled
          ? const Icon(
              Icons.card_travel,
              color: Colors.greenAccent,
            )
          : null,
      leading: CircleAvatar(
          backgroundImage: CachedNetworkImageProvider(
        contact.url,
      )),
    );
  }
}
