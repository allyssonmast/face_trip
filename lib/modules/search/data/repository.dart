import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:facetrip/core/error/login/failure.dart';
import 'package:facetrip/modules/login/domain/entities/user.dart';
import 'package:facetrip/modules/search/domain/repositories/search_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as: SearchRepository)
class SearchRepositoryImpl implements SearchRepository {
  final FirebaseFirestore _firestore;
  final SharedPreferences pref;

  SearchRepositoryImpl(this._firestore, this.pref);

  @override
  Future<Either<Failure, List<UserEntity>>> searchUsersByEmail(
      String email) async {
    try {
      final usersQuery = await _firestore
          .collection('users')
          .where('email', isEqualTo: email)
          .get();

      final usersDocs = usersQuery.docs;
      final users =
          usersDocs.map((doc) => UserEntity.fromJson(doc.data())).toList();

      return Right(users);
    } catch (e) {
      return const Left(Failure.networkError());
    }
  }

  @override
  Future<void> saveUserLocally(UserEntity user) async {
    final users = pref.getStringList('saved_users') ?? [];

    final userMap = user.toJson();
    users.add(jsonEncode(userMap));

    await pref.setStringList('saved_users', users);
  }

  @override
  Future<List<UserEntity>> getSavedUsers() async {
    final prefs = await SharedPreferences.getInstance();
    final users = prefs.getStringList('saved_users') ?? [];

    final userList = users
        .map((userJson) => UserEntity.fromJson(jsonDecode(userJson)))
        .toList();

    return userList;
  }
}
