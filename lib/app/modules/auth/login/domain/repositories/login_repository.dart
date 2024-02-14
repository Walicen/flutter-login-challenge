import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../entities/user_login.dart';

abstract class LoginRepository {
  Future<Either<Failure, UserLogin>> doLogin(String email, String password);
}
