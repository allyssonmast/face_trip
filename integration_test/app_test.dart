import 'package:facetrip/modules/home/presentation/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:facetrip/main.dart' as app;
import 'package:facetrip/injection.dart' as di;

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockUserCredential extends Mock implements UserCredential {}

class MockUser extends Mock implements User {}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late FirebaseAuth mockFirebaseAuth;
  late UserCredential mockCredential;
  late User mockUser;

  setUp(() async {
    mockUser = MockUser();
    mockFirebaseAuth = MockFirebaseAuth();
    mockCredential = MockUserCredential();
  });

  testWidgets('Teste de login com sucesso', (WidgetTester tester) async {
    // Configurar o estado inicial do aplicativo
    app.main();
    await tester.pumpAndSettle();

    // Configurar o comportamento esperado para o mock do FirebaseAuth
    when(() => mockFirebaseAuth.signInWithEmailAndPassword(
          email: any(named: 'email'),
          password: any(named: 'password'),
        )).thenAnswer((_) async => mockCredential);

    when(() => mockCredential.user).thenReturn(mockUser);

    when(() => mockUser.uid).thenReturn('user-id');

    // Realizar ações de login
    await tester.tap(find.byKey(const Key('emailField')));
    await tester.enterText(
        find.byKey(const Key('emailField')), 'example@example.com');
    await tester.tap(find.byKey(const Key('passwordField')));
    await tester.enterText(find.byKey(const Key('passwordField')), 'password');
    await tester.tap(find.byKey(const Key('loginButton')));

    // Aguardar o término das operações assíncronas
    await tester.pumpAndSettle();

    final home = find.byWidget(const HomePage());

    // Verificar se o usuário está logado com sucesso
    expect(home, findsOneWidget);

    // Limpar os mocks ou realizar outras tarefas de limpeza
    verify(() => mockFirebaseAuth.signInWithEmailAndPassword(
          email: any(named: 'email'),
          password: any(named: 'password'),
        )).called(1);
  });

  testWidgets('Teste de login com falha', (WidgetTester tester) async {
    // Configurar o estado inicial do aplicativo
    app.main();
    await tester.pumpAndSettle();

    // Configurar o comportamento esperado para o mock do FirebaseAuth
    final error = FirebaseAuthException(code: 'invalid-email');
    when(() => mockFirebaseAuth.signInWithEmailAndPassword(
      email: any(named: 'email'),
      password: any(named: 'password'),
    )).thenThrow(error);

    // Realizar ações de login
    await tester.tap(find.byKey(const Key('emailField')));
    await tester.enterText(find.byKey(const Key('emailField')), 'invalid_email');
    await tester.tap(find.byKey(const Key('passwordField')));
    await tester.enterText(find.byKey(const Key('passwordField')), 'password');
    await tester.tap(find.byKey(const Key('loginButton')));

    // Aguardar o término das operações assíncronas
    await tester.pumpAndSettle();

    // Verificar se a mensagem de erro é exibida
    expect(find.text('Email inválido'), findsOneWidget);

    // Limpar os mocks ou realizar outras tarefas de limpeza
    verify(() => mockFirebaseAuth.signInWithEmailAndPassword(
      email: any(named: 'email'),
      password: any(named: 'password'),
    )).called(1);
  });
  tearDown(() {
    // Limpar as instâncias do getIt após cada teste
    di.getIt.reset();
  });
}
