import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../globals.dart';
//import '../models/MessageModel.dart';

CollectionReference messages =
    FirebaseFirestore.instance.collection('Messages');

Future<void> addUserMessageService(String message) async {
  await messages
      .doc("${DateTime.now()}")
      .set(json.decode(messageController.messageToJson(message)));
}

//JSON.parse(messageController.messageToJson(message)

// Future<void> getMessagesService() async {
//   await messages
//       .orderBy('time', descending: true)
//       .get()
//       .then((QuerySnapshot querySnapshot) {
//     messageModels = [];
//     querySnapshot.docs.forEach((element) {
//       messageModels.add(
//           MessageModel(element['email'], element['message'], element['time']));
//     });
//   });
// }
