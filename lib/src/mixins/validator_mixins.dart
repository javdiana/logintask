class ValidatorMixin {
  String validateEmail(String value) {
    if(!value.contains('@')) {
      return 'Please, enter a valid email';
    }
    return null;
  }

  String valdatePassword(String value) {
    if(value.length < 4) {
      return 'Password must be at least 4 characters';
    }
  }
}