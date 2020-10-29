class Fee {
  String id;
  String name;
  int price;

  Fee({this.id, this.name, this.price});

  Fee.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    price = data['price'];
  }
}

class FeeAssign {
  String uid;
  String feeid;
  String name;
  String price;

  FeeAssign({this.uid, this.feeid, this.name, this.price});

  factory FeeAssign.fromJson(Map<String, dynamic> item) {
    return FeeAssign(
      uid: item["uid"],
      feeid: item["idiuran"],
      name: item["name"],
      price: item["price"],
    );
  }
}
