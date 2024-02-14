import 'package:dartz/dartz.dart';
import 'package:flutter_login_challenge/app/core/errors/failure.dart';
import 'package:flutter_login_challenge/app/modules/auth/login/data/datasources/login_datasource.dart';
import 'package:flutter_login_challenge/app/modules/auth/login/domain/entities/user_login.dart';
import 'package:flutter_login_challenge/app/modules/auth/login/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDatasource _datasource;

  LoginRepositoryImpl({required LoginDatasource datasource}) : _datasource = datasource;
  @override
  Future<Either<Failure, UserLogin>> doLogin(String email, String password) async {
    try {
      final result = await _datasource.doLogin(email, password);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
