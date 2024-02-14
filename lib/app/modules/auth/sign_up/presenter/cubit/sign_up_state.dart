part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState extends Equatable {
  final AutovalidateMode autovalidateMode;
  final String name;
  final String lastName;
  final String email;
  final String password;
  final String confirmPassword;
  final int profile;
  final SignUpStatus status;
  final String message;

  final List<String> profiles;

  const SignUpState({
    this.name = '',
    this.lastName = '',
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
    this.profile = 2,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.profiles = const [],
    this.status = SignUpStatus.running,
    this.message = '',
  });

  SignUpState copyWith({
    String? name,
    String? lastName,
    String? email,
    String? password,
    String? confirmPassword,
    int? profile,
    List<String>? profiles,
    AutovalidateMode? autovalidateMode,
    SignUpStatus? status,
    String? message,
  });

  @override
  List<Object> get props => [
        name,
        lastName,
        email,
        password,
        confirmPassword,
        profile,
        profiles,
        autovalidateMode,
        status,
        message,
      ];
}

final class SignUpUpdate extends SignUpState {
  const SignUpUpdate({
    super.name,
    super.lastName,
    super.email,
    super.password,
    super.confirmPassword,
    super.profile,
    super.autovalidateMode,
    super.profiles,
    super.status,
    super.message,
  });

  @override
  SignUpState copyWith({
    String? name,
    String? lastName,
    String? email,
    String? password,
    String? confirmPassword,
    int? profile,
    List<String>? profiles,
    AutovalidateMode? autovalidateMode,
    SignUpStatus? status,
    String? message,
  }) {
    return SignUpUpdate(
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      profile: profile ?? this.profile,
      profiles: profiles ?? this.profiles,
      autovalidateMode: autovalidateMode ?? this.autovalidateMode,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }
}

enum SignUpStatus { loading, success, error, running }
