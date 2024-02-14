import 'package:faker/faker.dart';
import 'package:flutter_login_challenge/app/modules/auth/login/domain/entities/user_login.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late final UserLogin userLogin;
  late final String name;
  late final String email;
  late final String password;
  late final String lastName;

  setUpAll(() {
    name = faker.person.name();
    email = faker.internet.email();
    password = faker.internet.password();
    lastName = faker.person.lastName();

    userLogin = UserLogin(
      email: email,
      password: password,
      name: name,
      lastName: lastName,
      profile: '1',
    );
  });
  test('should be return a UserLogin instance', () {
    expect(userLogin, isA<UserLogin>());
  });

  test('should be return a email correctly of instance', () {
    expect(userLogin.email, email);
  });

  test('should be return a password correctly of instance', () {
    expect(userLogin.password, password);
  });

  test('should be return a name correctly of instance', () {
    expect(userLogin.name, name);
  });

  test('should be return a lastName correctly of instance', () {
    expect(userLogin.lastName, lastName);
  });

  test('should be return a profile correctly of instance', () {
    expect(userLogin.profile, '1');
  });

  test('Should be return props', () {
    expect(userLogin.props, [email, password, '', name, lastName]);
  });
}
