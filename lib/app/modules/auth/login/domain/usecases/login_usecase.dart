import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../entities/user_login.dart';
import '../repositories/login_repository.dart';

abstract class LoginUseCase {
  Future<Either<Failure, UserLogin>> call(String email, String password);
}

class LoginUseCaseImpl implements LoginUseCase {
  final LoginRepository _repository;

  LoginUseCaseImpl({required LoginRepository repository}) : _repository = repository;
  @override
  Future<Either<Failure, UserLogin>> call(String email, String password) async {
    return await _repository.doLogin(email, password);
  }
}
