import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:mari_iuran_app/models/user_app.dart';
import 'package:mari_iuran_app/services/database.dart';
import 'package:mari_iuran_app/services/db.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  DBService get db => GetIt.I<DBService>();

  // create user obj base on FireBaseUser
  UserApp _userFromFirebaseUser(User user) {
    return user != null ? UserApp(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<UserApp> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  // sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;

      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());

      return null;
    }
  }

// sign in with email & password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;

      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

// register with email & password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;

      UserData userData = UserData(uid: user.uid, email: email, name: 'New user', phone: '-', remaining: 0);

      // create user data on DB
      await db.createUserData(userData);

      // create a new document for the user with the uid
      // await DatabaseService(uid: user.uid).updateUserData('0', 'new crew member', 100);
      await DatabaseService(uid: user.uid).updateUserNotif('Welcome, $email!', false);
      // await DatabaseService(uid: user.uid).updateUserData('', email, '');

      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

// sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
