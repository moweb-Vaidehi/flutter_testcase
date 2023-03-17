import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testcase/screens/home_screen.dart';
import 'package:flutter_testcase/screens/login_screen.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('e2e Test', () {
    testWidgets('should show login screen', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: LoginDesign()));

      // Ensure that all fields are available
      expect(find.text('Login'), findsWidgets);
      expect(find.text('Email'), findsOneWidget);
      expect(find.byKey(const Key('password')), findsOneWidget);
      expect(find.byKey(const Key('login_btn')), findsOneWidget);
    });

    testWidgets('should navigate to home screen after login',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: LoginDesign()));

      final emailField = find.byType(SetEmailField);
      await tester.enterText(emailField, 'test_user@gmail.com');

      await tester.enterText(find.byKey(const Key('password')), 'Abc@123');

      await tester.tap(find.byKey(const Key('login_btn')));

      await tester.pumpAndSettle();

      // Wait for one second (Faking delay)
      await Future.delayed(const Duration(seconds: 2));

      // Navigate to the home screen
      expect(find.byType(HomeScreen), findsOneWidget);
    });
  });
}
