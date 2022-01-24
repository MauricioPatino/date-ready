// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class UserRepository {
//   final FirebaseAuth _firebaseAuth;
//   final FirebaseFirestore _firestore;
//
//   UserRepository({
//     FirebaseAuth firebaseAuth,
//     FirebaseFirestore firestore
// }): _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
//   _firestore = firestore ?? FirebaseFirestore.instance;
//
//   //SIGN IN WITH EMAIL AND PASSWORD
//   Future<void> signInWithEmail(String email, String password) {
//     _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
//   }
//  //FIRST TIME LOGIN THAT STORES USERS
//   Future<bool> isFirstTime(String userId) async {
//     bool exist;
//     await FirebaseFirestore.instance.collection('users')
//       .doc(userId).get().then((user){
//         exist=user.exists;  //get is going to check if user exists
//     });
//
//     return exist; //returns it as true or false
//   }
//   //SIGN UP WITH EMAIL AND PASSWORD
//   Future<void> signUpWithEmail(String email, String password) async {
//     print(_firebaseAuth);
//     return await _firebaseAuth
//         .createUserWithEmailAndPassword(email: email, password: password);
//   }
//   //SIGN OUT
//   Future<void> signOut() async {
//     return await _firebaseAuth.signOut();
//   }
//
//   //ENSURES THAT YOU ARE SIGNED IN OR NOT SO YOU DON'T NEED TO SIGN IN AGAIN
//   Future<bool> isSignedIn() async {
//     final currentUser = _firebaseAuth.currentUser;
//     return currentUser != null;
//   }
//
//   Future<String> getUser() async {
//     return (await _firebaseAuth.currentUser.uid);
//   }
//
// }
