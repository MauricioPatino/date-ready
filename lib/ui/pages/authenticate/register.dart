import 'package:flutter/material.dart';
import 'package:ready_to_date/ui/pages/services/auth.dart';
import 'package:ready_to_date/ui/pages/shared/constants.dart';
import 'package:ready_to_date/ui/pages/shared/loading.dart';

class Register extends StatefulWidget {
  //const Register({Key? key}) : super(key: key);

  final Function toggleView;
  Register({required this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();

  final _formKey = GlobalKey<FormState>();

  bool loading = false;


  var email = '';
  var password = '';
  var error = '';
  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        elevation: 0.0,
        title: Text('Sign Up for Date Ready'),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 20,),
                TextFormField(
                  decoration:textInputDecoration.copyWith(hintText: 'Email'),
                  validator: (val) => val!.isEmpty ? 'Enter your email' : null,
                  onChanged: (val){
                    setState(() {
                      email = val;
                    });
                  },
                ),
                SizedBox(height: 20,),
                TextFormField(
                  decoration:textInputDecoration.copyWith(hintText: 'Password'),
                  validator: (val) => val!.length < 6 ? 'Enter a password 6 characters long' : null,
                  obscureText: true,
                  onChanged: (val){
                    setState(() {
                      password = val;
                    });
                  },
                ),
                SizedBox(height: 30,),
                ElevatedButton(
                  child: Text('Complete registration'),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blueAccent[400]),
                      textStyle: MaterialStateProperty.all(
                          TextStyle(color: Colors.white))),
                  onPressed: () async {
                    if(_formKey.currentState!.validate()){
                      setState(() {
                        loading = true;
                      });
                      dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                      if(result == null){
                        setState(() {
                          error = 'Please enter a valid email';
                          loading = false;
                        });;
                      }
                    }
                  },
                ),
                SizedBox(height: 10,),
                Text(error,style: TextStyle(color: Colors.red,fontSize: 20.0),),
                SizedBox(height: 10,),
                ElevatedButton(onPressed: () {widget.toggleView();}, child: Text('Go Back')),
              ],
            ),
          )
      ),
    );
  }
}
