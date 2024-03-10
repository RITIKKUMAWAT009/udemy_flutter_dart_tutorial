mixin ValidatorMixin {
  String? passwordValidation(value) {
    if (value!.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  String? emailValidatoin(value) {
    if (!value!.contains('@')) {
      return 'Please enter a valid email address';
    }
    return null;
  }
}
