const minNameLength = 3;
const maxNameLength = 64;

bool validateName(String value) {
  final name = value.trim();

  return name.length >= minNameLength && name.length <= maxNameLength;
}

bool validateEmail(String value) {
  final email = value.trim();

  return email.contains('@') && email.contains('.');
}

bool validatePassword(String value) {
  final password = value.trim();

  final regex = RegExp(r'^(?=.*[A-Z])(?=.*\d)[a-zA-Z\d\w\W]{6,}$');

  return regex.hasMatch(password);
}

bool validateRepeatPassword({
  required String password,
  required String repeatPassword,
}) {
  return password.trim() == repeatPassword.trim();
}
