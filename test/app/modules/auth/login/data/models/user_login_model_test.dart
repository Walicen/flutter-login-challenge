import 'package:flutter_login_challenge/app/modules/auth/login/data/models/user_login_model.dart';
import 'package:flutter_login_challenge/app/modules/auth/login/domain/entities/user_login.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late final UserLoginModel tUserLoginModel;
  setUpAll(() {
    tUserLoginModel = const UserLoginModel(
      email: 'email@email.com',
      password: 'password@123',
      name: '',
      lastName: '',
      profile: '',
    );
  });
  group('UserLoginModel', () {
    test('should be a subclass of UserLogin', () {
      expect(tUserLoginModel, isA<UserLogin>());
    });

    test('should return a valid model', () {
      final Map<String, dynamic> jsonMap = {
        "name": "name",
        "lastName": "lastName",
        "email": "email",
        "password": "password",
        "profile": "profile"
      };
      final result = UserLoginModel.fromJson(jsonMap);
      expect(result, isA<UserLoginModel>());
    });

    test('should return a valid json', () {
      final result = tUserLoginModel.toJson();
      final expectedMap = {
        "name": "",
        "lastName": "",
        "email": "email@email.com",
        "password": "password@123",
        "profile": "",
      };
      expect(result, expectedMap);
    });
  });
}
