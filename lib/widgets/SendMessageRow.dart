import 'package:flutter/material.dart';
import '../Services/MessageService.dart';

class SendMessageRow extends StatelessWidget {
  SendMessageRow({
    super.key,
  });
  final messageHolder = TextEditingController();
  String message = "";

  addMessage() async {
    await addUserMessageService(message);
    message = '';
  }

  sendMessage(BuildContext context) {
    if (message != '') {
      addMessage();
      messageHolder.clear();
    } else
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Can\'t send empty message...'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'ok'),
              child: const Text('ok'),
            ),
          ],
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: 3, color: Colors.lightBlue.shade600),
          //bottom: BorderSide(width: 16.0, color: Colors.lightBlue.shade900),
        ),
        color: Colors.white,
      ),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: TextField(
                controller: messageHolder,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  hintText: 'Enter Message',
                ),
                onChanged: (value) => message = value),
          ),
          TextButton(
              onPressed: () => sendMessage(context), child: const Text('Send')),
        ],
      ),
    );
  }
}
