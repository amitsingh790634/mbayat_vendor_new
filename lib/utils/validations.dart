import 'package:mbayat_user_app/Utils/AllExport.dart';
import 'package:mbayat_user_app/utils/Const/appStrings.dart';

class Validations {
  Validations._();

  static final instance = Validations._();

  // Todo Validation for empty fields
  String? emptyField({required String value, required String field}) {
    if (value.trim().isEmpty) {
      return "${AppStrings.pleaseEnter} $field";
    }
    return null;
  }

  // Todo Name validation
  String? nameValidation(String name) {
    if (name.trim().isEmpty) {
      return AppStrings.nameCannotBeEmpty;
    }
    if (name.length < 2) {
      return AppStrings.nameTooShort;
    }
    if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(name)) {
      return AppStrings.nameInvalid;
    }
    return null;
  }

  // Todo Phone number validation
  String? phoneValidation(String value) {
    if (value.trim().isEmpty) {
      return AppStrings.phoneEmpty;
    }
    if (value.length < 7 || value.length > 12) {
      return AppStrings.phoneLengthError;
    }
    if (!RegExp(r'^\d+$').hasMatch(value)) {
      return AppStrings.phoneInvalid;
    }
    return null;
  }

  // Todo OTP validation
  String? otpValidation(String value) {
    if (value.trim().isEmpty) {
      return AppStrings.otpEmpty;
    }
    if (value.length != 6) {
      return AppStrings.otpInvalidLength;
    }
    if (!RegExp(r'^\d+$').hasMatch(value)) {
      return AppStrings.otpInvalid;
    }
    return null;
  }

  // Todo Password validation
  String? passwordValidation(String value) {
    RegExp passwordPattern = RegExp(
      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*()_+{}|:;<>,.?/~`])[A-Za-z\d!@#$%^&*()_+{}|:;<>,.?/~`]{8,}$',
    );
    if (value.trim().isEmpty) {
      return AppStrings.passwordEmpty;
    }
    if (!passwordPattern.hasMatch(value)) {
      return AppStrings.passwordInvalid;
    }
    return null;
  }

  // Todo Confirm password validation
  String? confirmPasswordValidation(String pass1, String pass2) {
    if (pass2.trim().isEmpty) {
      return AppStrings.confirmPasswordEmpty;
    }
    if (pass1 != pass2) {
      return AppStrings.passwordMismatch;
    }
    return null;
  }

  //Todo Email validation
  String? emailValidation(String email) {
    final RegExp emailRegExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (email.trim().isEmpty) {
      return AppStrings.emailEmpty;
    }
    if (!emailRegExp.hasMatch(email)) {
      return AppStrings.emailInvalid;
    }
    return null;
  }

  // Todo Generic form validation
  bool isValidate(GlobalKey<FormState> key) {
    return key.currentState?.validate() ?? false;
  }
}
