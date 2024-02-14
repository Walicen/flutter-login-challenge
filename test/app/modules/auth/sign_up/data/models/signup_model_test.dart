import 'package:flutter_login_challenge/app/modules/auth/sign_up/data/models/signup_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late final SignupModel signup;

  setUpAll(() {
    signup = const SignupModel(
      name: 'name',
      email: 'email',
      password: 'password',
      lastName: 'lastName',
      profile: 1,
    );
  });

  test('should be return a SignupModel instance', () {
    expect(signup, isA<SignupModel>());
  });

  test('should be return a SignupModel instance from json', () {
    final json = {
      'name': 'name',
      'email': 'email',
      'password': 'password',
      'lastName': 'lastName',
      'profile': 1,
    };
    final result = SignupModel.fromJson(json);
    expect(result, isA<SignupModel>());
  });

  test('should be return a Map<String, dynamic> instance from toJson', () {
    final result = signup.toJson();
    expect(result, isA<Map<String, dynamic>>());
  });
}
