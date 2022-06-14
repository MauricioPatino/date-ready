import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ready_to_date/ui/pages/register_screens/add_photo.dart';

class AddName extends StatefulWidget {
  const AddName({Key? key}) : super(key: key);

  // final Function nameView;
  // AddName({required this.nameView});

  @override
  _AddNameState createState() => _AddNameState();
}

class _AddNameState extends State<AddName> {
  final _formKey = GlobalKey<FormState>();

  final _firstName = TextEditingController();
  final _lastName = TextEditingController();

  var firstName = '';
  var lastName = '';
  var error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'First Name',
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 3, color: Colors.lightBlueAccent),
                      //borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 3, color: Colors.lightBlueAccent),
                    ),
                  ),
                  validator: (val) => val!.isEmpty ? 'Enter your first name' : null,
                  onChanged: (val){
                    setState(() {
                      firstName = val;
                    });
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Last Name',
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 3, color: Colors.lightBlueAccent),
                      //borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 3, color: Colors.lightBlueAccent),
                    ),
                  ),
                  //textInputDecoration.copyWith(hintText: 'lastName'),
                  validator: (val) => val!.isEmpty ? 'Enter your first name' : null,
                  obscureText: true,
                  onChanged: (val){
                    setState(() {
                      lastName = val;
                    });
                  },
                ),
                SizedBox(height: 30,),
                ElevatedButton(child: Text('BLAH'), onPressed: (){},),
                SizedBox(height: 30,),
                Text(error,style: TextStyle(color: Colors.red,fontSize: 20.0),),
                SizedBox(height: 10,),
                ElevatedButton(child: Text('Go back'), onPressed: () {Navigator.pop(context);}),
              ],
            ),
          )
      ),
    );
  }
}
