import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter_login_challenge/app/core/http/custom_http.dart';
import 'package:flutter_login_challenge/app/modules/auth/sign_up/data/datasources/sign_up_datasource.dart';
import 'package:flutter_login_challenge/app/modules/auth/sign_up/data/models/signup_model.dart';
import 'package:flutter_login_challenge/app/modules/auth/sign_up/external/datasource/sign_up_datasource_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../core/http/custom_http_test.dart';

void main() {
  late final CustomHttp client;
  late final SignUpDatasource datasource;
  late final SignupModel model;

  setUpAll(() {
    client = MockCustomHttp();
    datasource = SignUpDatasourceImpl(client: client);
    model = SignupModel(
      name: faker.person.name(),
      lastName: faker.person.lastName(),
      email: faker.internet.email(),
      password: faker.internet.password(),
      profile: 1,
    );
  });

  test('Should be return Success message', () async {
    when(() => client.post(any(), body: model.toJson())).thenAnswer(
      (_) async => Response(
        requestOptions: RequestOptions(),
        data: {"message": "Signup successful"},
        statusCode: 200,
      ),
    );
    final response = await datasource.signUp(model);
    expect(response, isA<String>());
    expect(response, "Signup successful");
  });

  test('Should be return Error message', () async {
    when(() => client.post(any(), body: model.toJson())).thenThrow(
      DioException(
        requestOptions: RequestOptions(),
        error: "Error message",
        response: Response(
          requestOptions: RequestOptions(),
          data: {"message": "Error message"},
          statusCode: 400,
        ),
      ),
    );

    expect(() async => await datasource.signUp(model), throwsA(isA<Exception>()));
  });
}
