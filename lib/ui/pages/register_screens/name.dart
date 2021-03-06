import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ready_to_date/ui/pages/register_screens/add_photo.dart';
import 'package:ready_to_date/ui/pages/register_screens/tiles.dart';

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

  int currentAge = 18;

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
                Expanded(child: SizedBox(height: 20)),
                Expanded(
                  child: TextFormField(
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
                ),
                Expanded(child: SizedBox(height: 20)),
                Expanded(
                  child: TextFormField(
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
                ),
                Expanded(child: SizedBox(height: 30,)),
                Expanded(child: Text("Age",style: TextStyle(fontSize: 40),)),
                Expanded(
                  child: ListWheelScrollView.useDelegate(
                      itemExtent: 50,
                      perspective: 0.005,
                      diameterRatio: 1.2,
                      onSelectedItemChanged: (value) {
                        setState(() {
                          currentAge = value;
                        });
                      },
                      physics: FixedExtentScrollPhysics(),
                      childDelegate: ListWheelChildBuilderDelegate(
                        childCount: 100,
                        builder: (context, index) {
                          return MyTile(
                            age: index,
                          );
                        }
                      )
                  ),
                ),
                Expanded(child: SizedBox(height: 30,)),
                Expanded(child: ElevatedButton(child: Text('Next'), onPressed: (){}, )),
                //Expanded(child: SizedBox(height: 30,)),
                Expanded(child: Text(error,style: TextStyle(color: Colors.red,fontSize: 20.0),)),
                Expanded(child: ElevatedButton(child: Text('Go back'), onPressed: () {Navigator.pop(context);})),
              ],
            ),
          )
      ),
    );
  }
}
