import '../../strings/app_strings.dart';

class PassValidator {
  static String? validate(String value) {
    if (value.isEmpty) {
      return AppStrings.passwordMinLength;
    }
    if (value.length < 8) {
      return AppStrings.passwordMinLength;
    }
    if (!value.contains(RegExp(r'[A-Za-z]'))) {
      return AppStrings.passwordMinLetter;
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return AppStrings.passwordMinNumber;
    }
    if (!value.contains(RegExp(r'[!@#%^&*(),.?":{}|<>]'))) {
      return AppStrings.passwordMinSpecialChar;
    }
    return null;
  }
}
