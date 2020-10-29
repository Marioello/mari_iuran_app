import 'package:cloud_firestore/cloud_firestore.dart';
// models
import 'package:mari_iuran_app/models/notif.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // collection reference
  // final CollectionReference brewCollection = FirebaseFirestore.instance.collection('brews');
  // notif collection
  final CollectionReference notifCollection = FirebaseFirestore.instance.collection('notif');
  // final CollectionReference trxCollection = FirebaseFirestore.instance.collection('transactionData');
  // final CollectionReference feeCollection = FirebaseFirestore.instance.collection('fee');
  // final CollectionReference userCollection = FirebaseFirestore.instance.collection('userData');

  // Write data to Firebase
  Future updateUserNotif(String text, bool read) async {
    return await notifCollection.doc(uid).set({
      'text': text,
      'read': read,
    });
  }

  // Future updateUserData(String name, String email, String phone) async {
  //   return await userCollection.doc(uid).set({
  //     'name': name,
  //     'email': email,
  //     'phone': phone,
  //   });
  // }

  // Future addTransactionData(TransactionData transactionData) async {
  //   return userCollection.doc(uid).collection('transactionData').add({
  //     'trxid': transactionData.trxid,
  //     'trxname': transactionData.trxname,
  //     'trxprice': transactionData.trxprice,
  //   });
  // }

  List<Notif> _notifListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((e) {
      return Notif(
        text: e.data()['text'] ?? '',
        read: e.data()['read'] ?? false,
      );
    }).toList();
  }

  // get notif stream
  Stream<List<Notif>> get notifs {
    return notifCollection.snapshots().map(_notifListFromSnapshot);
  }

  // UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
  //   return UserData(
  //     uid: uid,
  //     name: snapshot.data()['name'],
  //     email: snapshot.data()['email'],
  //     phone: snapshot.data()['phone'],
  //     remaining: snapshot.data()['remaining'],
  //   );
  // }

  // // get notif stream
  // Stream<UserData> get userData {
  //   return userCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  // }

  // List<Fee> _listFeeFromSnapshot(QuerySnapshot snapshot) {
  //   return snapshot.docs.map((e) {
  //     return Fee(
  //       id: e.id,
  //       name: e.data()['name'] ?? '',
  //       price: e.data()['price'] ?? 0.0,
  //     );
  //   }).toList();
  // }

  // get fee stream
  // Stream<List<Fee>> get feeList {
  //   return feeCollection.snapshots().map(_listFeeFromSnapshot);
  // }
}
