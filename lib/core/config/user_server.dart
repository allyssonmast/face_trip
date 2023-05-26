import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facetrip/modules/login/domain/entities/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:injectable/injectable.dart';

@lazySingleton
class UserService {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  UserEntity? _currentUser;

  UserService(this._auth, this._firestore);

  Stream<UserEntity> loadCurrentUser() {
    return _firestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .snapshots()
        .map((event) {
      if (event.exists) {
        return UserEntity.fromJson(event.data()!);
      }
      return fakeUser;
    });
  }

  UserEntity? get currentUser => _currentUser;
}

const fakeUser = UserEntity(
  id: '',
  email: '',
  name: '',
  description: '',
  isTraveled: false,
  url: '',
  listContact: [],
  listInterests: [],
);
