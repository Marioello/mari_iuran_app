import 'package:flutter/material.dart';
import 'package:mari_iuran_app/models/payment.dart';

class PageFeePaymentList extends StatelessWidget {
  final List<Payment> feepaymentlist;
  PageFeePaymentList({this.feepaymentlist});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar bayar'),
        backgroundColor: Colors.brown[400],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Card(
              margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 25.0,
                  backgroundColor: Colors.brown[400],
                  child: feeInitial(feepaymentlist[index].paymentname),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      feepaymentlist[index].paymentname +
                          ' - ' +
                          feepaymentlist[index].monthtext,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                subtitle: Text('Rp. ' + feepaymentlist[index].price),
              ),
            ),
          );
        },
        itemCount: feepaymentlist.length ?? 0,
      ),
    );
  }

  Text feeInitial(String txt) {
    String result = '';
    var splitArray = txt.split(' ');
    for (var chr in splitArray) {
      result = result + chr[0];
    }

    return Text(
      result.toUpperCase(),
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
