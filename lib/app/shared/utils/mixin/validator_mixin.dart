import '../../strings/app_strings.dart';

mixin Validator {
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.emailRequired;
    } else if (!RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(value)) {
      return AppStrings.emailInvalid;
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
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

  String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return AppStrings.confirmPasswordRequired;
    } else if (value != password) {
      return AppStrings.confirmPasswordNotMatch;
    }
    return null;
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.nameRequired;
    }
    return null;
  }

  String? validateLastName(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.lastNameRequired;
    }
    return null;
  }
}
