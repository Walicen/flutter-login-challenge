import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/login_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._useCase) : super(const LoginInitial());

  final LoginUseCase _useCase;

  void doLogin({required String email, required String password}) async {
    emit(const LoginLoading());

    final result = await _useCase(email, password);
    emit(result.fold(
      (error) => LoginError(message: error.message),
      (user) => const LoginSuccess(),
    ));
  }

  void updateEmail(String? email) {
    emit(state.copyWith(email: email));
  }

  void updatePassword(String? password) {
    emit(state.copyWith(password: password));
  }
}
