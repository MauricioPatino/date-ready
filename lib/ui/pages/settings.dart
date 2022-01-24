import 'package:flutter/material.dart';
import 'package:ready_to_date/ui/pages/feedback.dart';
import 'package:ready_to_date/ui/pages/explore.dart';
import 'package:ready_to_date/ui/pages/settings.dart';

class Settings extends StatefulWidget {
  @override
  _Settings createState() => _Settings();
}

class _Settings extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Flexible(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                      radius: 80,
                      backgroundImage: AssetImage('assets/images/pic-3.jpg')
                  ),
                  Text('Olivia Wilde, 31', style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),)
                ],
              )
            ],
          ),
        ),
          SizedBox( height: 10.0, ),
          ListView(
              shrinkWrap: true,
              children:  <Widget> [
                Column(
                  children: [
                    ElevatedButton(onPressed: (){}, child: Text('Profile')),
                    Divider(height: 20,),
                    ElevatedButton(onPressed: (){}, child: Text('Search')),
                    Divider(height: 20,),
                    ElevatedButton(onPressed: (){}, child: Text('Account')),
                    Divider(height: 20,),
                    ElevatedButton(onPressed: (){}, child: Text('Logout')),
                    Divider(height: 20,),
                    ElevatedButton(onPressed: (){}, child: Text('Delete Account')),
                    Divider(height: 20,),
                  ],
                ),
            ]
          ),
        ],
      ),
    );
  }
}