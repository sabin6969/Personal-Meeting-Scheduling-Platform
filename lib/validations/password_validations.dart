bool isStrongPassword(String password) {
  final RegExp passwordRegex = RegExp(
      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^&*()_+{}|[\]:";<>,.?~\\-]).{6,}$');

  return passwordRegex.hasMatch(password);
}

class PasswordValidation {
  static validatePassword(String password) {
    if (password.isEmpty) {
      return "This field is required";
    } else {
      return null;
    }
  }
}
