import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../globals.dart';
import '../models/MessageModel.dart';
import 'MessageText.dart';

class MessagesList extends StatefulWidget {
  MessagesList({super.key});

  @override
  State<MessagesList> createState() => _MessagesListState();
}

class _MessagesListState extends State<MessagesList> {
  String currentEmail = "";
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('Messages')
      .orderBy('time', descending: true)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // height: MediaQuery.of(context).size.height * 0.7,
      child: StreamBuilder<QuerySnapshot>(
          stream: _usersStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              List<QueryDocumentSnapshot> data = snapshot.data!.docs;
              messageModels = [];
              data.forEach((element) => messageModels.add(MessageModel(
                  element['email'], element['message'], element['time'])));

              return ListView.builder(
                reverse: true,
                shrinkWrap: false,
                itemCount: snapshot.data!.size,
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                itemBuilder: (context, index) {
                  return MessageText(
                      message: messageModels[index],
                      nextEmail: (index + 1) != messageModels.length
                          ? messageModels[index + 1].email
                          : '');
                },
              );
            } else {
              return Text("Loading...");
            }
          }),
    );
  }
}


// SizedBox(
//       height: MediaQuery.of(context).size.height * 0.7,
//       child: StreamBuilder<QuerySnapshot>(
//         stream: _usersStream,
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.hasError) {
//             return Text('Something went wrong');
//           }

//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Text("Loading");
//           }

//           return ListView(
//             reverse: true,
//             shrinkWrap: false,
//             children: snapshot.data!.docs.map((DocumentSnapshot document) {
//               Map<String, dynamic> data =
//                   document.data()! as Map<String, dynamic>;
//               return ListTile(
//                 title: Text(data['message']),
//                 //  subtitle: Text(data['company']),
//               );
//             }).toList(),
//           );
//         },
//       ),
//     );


// SizedBox(
//       height: MediaQuery.of(context).size.height * 0.7,
//       child: ListView.builder(
//         reverse: true,
//         itemCount: messageModels.length,
//         shrinkWrap: false,
//         padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
//         itemBuilder: (context, index) {
//           return MessageText(
//               message: messageModels[index],
//               nextEmail: (index + 1) != messageModels.length
//                   ? messageModels[index + 1].email
//                   : '');
//         },
//       ),
//     );
