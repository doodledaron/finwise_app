bool validateEmailAddress(String input) {
  const emailRegrex  = 
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  if (RegExp(emailRegrex).hasMatch(input)) {
    return true;
  } else {
    return false;
  }
}