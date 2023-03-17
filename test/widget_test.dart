import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testcase/screens/login_screen.dart';

void main() {
  group('Widget Test', () {
    testWidgets('Test Email', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: LoginDesign()),
      );

      expect(
        find.byType(SetEmailField),
        findsOneWidget,
      );
    });

    testWidgets('TestPassword', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: LoginDesign()));
      Finder passwordField = find.byKey(const Key('password'));
      expect(
        passwordField,
        findsOneWidget,
      );
      await tester.enterText(passwordField, "abc123");
    });

    testWidgets('Test LoginButton', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: LoginDesign()));
      Finder loginButton = find.byKey(const Key('login_btn'));
      expect(
        loginButton,
        findsOneWidget,
      );
    });

    testWidgets('More Test', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: LoginDesign()));
      expect(
        find.byWidget(ListView()),
        findsNothing,
      );
    });
  });
}
