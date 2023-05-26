import 'package:cached_network_image/cached_network_image.dart';
import 'package:facetrip/core/shered/route/go_route.dart';
import 'package:facetrip/injection.dart';
import 'package:facetrip/routes/names_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userEntity = getIt<FirebaseAuth>().currentUser;
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(userEntity!.displayName ?? ''),
            accountEmail: Text(userEntity.email!),
            currentAccountPicture: CircleAvatar(
              backgroundImage: userEntity.photoURL != null
                  ? CachedNetworkImageProvider(
                      userEntity.photoURL!,
                      errorListener: () => Container(),
                    )
                  : null,
            ),
          ),
          ListTile(
            title: const Text('Sign out'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () async {
              GoTo().replace(context, LOGIN);
              await getIt<FirebaseAuth>().signOut();
            },
          )
        ],
      ),
    );
  }
}
