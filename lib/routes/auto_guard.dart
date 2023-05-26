import 'package:auto_route/auto_route.dart';
import 'package:facetrip/injection.dart';
import 'package:facetrip/routes/routes_imports.gr.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    var firebaseAuth = getIt<FirebaseAuth>();
    if (firebaseAuth.currentUser == null) {
      router.push(const LoginPageRoute());
    } else {
      resolver.next();
    }
  }
}
