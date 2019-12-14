class FormValidate {
  String validateUsername(String values) {
    if (values.isEmpty) {
      return 'username is required';
    } else {
      return null;
    }
  }

  String validatePassword(String values) {
    if (values.isEmpty) {
      return 'Password is required';
    } else {
      return null;
    }
  }
}
