part of 'login_cubit.dart';

sealed class LoginState extends Equatable {
  final AutovalidateMode autovalidateMode;
  final String email;
  final String password;
  const LoginState({
    this.autovalidateMode = AutovalidateMode.disabled,
    this.email = '',
    this.password = '',
  });

  LoginState copyWith({
    AutovalidateMode? autovalidateMode,
    String? email,
    String? password,
  });

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {
  const LoginInitial();
  @override
  LoginState copyWith({AutovalidateMode? autovalidateMode, String? email, String? password}) {
    return const LoginInitial();
  }
}

final class LoginLoading extends LoginState {
  const LoginLoading();
  @override
  LoginState copyWith({AutovalidateMode? autovalidateMode, String? email, String? password}) {
    return const LoginLoading();
  }
}

final class LoginSuccess extends LoginState {
  const LoginSuccess();
  @override
  LoginState copyWith({AutovalidateMode? autovalidateMode, String? email, String? password}) {
    return const LoginSuccess();
  }
}

final class LoginValidator extends LoginState {
  const LoginValidator({
    super.autovalidateMode,
    super.email,
    super.password,
  });

  @override
  LoginValidator copyWith({
    AutovalidateMode? autovalidateMode = AutovalidateMode.disabled,
    String? email = '',
    String? password = '',
  }) {
    return LoginValidator(
      autovalidateMode: autovalidateMode ?? this.autovalidateMode,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [autovalidateMode, email, password];
}

final class LoginError extends LoginState {
  final String message;
  final bool isEmailError;
  final bool isPasswordError;

  const LoginError({
    required this.message,
    this.isEmailError = false,
    this.isPasswordError = false,
  });

  @override
  LoginState copyWith({AutovalidateMode? autovalidateMode, String? email, String? password}) {
    return LoginError(
      message: message,
      isEmailError: isEmailError,
      isPasswordError: isPasswordError,
    );
  }

  @override
  List<Object> get props => [message, isEmailError, isPasswordError];
}
