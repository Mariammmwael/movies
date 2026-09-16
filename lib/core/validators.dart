class Validators {
  static final _emailRegex = RegExp(r"^[\w.\-+]+@([\w\-]+\.)+[a-zA-Z]{2,}$");
  static final _passwordRegex = RegExp(r"^(?=.*[A-Za-z])(?=.*\d).{8,}$");

  static String? name(String? value) {
    var name = value?.trim() ?? "";
    if (name.isEmpty) {
      return "name_required";
    }
    if (name.length < 3) {
      return "name_too_short";
    }
    return null;
  }

  static String? email(String? value) {
    var email = value?.trim() ?? "";
    if (email.isEmpty) {
      return "email_required";
    }
    if (!_emailRegex.hasMatch(email)) {
      return "email_invalid";
    }
    return null;
  }

  // Used on sign up, where the password still has to meet our rules.
  static String? newPassword(String? value) {
    var password = value ?? "";
    if (password.isEmpty) {
      return "password_required";
    }
    if (!_passwordRegex.hasMatch(password)) {
      return "password_weak";
    }
    return null;
  }

  // Used on login, where an existing account may predate our rules.
  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return "password_required";
    }
    return null;
  }

  static String? confirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return "confirm_password_required";
    }
    if (value != password) {
      return "password_not_matched";
    }
    return null;
  }
}
