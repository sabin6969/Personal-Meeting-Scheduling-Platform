bool isEmailValid(String email) {
  final RegExp emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  return emailRegex.hasMatch(email);
}

class EmailValidation {
  static validateEmail(String email) {
    if (email.isEmpty) {
      return "This field is required";
    } else if (!isEmailValid(email)) {
      return "Enter a valid email";
    } else {
      return null;
    }
  }
}
