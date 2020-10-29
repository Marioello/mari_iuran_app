import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mari_iuran_app/models/api_response.dart';
import 'package:mari_iuran_app/models/fee.dart';
import 'package:mari_iuran_app/models/payment.dart';
import 'package:mari_iuran_app/services/db.dart';
import 'package:provider/provider.dart';
import 'package:mari_iuran_app/models/user_app.dart';
import 'package:mari_iuran_app/screens/home/dashboard.dart';
import 'package:mari_iuran_app/screens/home/profile.dart';
import 'package:mari_iuran_app/screens/home/summary.dart';
import 'package:mari_iuran_app/services/auth.dart';
import 'package:mari_iuran_app/shared/loading.dart';

class Home extends StatefulWidget {
  final String uid;
  Home({this.uid});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  DBService get db => GetIt.I<DBService>();

  APIResponse<UserData> _userData;
  APIResponse<List<FeeAssign>> _feeAssignList;
  APIResponse<List<Payment>> _paymentList;

  UserApp user;
  UserData userData;
  List<FeeAssign> feeAssignList;
  List<Payment> paymentList;
  bool _isLoading = false;

  @override
  void initState() {
    _getUserData();
    _getFee();
    _getPayment();
    super.initState();
  }

  _getFee() async {
    setState(() {
      _isLoading = true;
    });

    _feeAssignList = await db.getFee(widget.uid);
    feeAssignList = _feeAssignList.data ?? List<FeeAssign>();

    setState(() {
      _isLoading = false;
    });
  }

  _getUserData() async {
    setState(() {
      _isLoading = true;
    });

    _userData = await db.getUserData(widget.uid);
    userData = _userData.data ?? UserData();

    setState(() {
      _isLoading = false;
    });
  }

  _getPayment() async {
    setState(() {
      _isLoading = true;
    });

    _paymentList =
        await db.getPayment(widget.uid, DateTime.now().month.toString());
    paymentList = _paymentList.data ?? List<Payment>();
    print(paymentList);

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserApp>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('My Iuran'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Row(
              children: [
                Center(
                  child: Stack(
                    children: [
                      Icon(Icons.notifications, color: Colors.white),
                      Positioned(
                        // draw a red marble
                        top: 0.0,
                        right: 0.0,
                        child: new Icon(Icons.brightness_1,
                            size: 8.0, color: Colors.redAccent),
                      )
                    ],
                  ),
                ),
                SizedBox(width: 10.0),
                GestureDetector(
                  child: Icon(
                    Icons.exit_to_app,
                    color: Colors.white,
                  ),
                  onTap: () async {
                    await _auth.signOut();
                  },
                ),
              ],
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profil'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PageProfile(userData: userData);
                    },
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('Summary'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PageSummary();
                    },
                  ),
                );
              },
            ),
            // ListTile(
            //   leading: Icon(Icons.check),
            //   title: Text('Konfirmasi'),
            //   onTap: () {
            //     Navigator.pop(context);
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) {
            //           return PageConfirmation(uid: user.uid);
            //         },
            //       ),
            //     );
            //   },
            // )
          ],
        ),
      ),
      body: user == null
          ? Loading()
          : Dashboard(
              uid: user.uid,
              usrdata: userData,
              feeassgnlist: feeAssignList,
              paylist: paymentList,
            ),
    );
  }
}
