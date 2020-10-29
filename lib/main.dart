import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:mari_iuran_app/services/db.dart';
import 'package:mari_iuran_app/models/user_app.dart';
import 'package:mari_iuran_app/screens/wrapper.dart';
import 'package:mari_iuran_app/services/auth.dart';

void setupLocator() {
  GetIt.I.registerLazySingleton(() => DBService());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserApp>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
