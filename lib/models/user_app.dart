class UserApp {
  final String uid;

  UserApp({this.uid});
}

class UserNotif {
  final String uid;
  final String text;
  final bool read;

  UserNotif({this.uid, this.text, this.read});
}

class UserData {
  final String uid;
  final String name;
  final String email;
  final String phone;
  final int remaining;

  UserData({this.uid, this.name, this.email, this.phone, this.remaining});

  factory UserData.fromFirebase(Map<String, dynamic> item) {
    return UserData(
      uid: item['uid'],
      name: item['name'],
      email: item['email'],
      phone: item['phone'],
      remaining: item['remaining'],
    );
  }

  factory UserData.fromJson(Map<String, dynamic> item) {
    return UserData(
      uid: item['uid'],
      name: item['nama'],
      email: item['email'],
      phone: item['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "nama": name,
      "email": email,
      "phone": phone,
    };
  }
}
