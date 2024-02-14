import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/signup.dart';
import '../../domain/usecases/sign_up.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this._useCase) : super(const SignUpUpdate()) {
    emit(state.copyWith(profiles: ['Admin', 'User'], profile: 1));
  }

  final SignUpUseCase _useCase;

  void signUp() async {
    emit(state.copyWith(status: SignUpStatus.loading));
    final result = await _useCase(Signup(
      name: state.name,
      lastName: state.lastName,
      email: state.email,
      password: state.password,
      profile: state.profile,
    ));
    result.fold(
      (error) {
        emit(state.copyWith(status: SignUpStatus.error, message: error.message));
      },
      (success) {
        emit(state.copyWith(status: SignUpStatus.success, message: success));
      },
    );
  }

  void nameChanged(String value) {
    emit(state.copyWith(name: value));
  }

  void lastNameChanged(String value) {
    emit(state.copyWith(lastName: value));
  }

  void emailChanged(String value) {
    emit(state.copyWith(email: value));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value));
  }

  void confirmPasswordChange(String value) {
    emit(state.copyWith(confirmPassword: value));
  }

  void profileChanged(int value) {
    emit(state.copyWith(profile: value));
  }

  void autoValidate() {
    emit(state.copyWith(autovalidateMode: AutovalidateMode.always));
  }
}
