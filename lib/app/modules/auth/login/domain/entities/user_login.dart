import 'package:equatable/equatable.dart';

class UserLogin extends Equatable {
  final String name;
  final String lastName;
  final String email;
  final String password;
  final String message;
  final String profile;

  const UserLogin({
    required this.name,
    required this.lastName,
    required this.email,
    required this.profile,
    this.password = '',
    this.message = '',
  });

  @override
  List<Object> get props => [email, password, message, name, lastName];
}
