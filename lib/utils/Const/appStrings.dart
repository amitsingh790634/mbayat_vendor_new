// lib/utils/strings.dart

class AppStrings {
  // Todo Validation Error Messages
  static const String nameCannotBeEmpty = "Name cannot be empty";
  static const String pleaseEnter = "Please enter";
  static const String pleaseClickBack = "Please click back again to exit!";
  static const String nameTooShort =
      "Name should be at least 2 characters long";
  static const String nameInvalid =
      "Name should only contain alphabets and spaces";

  static const String phoneEmpty = "Phone number cannot be empty";
  static const String phoneLengthError =
      "Phone number should be between 7 and 12 digits";
  static const String phoneInvalid = "Phone number should only contain digits";

  static const String otpEmpty = "OTP cannot be empty";
  static const String otpInvalidLength = "OTP should be 6 digits long";
  static const String otpInvalid = "OTP should only contain digits";

  static const String passwordEmpty = "Password cannot be empty";
  static const String passwordInvalid =
      "Password must be at least 8 characters long and include uppercase, lowercase, digit, and special character";

  static const String confirmPasswordEmpty = "Confirm password cannot be empty";
  static const String passwordMismatch = "Passwords do not match";

  static const String emailEmpty = "Email cannot be empty";
  static const String emailInvalid = "Email address is not valid";

  // Todo General Strings
  static const String appName = "Agent";
  static const String loading = "Loading...";
  static const String didReceive = "Didn’t receive an OTP ?";
  static const String resendOTP = "Resend OTP";

  // Todo Other Common Strings

  static const String save = "Save";
}
