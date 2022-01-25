import 'package:firebase_auth/firebase_auth.dart';
import 'package:ready_to_date/ui/pages/models/myUser.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //creates user object based on User
  //User = FirebaseUser. Use User not FirebaseUser
  myUser? _userFromFirebaseUser(User? user) {
    return user != null ? myUser(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<myUser?> get user{
    return _auth.authStateChanges()
        //.map((User? user) => _userFromFirebaseUser(user!));
        .map(_userFromFirebaseUser);
  }
//sign in user
  Future signInAnon() async {
    try{
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user!;
      return _userFromFirebaseUser(user);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  //sign out user

  Future signOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}