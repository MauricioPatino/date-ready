import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ready_to_date/ui/pages/models/myUser.dart';
import 'package:ready_to_date/ui/pages/services/auth.dart';
import 'package:ready_to_date/ui/pages/wrapper.dart';
import 'package:ready_to_date/ui/pages/login.dart';
import 'package:ready_to_date/ui/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ready_to_date/ui/pages/forgotPassword.dart';
import 'package:ready_to_date/ui/pages/register/signUp.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<myUser?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}


