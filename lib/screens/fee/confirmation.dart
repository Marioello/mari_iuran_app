import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mari_iuran_app/models/api_response.dart';
import 'package:mari_iuran_app/models/payment.dart';
import 'package:mari_iuran_app/services/db.dart';
import 'package:mari_iuran_app/shared/loading.dart';

class PageConfirmation extends StatefulWidget {
  final String uid;
  PageConfirmation({this.uid});

  @override
  _ConfirmationState createState() => _ConfirmationState();
}

class _ConfirmationState extends State<PageConfirmation> {
  DBService get db => GetIt.I<DBService>();
  APIResponse<List<Payment>> _paymentList;
  bool _isLoading = false;

  @override
  void initState() {
    _getPayment();

    print(_paymentList);
    // print(DateTime.now().month.toString());
    super.initState();
  }

  _getPayment() async {
    setState(() {
      _isLoading = true;
    });

    _paymentList =
        await db.getPayment(widget.uid, DateTime.now().month.toString());

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Konfirmasi Penerimaan'),
        backgroundColor: Colors.brown[400],
      ),
      body: _isLoading == true
          ? Loading()
          : _paymentList.data == null
              ? ListTile(
                  title: Text(
                    'Belum ada data',
                    textAlign: TextAlign.center,
                  ),
                )
              : ListView.builder(
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
                            child: Icon(Icons.attach_money, color: Colors.brown[100],),
                          ),
                          title: Text(_paymentList.data[index].uid),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Terima',
                                textAlign: TextAlign.right,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Tolak',
                                textAlign: TextAlign.right,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: _paymentList.data.length ?? 0,
                ),
    );
  }
}
