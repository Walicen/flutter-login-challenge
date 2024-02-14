import 'package:flutter_login_challenge/app/core/errors/failure.dart';
import 'package:flutter_login_challenge/app/modules/auth/login/domain/entities/user_login.dart';
import 'package:flutter_login_challenge/app/modules/auth/login/domain/repositories/login_repository.dart';
import 'package:flutter_login_challenge/app/modules/auth/login/domain/usecases/login_usecase.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';

import '../repositories/login_repository_test.dart';

void main() {
  late final LoginRepository repository;
  late final LoginUseCase usecase;
  late final UserLogin userLogin;
  setUpAll(() {
    repository = MockLoginRepository();
    usecase = LoginUseCaseImpl(repository: repository);
    userLogin =
        const UserLogin(email: 'email', password: 'password', name: '', lastName: '', profile: '');
  });

  group('Login Use Case', () {
    test('should return a UserLogin', () async {
      when(() => repository.doLogin('email', 'password')).thenAnswer((_) async => Right(userLogin));

      final result = await usecase('email', 'password');
      expect(result, Right(userLogin));
    });

    test('should return a Failure', () async {
      when(() => repository.doLogin('email', 'password'))
          .thenAnswer((_) async => const Left(ServerFailure(message: '')));

      final result = await usecase('email', 'password');
      expect(result, const Left(ServerFailure(message: '')));
    });
  });
}
