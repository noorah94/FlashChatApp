class UserController {
  static String registerErrorMessage = "";

  // static bool checkEmail() {
  //   userModel.email = userModel.email.trim().toLowerCase();
  //   return RegExp(
  //           r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
  //       .hasMatch(userModel.email);
  // }

  // static bool checkPassword() => (userModel.password.length >= 6);

  // static Future<bool> userLogin() async {
  //   bool checkedEmail = checkEmail();
  //   bool checkedPassword = checkPassword();

  //   if (checkedEmail && checkedPassword) return await loginService();

  //   return false;
  // }

  // static Future<bool> userRegister() async {
  //   if (!checkEmail()) {
  //     registerErrorMessage = "Email format not correct.";
  //     return false;
  //   }
  //   if (!checkPassword()) {
  //     registerErrorMessage = "Password less then 6 characters";
  //     return false;
  //   }

  //   return await registerService();
  // }
}
