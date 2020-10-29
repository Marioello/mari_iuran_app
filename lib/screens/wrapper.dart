import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mari_iuran_app/models/user_app.dart';
import 'package:mari_iuran_app/screens/authenticate/authenticate.dart';
import 'package:mari_iuran_app/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserApp>(context);
    // print('Wrapper-' + user.uid);

    // return either Home or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return Home(uid: user.uid);
    }
  }
}
