import 'package:facetrip/bloc_observer.dart';
import 'package:facetrip/injection.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/config/db_config.dart';
import 'core/config/firebase_options.dart';
import 'generate_database_fake.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await DbConfi().init();
  configureDependencies();
  Bloc.observer = TripBlocObserver();
  //await GenerateDbFake().addFakeUsersToFirestore();
  runApp(const MyApp());
}
