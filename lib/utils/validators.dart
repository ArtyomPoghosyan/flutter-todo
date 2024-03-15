String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return "Password is required";
  }
  return null;
}

String? usernameValidators(String? value) {
  if (value == null || value.isEmpty) {
    return "Username is required";
  }
  return null;
}

String? confirmPasswordValidator(String? value, passwordController) {
  if (value != passwordController.text || value == null || value.isEmpty) {
    return "Password didn't match";
  }
  return null;
}
