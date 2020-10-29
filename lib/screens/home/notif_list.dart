import 'package:flutter/material.dart';
import 'package:mari_iuran_app/models/notif.dart';
import 'package:mari_iuran_app/screens/home/notif_tile.dart';
import 'package:provider/provider.dart';

class NotifList extends StatefulWidget {
  @override
  _NotifListState createState() => _NotifListState();
}

class _NotifListState extends State<NotifList> {
  @override
  Widget build(BuildContext context) {
    final notifs = Provider.of<List<Notif>>(context) ?? [];

    return ListView.builder(
      itemCount: notifs.length,
      itemBuilder: (context, index) {
        return NotifTile(notif: notifs[index]);
      },
    );
  }
}
