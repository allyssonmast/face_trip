import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:facetrip/main.dart' as app;
import 'package:facetrip/injection.dart' as di;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {});

  testWidgets('Teste de login com sucesso', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await tester.tap(find.byKey(const Key('emailField')));
    await tester.enterText(
        find.byKey(const Key('emailField')), 'example@example.com');
    await tester.tap(find.byKey(const Key('passwordField')));
    await tester.enterText(find.byKey(const Key('passwordField')), 'password');
    await tester.tap(find.byKey(const Key('loginButton')));

    await tester.pumpAndSettle();

    final home = find.byKey(const Key('home_page'));

    expect(home, findsOneWidget);
  });

  testWidgets('Teste de login com falha', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('emailField')));
    await tester.enterText(
        find.byKey(const Key('emailField')), 'invalid_email@hotmail.com');
    await tester.tap(find.byKey(const Key('passwordField')));
    await tester.enterText(find.byKey(const Key('passwordField')), 'password');
    await tester.tap(find.byKey(const Key('loginButton')));

    await tester.pumpAndSettle();

    expect(find.byKey(const Key('error_snacl')), findsOneWidget);
  });
  tearDown(() async {
    await FirebaseAuth.instance.signOut();
    di.getIt.reset();
  });
}
