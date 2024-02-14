import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../domain/entities/signup.dart';
import '../../domain/repositories/sign_up_repository.dart';
import '../datasources/sign_up_datasource.dart';
import '../models/signup_model.dart';

class SignUpRepositoryImpl implements SignUpRepository {
  final SignUpDatasource _datasource;

  SignUpRepositoryImpl({required SignUpDatasource datasource}) : _datasource = datasource;

  @override
  Future<Either<Failure, String>> signUp(Signup signup) async {
    try {
      final result = await _datasource.signUp(SignupModel.fromEntity(signup));
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
