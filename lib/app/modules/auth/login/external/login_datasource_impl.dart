import '../../../../core/http/custom_http.dart';
import '../data/datasources/login_datasource.dart';
import '../data/models/user_login_model.dart';

class LoginDatasourceImpl implements LoginDatasource {
  final CustomHttp _client;

  LoginDatasourceImpl({required CustomHttp client}) : _client = client;
  @override
  Future<UserLoginModel> doLogin(String email, String password) async {
    try {
      final response = await _client.post(
        '/login',
        body: {'email': email, 'password': password},
      );
      return UserLoginModel.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }
}
