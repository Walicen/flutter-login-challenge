import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_login_challenge/app/core/errors/failure.dart';
import 'package:flutter_login_challenge/app/modules/auth/sign_up/data/datasources/sign_up_datasource.dart';
import 'package:flutter_login_challenge/app/modules/auth/sign_up/data/models/signup_model.dart';
import 'package:flutter_login_challenge/app/modules/auth/sign_up/data/repository/sign_up_repository_impl.dart';

import 'package:flutter_login_challenge/app/modules/auth/sign_up/domain/repositories/sign_up_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../datasources/sign_up_datasource_test.dart';

void main() {
  late final SignUpDatasource datasource;

  late final SignupModel model;
  late final SignUpRepository repository;
  setUpAll(() {
    datasource = MockSignUpDatasource();
    repository = SignUpRepositoryImpl(datasource: datasource);
    model = SignupModel(
      name: faker.person.name(),
      email: faker.internet.email(),
      password: faker.internet.password(),
      lastName: faker.person.lastName(),
      profile: 1,
    );
  });

  group('SignUpRepository', () {
    test('should be return a Message after Sucess', () async {
      when(() => datasource.signUp(model)).thenAnswer((_) async => 'Sucess');
      final response = await repository.signUp(model);
      expect(response, isA<Right>());
      expect(response.fold(id, id), isA<String>());
    });

    test('should be return a Failure after Error', () async {
      when(() => datasource.signUp(model)).thenThrow(Exception('Error'));
      final response = await repository.signUp(model);
      expect(response, isA<Left>());
      expect(response.fold(id, id), isA<Failure>());
    });
  });
}
