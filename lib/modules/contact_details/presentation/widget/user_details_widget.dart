import 'package:facetrip/modules/contact_details/presentation/widget/follow_widget.dart';
import 'package:facetrip/modules/login/domain/entities/user.dart';
import 'package:flutter/material.dart';

class UserDetailsWidget extends StatelessWidget {
  final UserEntity userEntity;
  final UserEntity currentUser;
  const UserDetailsWidget(
      {Key? key, required this.userEntity, required this.currentUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage(userEntity.url),
      ),
      trailing: FollowWidget(
          isFollowed: currentUser.listContact.contains(userEntity.email)),
      title: Text(userEntity.name),
      subtitle: Text(
        userEntity.isTraveled ? 'Is traveling ' : 'Is not traveling',
        style: TextStyle(
            color:
                userEntity.isTraveled ? Colors.greenAccent : Colors.redAccent),
      ),
    );
  }
}
