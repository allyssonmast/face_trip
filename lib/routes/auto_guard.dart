import 'package:auto_route/auto_route.dart';
import 'package:facetrip/injection.dart';
import 'package:facetrip/routes/routes_imports.gr.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // the navigation is paused until resolver.next() is called with either
    // true to resume/continue navigation or false to abort navigation
    var firebaseAuth = getIt<FirebaseAuth>();

    firebaseAuth.authStateChanges().listen((user) {
      if (user == null) {
        router.push(const LoginPageRoute());
      } else {
        return resolver.next();
      }
    });
  }
}
