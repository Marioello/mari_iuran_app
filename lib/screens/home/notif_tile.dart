import 'package:flutter/material.dart';
import 'package:mari_iuran_app/models/notif.dart';

class NotifTile extends StatelessWidget {
  final Notif notif;

  NotifTile({this.notif});

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
          title: Text(notif.text),
          trailing: notif.read == false ? Icon(Icons.notifications, color: Colors.blue) : Icon(Icons.notifications),
        ),
      ),
    );
  }
}
