import 'package:crypt/crypt.dart';

class UserModel {
  String email = "";
  String password = "";
  //String message = "";
  //List<Map<String, String>> messages = [];
  String registerErrorMessage = "";

  Map<String, Object?> userToJson() =>
      {'email': email, 'password': hashPassword()};

  String hashPassword() =>
      Crypt.sha256(password, salt: 'abcdefghijklmnop').toString();
}
