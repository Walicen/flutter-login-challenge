import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_login_challenge/app/core/errors/failure.dart';
import 'package:flutter_login_challenge/app/modules/auth/sign_up/domain/entities/signup.dart';
import 'package:flutter_login_challenge/app/modules/auth/sign_up/domain/repositories/sign_up_repository.dart';
import 'package:flutter_login_challenge/app/modules/auth/sign_up/domain/usecases/sign_up.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../repositories/sign_up_repository_test.dart';

void main() {
  late final SignUpUseCase usecase;
  late final SignUpRepository repository;
  late final Signup signup;
  setUpAll(() {
    signup = Signup(
      name: faker.person.name(),
      email: faker.internet.email(),
      password: faker.internet.password(),
      lastName: faker.person.lastName(),
      profile: 1,
    );
    repository = MockSignUpRepository();
    usecase = SignUpUseCaseImpl(repository: repository);
  });

  group('SignUpUseCase', () {
    test('should be return a Message after Sucess', () async {
      when(() => repository.signUp(signup)).thenAnswer((_) async => const Right('Sucess'));
      final response = await usecase(signup);
      expect(response, isA<Right>());
      expect(response.fold(id, id), isA<String>());
    });

    test('should be return a Failure after Error', () async {
      when(() => repository.signUp(signup))
          .thenAnswer((_) async => const Left(ServerFailure(message: 'Error')));
      final response = await usecase(signup);
      expect(response, isA<Left>());
      expect(response.fold(id, id), isA<Failure>());
    });
  });
}
