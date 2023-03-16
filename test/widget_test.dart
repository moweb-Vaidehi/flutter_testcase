import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testcase/login_screen.dart';

void main() {
  group('Widget Test', () {
    testWidgets('Test Email', (WidgetTester tester) async {
      await tester.pumpWidget(
        const LoginDesign(),
      );
      expect(
        find.byType(SetEmailField),
        findsOneWidget,
      );
    });

    testWidgets('TestPassword', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: LoginDesign()));
      Finder passwordField = find.byKey(const Key('password'));
      await tester.enterText(passwordField, "abc123");
    });

    testWidgets('Test LoginButton', (WidgetTester tester) async {
      Finder loginButton = find.byKey(const Key('login_btn'));
      await tester.tap(loginButton);
      await tester.pump();
    });
  });
}
