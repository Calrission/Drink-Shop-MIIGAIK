bool validateEmail(String email){
  return RegExp(r"[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$").hasMatch(email);
}