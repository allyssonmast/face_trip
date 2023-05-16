import 'package:facetrip/modules/contact_details/presentation/bloc/contact_details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FollowWidget extends StatelessWidget {
  final bool isFollowed;
  final String idContact;
  final List<String> listContacts;
  const FollowWidget(
      {Key? key,
      required this.isFollowed,
      required this.idContact,
      required this.listContacts})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !isFollowed
        ? ElevatedButton.icon(
            onPressed: () {
              List<String> newList = [];
              newList.addAll(listContacts);
              newList.add(idContact);
              context
                  .read<ContactDetailsBloc>()
                  .add(ContactDetailsEvent.updateContact(newList));
            },
            label: const Text('Fallow'),
            icon: const Icon(Icons.add),
          )
        : ElevatedButton.icon(
            onPressed: () {
              List<String> newList = [];
              newList.addAll(listContacts);
              newList.removeWhere((element) => element == idContact);
              context
                  .read<ContactDetailsBloc>()
                  .add(ContactDetailsEvent.updateContact(newList));
            },
            label: const Text('Following'),
            icon: const Icon(Icons.remove),
          );
  }
}
