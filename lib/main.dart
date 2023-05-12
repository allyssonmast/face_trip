import 'package:facetrip/core/shered/widget/my_circular_indicator.dart';
import 'package:facetrip/injection.dart';
import 'package:facetrip/modules/home/presentation/page/home_page.dart';
import 'package:facetrip/routes/routes_imports.dart';
import 'package:facetrip/stream_login.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:facetrip/modules/login/presentation/page/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'core/config/db_config.dart';
import 'core/config/firebase_options.dart';

void main() async {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await DbConfi().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      routerConfig: AppRouter().config(),
      /*
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

       */
    );
  }
}
