class Payment {
  String uid;
  String month;
  String paymentname;
  String monthtext;
  String price;

  Payment({this.uid, this.month, this.paymentname, this.monthtext, this.price});

  factory Payment.fromJson(Map<String, dynamic> item) {
    return Payment(
      uid: item['uid'],
      month: item['idbln'],
      paymentname: item['namaiuran'],
      monthtext: item['bulantxt'],
      price: item['harga_iuran'],
    );
  }
}
