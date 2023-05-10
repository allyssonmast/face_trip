import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DbConfi {
  Future init() async {
    await dotenv.load(); // Carrega as variáveis do arquivo .env
    bool firebaseEmu = dotenv.env["USE_FIREBASE_EMU"] != null;

    if (firebaseEmu) {
      await _configureFirebaseAuth();
      await _configureFirebaseStorage();
      _configureFirebaseFirestore();
    }
  }

  Future<void> _configureFirebaseAuth() async {
    String configHost = dotenv.env['FIREBASE_EMU_URL'] ?? '';
    int configPort = int.parse(dotenv.env['AUTH_EMU_PORT'] ?? '0');
    // Android emulator must be pointed to 10.0.2.2
    var defaultHost = Platform.isAndroid ? '10.0.2.2' : 'localhost';
    var host = configHost.isNotEmpty ? configHost : defaultHost;
    var port = configPort != 0 ? configPort : 9099;
    await FirebaseAuth.instance.useAuthEmulator(host, port);
    debugPrint('Using Firebase Auth emulator on: $host:$port');
  }

  Future<void> _configureFirebaseStorage() async {
    String configHost = dotenv.env['FIREBASE_EMU_URL'] ?? '';
    int configPort = int.parse(dotenv.env['STORAGE_EMU_PORT'] ?? '0');
    // Android emulator must be pointed to 10.0.2.2
    var defaultHost = Platform.isAndroid ? '10.0.2.2' : 'localhost';
    var host = configHost.isNotEmpty ? configHost : defaultHost;
    var port = configPort != 0 ? configPort : 9199;
    await FirebaseStorage.instance.useStorageEmulator(host, port);
    debugPrint('Using Firebase Storage emulator on: $host:$port');
  }

  void _configureFirebaseFirestore() {
    String configHost = dotenv.env['FIREBASE_EMU_URL'] ?? '';
    int configPort = int.parse(dotenv.env['DB_EMU_PORT'] ?? '0');
    // Android emulator must be pointed to 10.0.2.2
    var defaultHost = Platform.isAndroid ? '10.0.2.2' : 'localhost';
    var host = configHost.isNotEmpty ? configHost : defaultHost;
    var port = configPort != 0 ? configPort : 8080;

    FirebaseFirestore.instance.settings = Settings(
      host: '$host:$port',
      sslEnabled: false,
      persistenceEnabled: false,
    );
    debugPrint('Using Firebase Firestore emulator on: $host:$port');
  }
}
