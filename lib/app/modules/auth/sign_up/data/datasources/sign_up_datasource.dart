import '../models/signup_model.dart';

abstract class SignUpDatasource {
  Future<String> signUp(SignupModel signupModel);
}
