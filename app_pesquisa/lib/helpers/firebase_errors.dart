String getErrorString(String code){
  switch (code) {
    case 'ERROR_WEAK_PASSWORD':
      return 'Weak Password.';
    case 'ERROR_INVALID_EMAIL':
      return 'Invalid E-mail.';
    case 'ERROR_EMAIL_ALREADY_IN_USE':
      return 'E-mail already taken.';
    case 'ERROR_INVALID_CREDENTIAL':
      return 'Invalid E-mail.';
    case 'ERROR_WRONG_PASSWORD':
      return 'Incorrect Password.';
    case 'ERROR_USER_NOT_FOUND':
      return 'User not found.';
    case 'ERROR_USER_DISABLED':
      return 'Disabled User.';
    case 'ERROR_TOO_MANY_REQUESTS':
      return 'Too many requests, try again later.';
    case 'ERROR_OPERATION_NOT_ALLOWED':
      return 'Operation Denied.';

    default:
      return 'Undefined error.';
  }
}