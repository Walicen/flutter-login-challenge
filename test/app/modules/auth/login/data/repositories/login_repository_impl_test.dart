import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_login_challenge/app/core/errors/failure.dart';
import 'package:flutter_login_challenge/app/modules/auth/login/data/datasources/login_datasource.dart';
import 'package:flutter_login_challenge/app/modules/auth/login/data/models/user_login_model.dart';
import 'package:flutter_login_challenge/app/modules/auth/login/data/repositories/login_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../datasources/login_datasource_test.dart';

void main() {
  late final LoginDatasource loginDatasource;
  late final LoginRepositoryImpl loginRepositoryImpl;
  late final String email;
  late final String password;

  setUpAll(() {
    loginDatasource = MockLoginDatasource();
    loginRepositoryImpl = LoginRepositoryImpl(datasource: loginDatasource);
    email = faker.internet.email();
    password = faker.internet.password();
  });

  group('LoginRepositoryImpl', () {
    test('should be return UserLoginModel', () async {
      when(() => loginDatasource.doLogin(email, password)).thenAnswer((_) async => UserLoginModel(
          email: faker.internet.email(),
          password: faker.internet.password(),
          name: '',
          lastName: '',
          profile: ''));
      final result = await loginRepositoryImpl.doLogin(email, password);
      expect(result, isA<Right>());

      final userLogin = result.fold((l) => null, (r) => r);
      expect(userLogin, isA<UserLoginModel>());
    });

    test('should be return ServerFailure', () async {
      when(() => loginDatasource.doLogin(email, password)).thenThrow(Exception());
      final result = await loginRepositoryImpl.doLogin(email, password);
      expect(result, isA<Left>());

      final failure = result.fold((l) => l, (r) => null);
      expect(failure, isA<ServerFailure>());
    });
  });
}
