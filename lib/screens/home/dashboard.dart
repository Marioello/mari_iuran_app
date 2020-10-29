import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_it/get_it.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:mari_iuran_app/models/payment.dart';
import 'package:mari_iuran_app/models/fee.dart';
import 'package:mari_iuran_app/models/user_app.dart';
import 'package:mari_iuran_app/screens/fee/fee_assign_list.dart';
import 'package:mari_iuran_app/screens/fee/fee_payment_list.dart';
import 'package:mari_iuran_app/services/db.dart';
import 'package:mari_iuran_app/shared/loading.dart';

class Dashboard extends StatefulWidget {
  final String uid;
  final UserData usrdata;
  final List<FeeAssign> feeassgnlist;
  final List<Payment> paylist;
  final bool isLoading;

  Dashboard(
      {this.uid,
      this.usrdata,
      this.feeassgnlist,
      this.paylist,
      this.isLoading});

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  DBService get db => GetIt.I<DBService>();

  // APIResponse<UserData> _userData;
  // APIResponse<List<FeeAssign>> _feeAssignList;
  // APIResponse<List<Payment>> _paymentList;

  UserData userData;
  List<FeeAssign> feeAssignList;
  List<Payment> paymentList;
  // bool _isLoading = false;

  // @override
  // void initState() {
  //   _getUserData();
  //   _getFee();
  //   _getPayment();
  //   super.initState();
  // }

  // _getFee() async {
  //   setState(() {
  //     _isLoading = true;
  //   });

  //   _feeAssignList = await db.getFee(widget.uid);
  //   feeAssignList = _feeAssignList.data ?? List<FeeAssign>();

  //   setState(() {
  //     _isLoading = false;
  //   });
  // }

  // _getUserData() async {
  //   setState(() {
  //     _isLoading = true;
  //   });

  //   _userData = await db.getUserData(widget.uid);
  //   userData = _userData.data ?? UserData();

  //   setState(() {
  //     _isLoading = false;
  //   });
  // }

  // _getPayment() async {
  //   setState(() {
  //     _isLoading = true;
  //   });

  //   _paymentList =
  //       await db.getPayment(widget.uid, DateTime.now().month.toString());
  //   paymentList = _paymentList.data ?? List<Payment>();
  //   // print(paymentList);

  //   setState(() {
  //     _isLoading = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    userData = widget.usrdata;
    feeAssignList = widget.feeassgnlist;
    paymentList = widget.paylist;

    if (userData == null) {
      return Loading();
    } else {
      return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: ResponsiveGridRow(
              children: [
                ResponsiveGridCol(
                  lg: 12,
                  child: Container(
                    color: Colors.brown[400],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ListTile(
                            title: Text(
                              'Hi' + (', ' + userData.name.toLowerCase()) ?? '',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            subtitle: Text(
                              (userData.email ?? '-') +
                                  '\n' +
                                  (userData.phone ?? '-'),
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            isThreeLine: true,
                            // trailing: Stack(
                            //   children: [
                            //     Icon(Icons.notifications, color: Colors.white),
                            //     Positioned(
                            //       // draw a red marble
                            //       top: 0.0,
                            //       right: 0.0,
                            //       child: new Icon(Icons.brightness_1,
                            //           size: 8.0, color: Colors.redAccent),
                            //     )
                            //   ],
                            // ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ResponsiveGridCol(
                  sm: 4,
                  xs: 6,
                  child: Container(
                    color: Colors.brown[50],
                    child: Center(
                      child: ListTile(
                        title: feeAssignList == null
                            ? SpinKitThreeBounce()
                            : Text(
                                feeAssignList == null
                                    ? '0'
                                    : feeAssignList.length.toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.brown[400],
                                  fontSize: 23,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                        subtitle: Text(
                          'Iuran',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.brown[400],
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        onTap: feeAssignList.length == 0
                            ? () {}
                            : () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return PageFeeAssignList(
                                        feeassignlist: feeAssignList,
                                      );
                                    },
                                  ),
                                );
                              },
                      ),
                    ),
                  ),
                ),
                ResponsiveGridCol(
                  sm: 4,
                  xs: 6,
                  child: Container(
                    color: Colors.white,
                    child: Center(
                      child: ListTile(
                        title: paymentList == null
                            ? SpinKitThreeBounce()
                            : Text(
                                paymentList == null
                                    ? '0'
                                    : paymentList.length.toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.brown[400],
                                  fontSize: 23,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                        subtitle: Text(
                          'Pembayaran',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.brown[400],
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        onTap: feeAssignList.length == 0
                            ? () {}
                            : () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return PageFeePaymentList(
                                        feepaymentlist: paymentList,
                                      );
                                    },
                                  ),
                                );
                              },
                      ),
                    ),
                  ),
                ),
                ResponsiveGridCol(
                  sm: 4,
                  xs: 12,
                  child: Container(
                    color: Colors.brown[100],
                    child: Center(
                      child: ListTile(
                        title: Text(
                          '1',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.brown[400],
                            fontSize: 23,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Text(
                          'Pemberitahuan baru',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.brown[400],
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
