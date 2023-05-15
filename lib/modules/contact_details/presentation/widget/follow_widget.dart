import 'package:flutter/material.dart';

class FollowWidget extends StatelessWidget {
  final bool isFollowed;
  const FollowWidget({Key? key, required this.isFollowed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !isFollowed
        ? ElevatedButton.icon(
            onPressed: () {},
            label: const Text('Fallow'),
            icon: const Icon(Icons.add),
          )
        : ElevatedButton.icon(
            onPressed: () {},
            label: const Text('Following'),
            icon: const Icon(Icons.remove),
          );
  }
}
