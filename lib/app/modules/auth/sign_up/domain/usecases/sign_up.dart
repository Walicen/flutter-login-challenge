import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../entities/signup.dart';
import '../repositories/sign_up_repository.dart';

abstract class SignUpUseCase {
  Future<Either<Failure, String>> call(Signup signup);
}

class SignUpUseCaseImpl implements SignUpUseCase {
  final SignUpRepository _repository;

  SignUpUseCaseImpl({required SignUpRepository repository}) : _repository = repository;

  @override
  Future<Either<Failure, String>> call(Signup signup) async {
    return await _repository.signUp(signup);
  }
}
