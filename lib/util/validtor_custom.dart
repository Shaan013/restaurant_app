import 'package:form_field_validator/form_field_validator.dart';

class LYDPhoneValidator extends TextFieldValidator {
  final String mobileInvalid;
  final String emailInvalid;

  LYDPhoneValidator({
    String errorText = 'Enter a valid LYD phone number',
    this.mobileInvalid = 'Enter a valid phone number',
    this.emailInvalid = 'Enter a valid email',
  }) : super(errorText);

  final String emailPattern =
      r"^[a-zA-Z0-9.!#$%&'*+\-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+$";

  final String mobilePattern = r"^(?:[+0]9)?[0-9]{10,12}$";

  @override
  bool get ignoreEmptyValues => false;

  @override
  bool isValid(String? value) {
    if (value == null || value.trim().isEmpty) return false;

    final input = value.trim();

    if (input.contains("@")) {
      return RegExp(emailPattern).hasMatch(input);
    } else {
      return RegExp(mobilePattern).hasMatch(input);
    }
  }

  @override
  String? call(String? value) {
    if (value == null || value.trim().isEmpty) return errorText;

    final input = value.trim();

    if (input.contains("@")) {
      return RegExp(emailPattern).hasMatch(input) ? null : emailInvalid;
    } else {
      return RegExp(mobilePattern).hasMatch(input) ? null : mobileInvalid;
    }
  }
}
