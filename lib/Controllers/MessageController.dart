import 'package:chat_task_t2/globals.dart';

class MessageController {
  messageToJson(String message) => '''
  {
   "email": "${userModel.email}",
    "time": "${DateTime.now()}",
    "message": "$message"
  }
  ''';

  // Map<String, Object?> messageToJson(String message) => {
  //       'email': userModel.email,
  //       'time': '${DateTime.now()}',
  //       'message': message,
  //     };
}
