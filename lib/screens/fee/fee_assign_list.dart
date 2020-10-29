import 'package:flutter/material.dart';
import 'package:mari_iuran_app/models/fee.dart';

class PageFeeAssignList extends StatelessWidget {
  final List<FeeAssign> feeassignlist;
  PageFeeAssignList({this.feeassignlist});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar iuran'),
        backgroundColor: Colors.brown[400],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Card(
              margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
              child: ListTile(
                // leading: Icon(
                //   Icons.attach_money,
                //   color: Colors.brown[400],
                // ),
                leading: CircleAvatar(
                  radius: 25.0,
                  backgroundColor: Colors.brown[400],
                  child: feeInitial(feeassignlist[index].name),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      feeassignlist[index].name,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                subtitle: Text('Rp. ' + feeassignlist[index].price),
                // trailing: Text(feeassignlist[index].price),
              ),
            ),
          );
        },
        itemCount: feeassignlist.length ?? 0,
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

// class PageFeeAssignList extends StatefulWidget {
//   final List<FeeAssign> feeassignlist;
//   PageFeeAssignList({this.feeassignlist});

//   @override
//   _ConfirmationState createState() => _ConfirmationState();
// }

// class _ConfirmationState extends State<PageFeeAssignList> {
//   DBService get db => GetIt.I<DBService>();
//   APIResponse<List<Payment>> _paymentList;
//   bool _isLoading = false;

//   @override
//   void initState() {
//     _getPayment();

//     print(_paymentList);
//     // print(DateTime.now().month.toString());
//     super.initState();
//   }

//   _getPayment() async {
//     setState(() {
//       _isLoading = true;
//     });

//     _paymentList =
//         await db.getPayment(widget.uid, DateTime.now().month.toString());

//     setState(() {
//       _isLoading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Konfirmasi Penerimaan'),
//         backgroundColor: Colors.brown[400],
//       ),
//       body: _isLoading == true
//           ? Loading()
//           : _paymentList.data == null
//               ? ListTile(
//                   title: Text(
//                     'Belum ada data',
//                     textAlign: TextAlign.center,
//                   ),
//                 )
//               : ListView.builder(
//                   itemBuilder: (context, index) {
//                     return Padding(
//                       padding: EdgeInsets.only(top: 8.0),
//                       child: Card(
//                         margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
//                         child: ListTile(
//                           // leading: Icon(
//                           //   Icons.attach_money,
//                           //   color: Colors.brown[400],
//                           // ),
//                           leading: CircleAvatar(
//                             radius: 25.0,
//                             backgroundColor: Colors.brown[400],
//                             child: Icon(
//                               Icons.attach_money,
//                               color: Colors.brown[100],
//                             ),
//                           ),
//                           title: Row(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: [
//                               Text(
//                                 'Terima',
//                                 textAlign: TextAlign.right,
//                               ),
//                               SizedBox(width: 10),
//                               Text(
//                                 'Tolak',
//                                 textAlign: TextAlign.right,
//                               ),
//                             ],
//                           ),
//                           subtitle: Text(_paymentList.data[index].uid),
//                           isThreeLine: true,
//                         ),
//                       ),
//                     );
//                   },
//                   itemCount: _paymentList.data.length ?? 0,
//                 ),
//     );
//   }
// }
