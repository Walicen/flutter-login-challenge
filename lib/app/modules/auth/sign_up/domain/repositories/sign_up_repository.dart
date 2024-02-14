import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../entities/signup.dart';

abstract class SignUpRepository {
  Future<Either<Failure, String>> signUp(Signup signup);
}
