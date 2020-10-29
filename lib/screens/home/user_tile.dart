import 'package:flutter/material.dart';
import 'package:mari_iuran_app/models/user_app.dart';

class UserTile extends StatelessWidget {
  final UserData userdata;

  UserTile({this.userdata});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          // leading: CircleAvatar(
          //   radius: 25.0,
          //   backgroundColor: Colors.brown[100],
          // ),
          title: Text('Hi, ' + (userdata.name == '' ? userdata.email : userdata.name) + '!'),
          subtitle: Text(userdata.phone == '' ? '-' : userdata.phone),
        ),
      ),
    );
  }
}
