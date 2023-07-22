import 'package:chat_task_t2/models/MessageModel.dart';
import 'package:flutter/material.dart';
import '../globals.dart';
//import '../globals.dart';

class MessageText extends StatelessWidget {
  MessageText({super.key, required this.message, required this.nextEmail});
  MessageModel message;
  String nextEmail;

  String getEmailText() => (message.email == nextEmail) ? '' : message.email;

  @override
  Widget build(BuildContext context) {
    //var message = message;
    Color userColor = Colors.blue;
    Color senderColor = Colors.black26;
    bool isUserEmail = message.email == userModel.email;

    return Column(
      children: [
        Text(getEmailText()),
        Row(
          mainAxisAlignment:
              isUserEmail ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(13),
              decoration: BoxDecoration(
                color: isUserEmail ? userColor : senderColor,
                border: Border.all(
                  width: 0,
                  color: isUserEmail ? userColor : senderColor,
                ),
                borderRadius: BorderRadius.only(
                  topRight:
                      isUserEmail ? Radius.circular(0) : Radius.circular(40.0),
                  bottomRight: Radius.circular(40.0),
                  topLeft:
                      isUserEmail ? Radius.circular(40.0) : Radius.circular(0),
                  bottomLeft: Radius.circular(40.0),
                ),
              ),
              child: Text(
                "${message.message}",
                //textAlign: TextAlign.left,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
