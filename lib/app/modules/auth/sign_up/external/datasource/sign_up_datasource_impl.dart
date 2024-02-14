import 'package:dio/dio.dart';

import '../../../../../core/http/custom_http.dart';
import '../../data/datasources/sign_up_datasource.dart';
import '../../data/models/signup_model.dart';

class SignUpDatasourceImpl implements SignUpDatasource {
  final CustomHttp _client;

  SignUpDatasourceImpl({required CustomHttp client}) : _client = client;
  @override
  Future<String> signUp(SignupModel signupModel) async {
    try {
      final response = await _client.post(
        '/signup',
        body: signupModel.toJson(),
      );
      return response.data['message'];
    } on DioException catch (e) {
      throw Exception(e.response?.data['message']);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
