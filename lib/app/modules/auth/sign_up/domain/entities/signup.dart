import 'package:equatable/equatable.dart';

class Signup extends Equatable {
  final String name;
  final String lastName;
  final String email;
  final String password;

  final int profile;

  const Signup({
    required this.name,
    required this.lastName,
    required this.email,
    required this.password,
    required this.profile,
  });

  copyWith({
    String? name,
    String? lastName,
    String? email,
    String? password,
    String? confirmPassword,
    int? profile,
  }) {
    return Signup(
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      profile: profile ?? this.profile,
    );
  }

  @override
  List<Object> get props => [
        name,
        lastName,
        email,
        password,
        profile,
      ];
}
