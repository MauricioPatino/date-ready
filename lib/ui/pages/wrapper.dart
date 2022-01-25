import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ready_to_date/ui/pages/authenticate/authenticate.dart';
import 'package:ready_to_date/ui/pages/models/myUser.dart';
import 'package:ready_to_date/ui/pages/home.dart';
import 'package:ready_to_date/ui/pages/login.dart';

//this class listens for auth changes
class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<myUser?>(context);

    if(user == null){
      return Authenticate();
    } else {
      return Home();
    }
  }
}
