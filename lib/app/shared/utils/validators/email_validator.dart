import '../../strings/app_strings.dart';

class EmailValidator {
  static String? validate(String value) {
    if (value.isEmpty) {
      return AppStrings.emailRequired;
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return AppStrings.emailInvalid;
    }
    return null;
  }
}
