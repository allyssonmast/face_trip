import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DbConfi {
  Future init() async {
    await dotenv.load();
    bool firebaseEmu = dotenv.env["USE_FIREBASE_EMU"] != null;

    if (firebaseEmu) {
      await _configureFirebaseAuth();
      await _configureFirebaseStorage();
      _configureFirebaseFirestore();
    }
  }

  Future<void> _configureFirebaseAuth() async {
    var defaultHost = Platform.isAndroid ? '10.0.2.2' : 'localhost';
    var port = 9099;
    await FirebaseAuth.instance.useAuthEmulator(defaultHost, port);
    debugPrint('Using Firebase Auth emulator on: $defaultHost:$port');
  }

  Future<void> _configureFirebaseStorage() async {
    var defaultHost = Platform.isAndroid ? '10.0.2.2' : 'localhost';
    var port = 9199;
    await FirebaseStorage.instance.useStorageEmulator(defaultHost, port);
    debugPrint('Using Firebase Storage emulator on: $defaultHost:$port');
  }

  void _configureFirebaseFirestore() {
    var defaultHost = Platform.isAndroid ? '10.0.2.2' : 'localhost';
    var port = 8080;

    FirebaseFirestore.instance.settings = Settings(
      host: '$defaultHost:$port',
      sslEnabled: false,
      persistenceEnabled: false,
    );
    debugPrint('Using Firebase Firestore emulator on: $defaultHost:$port');
  }
}
