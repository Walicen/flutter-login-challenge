import 'package:dio/dio.dart';
import 'package:faker/faker.dart';

import 'package:flutter_login_challenge/app/core/http/custom_http.dart';
import 'package:flutter_login_challenge/app/modules/auth/login/data/datasources/login_datasource.dart';
import 'package:flutter_login_challenge/app/modules/auth/login/data/models/user_login_model.dart';
import 'package:flutter_login_challenge/app/modules/auth/login/external/login_datasource_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../core/http/custom_http_test.dart';

void main() {
  late final CustomHttp customHttp;
  late final LoginDatasource loginDatasource;
  late final UserLoginModel userLoginModel;
  late final String email;
  late final String password;
  setUpAll(() {
    customHttp = MockCustomHttp();
    email = faker.internet.email();
    password = faker.internet.password();
    userLoginModel =
        UserLoginModel(email: email, password: password, name: '', lastName: '', profile: '');
    loginDatasource = LoginDatasourceImpl(client: customHttp);
  });

  group('CustomHttp', () {
    test('should be return a UserLoginModel', () async {
      when(() => customHttp.post(any(), body: {"email": email, "password": password}))
          .thenAnswer((_) async => Response(
                requestOptions: RequestOptions(path: ''),
                data: userLoginModel.toJson(),
                statusCode: 200,
              ));
      final response = await loginDatasource.doLogin(email, password);
      expect(response, isA<UserLoginModel>());
    });

    test('should be return a valid response', () async {
      when(() => customHttp.get('url')).thenAnswer((_) async => 'response');
      final result = await customHttp.get('url');
      expect(result, 'response');
    });
  });
}
