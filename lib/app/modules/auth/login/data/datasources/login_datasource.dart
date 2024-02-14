import '../models/user_login_model.dart';

abstract class LoginDatasource {
  Future<UserLoginModel> doLogin(String email, String password);
}
