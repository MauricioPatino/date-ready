import 'package:flutter/material.dart';
import 'package:ready_to_date/ui/pages/feedback.dart';
import 'package:ready_to_date/ui/pages/explore.dart';
import 'package:ready_to_date/ui/pages/settings.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreen createState() => _FeedScreen();
}

class _FeedScreen extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Container(
          height: 80,
          width: 150,
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(10)),
          child: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'THIS IS FEEDBACK NOT SURE WHAT TO PUT RIGHT NOW',

              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }
}