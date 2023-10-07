class NameValidator {
  static validateName(String name) {
    if (name.isEmpty) {
      return "This field is required";
    } else {
      return null;
    }
  }
}
