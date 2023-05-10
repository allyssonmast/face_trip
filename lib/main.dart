import 'package:facetrip/core/shered/widget/my_circular_indicator.dart';
import 'package:facetrip/modules/home/presentation/page/home_page.dart';
import 'package:facetrip/modules/login/domain/usecases/auth_use_case.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import 'package:facetrip/modules/login/presentation/page/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'core/config/db_config.dart';
import 'core/config/firebase_options.dart';
import 'modules/login/presentation/bloc/login_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
 // await DbConfi().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const MyCircularIndicator();
          }
          if (snapshot.hasData) {
            return const HomePage();
          }

          return const LoginPage();
        },
      ),
    );
  }
}
