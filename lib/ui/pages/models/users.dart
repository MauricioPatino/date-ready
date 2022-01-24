import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

import 'model.dart';

class users extends StatefulWidget {
  const users({Key? key}) : super(key: key);

  @override
  _usersState createState() => _usersState();
}

class _usersState extends State<users> {

  final String url = "https://randomuser.me/api/?results=5";
  List? data;
  bool isLoading = false;

  Future getData() async {
    var request = await http.get(
        Uri.parse(url)
    );

    List ConvertDataToJson = jsonDecode(request.body)['results'];
    setState(() {
      data = ConvertDataToJson;
    });
  }

  @override
  void initState(){
    super.initState();
    this.getData();
  }
  //
  // @override
  // static List<User> users = [
  //   User(
  //       id:,
  //       name:,
  //       age:,
  //       imageUrls:[],
  //       jobTitle:,
  //       bio: 'BLAHBLAHBLAH',
  //   ),
  // ];
  Widget build(BuildContext context) {
    return Container();
  }
}


