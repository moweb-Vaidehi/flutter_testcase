import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testcase/utils/validator.dart';

void main() {
  final fieldValidator = FieldValidator();

  test('Check empty email id', () {
    var result = fieldValidator.validateEmail('');
    expect(result, 'Enter Email');
  });

  test('validate email id', () {
    var result = fieldValidator.validateEmail('abc@gmail.com');
    expect(result, 'Enter Valid Email');
  });

  group('Password check', () {
    test('Check Empty Password', () {
      var result = fieldValidator.validatePassword('');
      expect(result, 'Enter password');
    });

    test('validate Password', () {
      var result = fieldValidator.validatePassword('456868768786');
      expect(result, 'true');
    });
  });
}
