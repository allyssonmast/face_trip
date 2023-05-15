import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:facetrip/core/error/login/failure.dart';
import 'package:facetrip/modules/home/domain/repositories/contact_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/contact.dart';

@Injectable(as: ContactRepository)
class ContactRepositoryImp implements ContactRepository {
  final FirebaseFirestore _store;
  final FirebaseAuth _auth;

  ContactRepositoryImp(this._store, this._auth);
  @override
  Future<Either<Failure, List<ContactEntity>>> call() async {
    try {
      var result = await _store
          .collection('users')
          .where('listContact', arrayContains: _auth.currentUser!.email)
          .get();

      print(result.docs);

      var list =
          result.docs.map((e) => ContactEntity.fromJson(e.data())).toList();

      return Right(list);
    } catch (e) {
      return const Left(Failure.networkError());
    }
  }

  @override
  Future<Either<Failure, bool>> addContact(ContactEntity contact) async {
    try {
      await _store
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('contacts')
          .add(contact.toJson());

      return const Right(true);
    } catch (e) {
      return const Left(Failure.serverError());
    }
  }
}
