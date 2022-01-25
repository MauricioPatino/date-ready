import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ready_to_date/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ready_to_date/ui/pages/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class signUpProcess extends StatefulWidget {
  const signUpProcess({Key? key}) : super(key: key);

  @override
  _signUpProcessState createState() => _signUpProcessState();
}

class _signUpProcessState extends State<signUpProcess> {
  final formKey = GlobalKey<FormState>();
  // String email = '';
  // String password = '';

  static Future<User?> signUpProcess({required String email, required String password}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    UserCredential userCredential = await FirebaseAuth.instance
        .signInAnonymously();
    User? user;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    }  on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  //   UserCredential userCredential = await auth.createUserWithEmailAndPassword(email: email, password: password).then((value) async {
  //     //User? user = FirebaseAuth.instance.currentUser;
  //
  //     // await FirebaseFirestore.instance.collection("users").doc(user!.uid).set({ //MIGHT BE USED LATER
  //     //   'uid': user.uid,
  //     //   'email': email,
  //     //   'password': password,
  //     // });
  //     }
  //   );
  //   return "Signed Up";
  // } catch(e) {
  //   return 'e';
  // }


  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          title: Text('Register Page'),
        ),
        body: Center(
          child: Container(
            // height: 80,
            // width: 150,
              child: Form(
                  key: formKey,
                  child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              left: 15.0, right: 15.0, top: 15, bottom: 0),
                          child: TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Email',
                                hintText: 'Enter your email'
                            ),
                            validator: (value){
                              if(value!.isEmpty || !RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                                return 'Enter your email' ;
                              }
                              return null;
                            },
                            onSaved: (value){
                              _emailController.text = value!;
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 15.0, right: 15.0, top: 15, bottom: 0),
                          child: TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Password',
                                hintText: 'Enter your new password'
                            ),
                            // validator: (_passwordController){
                            //   if(_passwordController!.isEmpty){
                            //     return "Enter your email" ;
                            //   } if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(_passwordController)) {
                            //     return "Enter a valid email";
                            //   }
                            //   return null;
                            // },
                            onSaved: (_passwordController){
                              _passwordController = _passwordController;
                            },
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            User? user = await signUpProcess(email: _emailController.text, password: _passwordController.text);
                            print(user);
                            if (formKey.currentState!.validate() && user != null) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (_) => Home()));
                            } else {
                              print('No user found ' + _emailController.text +
                                  " " + _passwordController.text);
                            }
                          },
                          child: const Text('Register'),
                        ),
                      ])
              )
          ),
        )

    );
  }
}
