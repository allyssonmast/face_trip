import 'package:flutter/material.dart';

import 'routes/routes_imports.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.greenAccent),
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
