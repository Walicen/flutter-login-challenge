import '../../domain/entities/signup.dart';

class SignupModel extends Signup {
  const SignupModel({
    required super.name,
    required super.lastName,
    required super.email,
    required super.password,
    required super.profile,
  });

  factory SignupModel.fromJson(Map<String, dynamic> json) {
    return SignupModel(
      name: json['name'],
      lastName: json['lastName'],
      email: json['email'],
      password: json['password'],
      profile: json['profile'],
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

  factory SignupModel.fromEntity(Signup entity) {
    return SignupModel(
      name: entity.name,
      lastName: entity.lastName,
      email: entity.email,
      password: entity.password,
      profile: entity.profile,
    );
  }
}
