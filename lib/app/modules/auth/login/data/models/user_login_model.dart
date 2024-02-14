import '../../domain/entities/user_login.dart';

class UserLoginModel extends UserLogin {
  const UserLoginModel({
    required super.name,
    required super.lastName,
    required super.email,
    required super.profile,
    super.password = '',
    super.message = '',
  });

  factory UserLoginModel.fromJson(Map<String, dynamic> json) {
    return UserLoginModel(
      name: json['name'],
      lastName: json['lastName'],
      email: json['email'],
      message: json['message'] ?? '',
      profile: json['profile'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'lastName': lastName,
      'email': email,
      'password': password,
      'profile': profile,
    };
  }

  UserLoginModel copyWith({
    String? name,
    String? lastName,
    String? email,
    String? password,
    String? message,
    String? profile,
  }) {
    return UserLoginModel(
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      message: message ?? this.message,
      profile: profile ?? this.profile,
    );
  }
}
