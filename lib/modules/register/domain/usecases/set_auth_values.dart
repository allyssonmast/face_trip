import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class SetUserValues {
  final FirebaseAuth _auth;

  SetUserValues(this._auth);
  Future setUser(String name) async {
    await _auth.currentUser!.updateDisplayName(name);
    await _auth.currentUser!.updatePhotoURL(getUrl());
  }
}

String getUrl() =>
    'https://randomuser.me/api/portraits/men/${Random().nextInt(100)}.jpg';
