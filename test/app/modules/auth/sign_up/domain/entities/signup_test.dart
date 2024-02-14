import 'package:faker/faker.dart';
import 'package:flutter_login_challenge/app/modules/auth/sign_up/domain/entities/signup.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late final Signup signup;
  late final String name;
  late final String email;
  late final String password;
  late final String lastName;
  setUpAll(() {
    name = faker.person.name();
    email = faker.internet.email();
    password = faker.internet.password();
    lastName = faker.person.lastName();
    signup = Signup(
      name: name,
      email: email,
      password: password,
      lastName: lastName,
      profile: 1,
    );
  });

  test('should be return a Signup instance', () {
    expect(signup, isA<Signup>());
  });

  test('should be return a name correctly of instance', () {
    expect(signup.name, name);
  });

  test('should be return a email correctly of instance', () {
    expect(signup.email, email);
  });

  test('should be return a password correctly of instance', () {
    expect(signup.password, password);
  });

  test('should be return a lastName correctly of instance', () {
    expect(signup.lastName, lastName);
  });

  test('should be return a profile correctly of instance', () {
    expect(signup.profile, 1);
  });

  test('Should be return props', () {
    expect(signup.props, [name, lastName, email, password,1]);
  });

  //test copyWith
  test('should be return a new instance of Signup', () {
    final newSignup = signup.copyWith(name: 'newName');
    expect(newSignup, isA<Signup>());
  });
}
