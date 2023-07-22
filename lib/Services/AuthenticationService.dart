import 'package:chat_task_t2/Controllers/UserController.dart';
import '../globals.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth userCredential = FirebaseAuth.instance;

Future<bool> registerService() async {
  bool result = true;
  try {
    await userCredential.createUserWithEmailAndPassword(
        email: userModel.email, password: userModel.password);
  } on FirebaseAuthException catch (e) {
    result = false;
    if (e.code == 'weak-password') {
      UserController.registerErrorMessage =
          "The password provided is too weak.";
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      UserController.registerErrorMessage =
          "The account already exists for that email.";
      print('The account already exists for that email.');
    } else
      UserController.registerErrorMessage = 'Email format not correct.';
  } catch (e) {
    result = false;
    print(e);
  }
  return result;
}

Future<bool> loginService() async {
  bool result = true;
  try {
    await userCredential.signInWithEmailAndPassword(
        email: userModel.email, password: userModel.password);
  } on FirebaseAuthException catch (e) {
    result = false;
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }
  return result;
}




// CollectionReference users = FirebaseFirestore.instance.collection('Users');

// Future<bool> isEmailExist() async {
//   bool result = true;

//   await users
//       .where('email', isEqualTo: userModel.email)
//       .get()
//       .then((QuerySnapshot querySnapshot) async {
//     if (querySnapshot.docs.length > 0) result = false;
//   }).catchError((err) {
//     result = false;
//   });

//   return result;
// }

// Future<bool> registerService() async {
//   bool result = true;

//   await isEmailExist().then((value) async {
//     if (value) {
//       await users.doc(userModel.email).set(userModel.userToJson());
//       //await getMessagesService();
//     } else {
//       result = false;
//       UserController.registerErrorMessage = "Email is exist...";
//     }
//   });

//   return result;
// }

// Future<bool> loginService() async {
//   bool result = true;

//   await users
//       .where('email', isEqualTo: userModel.email)
//       .where('password', isEqualTo: userModel.hashPassword())
//       .get()
//       .then((QuerySnapshot querySnapshot) async {
//     if (querySnapshot.docs.length == 0) result = false;
//     // else
//     //   await getMessagesService();
//   }).catchError((err) {
//     result = false;
//   });

//   return result;
// }
