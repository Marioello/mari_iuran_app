import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mari_iuran_app/models/api_response.dart';
import 'package:mari_iuran_app/models/fee.dart';
import 'package:mari_iuran_app/models/payment.dart';
import 'package:mari_iuran_app/models/user_app.dart';

class DBService {
  static const API = 'http://api.marmarjo.com/api/test_api.php';
  static const headers = {
    "content-type": "application/json",
    "accept": "application/json",
  };

  Future<APIResponse<bool>> createUserData(UserData item) {
    return http
        .post(API + '?action=createuserdata',
            headers: headers, body: json.encode(item.toJson()))
        .then((data) {
      if (data.statusCode == 200) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(
          error: true, errorMessage: 'createUserData - An error occured');
    }).catchError((_) => APIResponse<bool>(
            error: true, errorMessage: 'createUserData - An error occured'));
  }

  Future<APIResponse<List<Payment>>> getPayment(String uid, String bln) {
    String param = "";
    if (uid != "") {
      param = "&uid=" + uid + "&bln=" + bln;
    }
    // print(API + '?action=getpayment' + param);
    return http.get(API + '?action=getpayment' + param, headers: headers).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);

        if (jsonData == null) {
          return APIResponse<List<Payment>>(error: true, errorMessage: 'Belum ada data');
        }

        final transactions = <Payment>[];
        for (var item in jsonData) {
          transactions.add(Payment.fromJson(item));
        }
        return APIResponse<List<Payment>>(data: transactions);
      }
      return APIResponse<List<Payment>>(
          error: true, errorMessage: 'getPayment - An error occured 1');
    }).catchError((_) => APIResponse<List<Payment>>(
            error: true, errorMessage: 'getPayment - An error occured 2'));
  }

  Future<APIResponse<List<FeeAssign>>> getFee(String uid) {
    String param = "";
    if (uid != "") {
      param = "&uid=" + uid;
    }
    return http
        .get(API + '?action=getfee' + param, headers: headers)
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);

        if (jsonData == null) {
          return APIResponse<List<FeeAssign>>(
              error: true, errorMessage: 'Belum ada data');
        }

        final transactions = <FeeAssign>[];
        for (var item in jsonData) {
          transactions.add(FeeAssign.fromJson(item));
        }
        return APIResponse<List<FeeAssign>>(data: transactions);
      }
      return APIResponse<List<FeeAssign>>(
          error: true, errorMessage: 'getfee - An error occured 1');
    }).catchError((_) => APIResponse<List<FeeAssign>>(
            error: true, errorMessage: 'getfee - An error occured 2'));
  }

  Future<APIResponse<UserData>> getUserData(String uid) {
    String param = "";
    if (uid != "") {
      param = "&uid=" + uid;
    }
    return http.get(API + '?action=getuserdata' + param, headers: headers).then(
        (data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        return APIResponse<UserData>(data: UserData.fromJson(jsonData));
      }
      return APIResponse<UserData>(
          error: true, errorMessage: 'An error occured');
    }).catchError((_) =>
        APIResponse<UserData>(error: true, errorMessage: 'An error occured'));
  }

  // Future<APIResponse<List<MemberFeeAssign>>> getMemberFeeAssignList(String id) {
  //   return http
  //       .get(API + '?action=getmemberfeeassignlist&id=' + id, headers: headers)
  //       .then((data) {
  //     if (data.statusCode == 200) {
  //       final jsonData = json.decode(data.body);

  //       if (jsonData == null) {
  //         return APIResponse<List<MemberFeeAssign>>(
  //             error: true, errorMessage: 'Belum ada data');
  //       }

  //       final transactions = <MemberFeeAssign>[];
  //       for (var item in jsonData) {
  //         transactions.add(MemberFeeAssign.fromJson(item));
  //       }
  //       return APIResponse<List<MemberFeeAssign>>(data: transactions);
  //     }
  //     return APIResponse<List<MemberFeeAssign>>(
  //         error: true, errorMessage: 'getMemberFeeAssign - An error occured 1');
  //   }).catchError((_) => APIResponse<List<MemberFeeAssign>>(
  //           error: true,
  //           errorMessage: 'getMemberFeeAssign - An error occured 2'));
  // }

  // Future<APIResponse<List<Fee>>> getFeeHeader() {
  //   return http
  //       .get(API + '?action=getfeeheader', headers: headers)
  //       .then((data) {
  //     if (data.statusCode == 200) {
  //       final jsonData = json.decode(data.body);

  //       if (jsonData == null) {
  //         return APIResponse<List<Fee>>(
  //             error: true, errorMessage: 'Belum ada riwayat transaksi');
  //       }

  //       final transactions = <Fee>[];
  //       for (var item in jsonData) {
  //         transactions.add(Fee.fromJson(item));
  //       }
  //       return APIResponse<List<Fee>>(data: transactions);
  //     }
  //     return APIResponse<List<Fee>>(
  //         error: true, errorMessage: 'getFee - An error occured 1');
  //   }).catchError((_) => APIResponse<List<Fee>>(
  //           error: true, errorMessage: 'getFee - An error occured 2'));
  // }

  // Future<APIResponse<List<Fee>>> getFeeList() {
  //   return http.get(API + '?action=getfeelist', headers: headers).then((data) {
  //     if (data.statusCode == 200) {
  //       final jsonData = json.decode(data.body);

  //       if (jsonData == null) {
  //         return APIResponse<List<Fee>>(
  //             error: true, errorMessage: 'Belum ada data');
  //       }

  //       final transactions = <Fee>[];
  //       for (var item in jsonData) {
  //         transactions.add(Fee.fromJson(item));
  //       }
  //       return APIResponse<List<Fee>>(data: transactions);
  //     }
  //     return APIResponse<List<Fee>>(
  //         error: true, errorMessage: 'getFee - An error occured 1');
  //   }).catchError((_) => APIResponse<List<Fee>>(
  //       error: true, errorMessage: 'getFee - An error occured 2'));
  // }

  // Future<APIResponse<List<FeeList>>> getFeeHistoryList(
  //     String id, String idiuran) {
  //   return http
  //       .get(API + '?action=getfeehistory&id=' + id + '&idiuran=' + idiuran,
  //           headers: headers)
  //       .then((data) {
  //     if (data.statusCode == 200) {
  //       final jsonData = json.decode(data.body);

  //       if (jsonData == null) {
  //         return APIResponse<List<FeeList>>(
  //             error: true, errorMessage: 'Belum ada data');
  //       }

  //       final transactions = <FeeList>[];
  //       for (var item in jsonData) {
  //         transactions.add(FeeList.fromJson(item));
  //       }
  //       return APIResponse<List<FeeList>>(data: transactions);
  //     }
  //     return APIResponse<List<FeeList>>(
  //         error: true, errorMessage: 'getFee - An error occured 1');
  //   }).catchError((_) => APIResponse<List<FeeList>>(
  //           error: true, errorMessage: 'getFee - An error occured 2'));
  // }

  // Future<APIResponse<List<FeeList>>> getFeePaymentList(
  //     String id, String idiuran) {
  //   return http
  //       .get(API + '?action=getfeepayment&id=' + id + '&idiuran=' + idiuran,
  //           headers: headers)
  //       .then((data) {
  //     if (data.statusCode == 200) {
  //       final jsonData = json.decode(data.body);

  //       if (jsonData == null) {
  //         return APIResponse<List<FeeList>>(
  //             error: true, errorMessage: 'Belum ada data');
  //       }

  //       final transactions = <FeeList>[];
  //       for (var item in jsonData) {
  //         transactions.add(FeeList.fromJson(item));
  //       }
  //       return APIResponse<List<FeeList>>(data: transactions);
  //     }
  //     return APIResponse<List<FeeList>>(
  //         error: true, errorMessage: 'getFee - An error occured 1');
  //   }).catchError((_) => APIResponse<List<FeeList>>(
  //           error: true, errorMessage: 'getFee - An error occured 2'));
  // }

  // Future<APIResponse<Fee>> getFee(String feeID) {
  //   return http.get(API + '?action=getfee&id=' + feeID, headers: headers).then(
  //       (data) {
  //     if (data.statusCode == 200) {
  //       final jsonData = json.decode(data.body);
  //       return APIResponse<Fee>(data: Fee.fromJson(jsonData));
  //     }
  //     return APIResponse<Fee>(error: true, errorMessage: 'An error occured');
  //   }).catchError(
  //       (_) => APIResponse<Fee>(error: true, errorMessage: 'An error occured'));
  // }

  // Future<APIResponse<bool>> createFee(FeeModify item) {
  //   return http
  //       .post(API + '?action=createfee',
  //           headers: headers, body: json.encode(item.toJson()))
  //       .then((data) {
  //     if (data.statusCode == 200) {
  //       return APIResponse<bool>(data: true);
  //     }
  //     return APIResponse<bool>(error: true, errorMessage: 'An error occured');
  //   }).catchError((_) =>
  //           APIResponse<bool>(error: true, errorMessage: 'An error occured'));
  // }

  // Future<APIResponse<bool>> updateFee(FeeModify item) {
  //   return http
  //       .put(API + '?action=updatefee',
  //           headers: headers, body: json.encode(item.toJson()))
  //       .then((data) {
  //     if (data.statusCode == 200) {
  //       return APIResponse<bool>(data: true);
  //     }
  //     return APIResponse<bool>(error: true, errorMessage: 'An error occured');
  //   }).catchError((_) =>
  //           APIResponse<bool>(error: true, errorMessage: 'An error occured'));
  // }

  // Future<APIResponse<bool>> insertFeeAssign(MemberFeeAssign item) {
  //   return http
  //       .put(API + '?action=insertfeeassign',
  //           headers: headers, body: json.encode(item.toJson()))
  //       .then((data) {
  //     if (data.statusCode == 200) {
  //       return APIResponse<bool>(data: true);
  //     }
  //     return APIResponse<bool>(error: true, errorMessage: 'An error occured');
  //   }).catchError((_) =>
  //           APIResponse<bool>(error: true, errorMessage: 'An error occured'));
  // }

  // Future<APIResponse<bool>> deleteFeeAssign(String id, String feeid) {
  //   return http
  //       .delete(API + '?action=deletefeeassign&id=' + id + '&feeid=' + feeid,
  //           headers: headers)
  //       .then((data) {
  //     if (data.statusCode == 200) {
  //       return APIResponse<bool>(data: true);
  //     }
  //     return APIResponse<bool>(error: true, errorMessage: 'An error occured');
  //   }).catchError((_) =>
  //           APIResponse<bool>(error: true, errorMessage: 'An error occured'));
  // }

  // Future<APIResponse<bool>> deleteFee(String id) {
  //   return http
  //       .delete(API + '?action=deletefee&id=' + id, headers: headers)
  //       .then((data) {
  //     if (data.statusCode == 200) {
  //       return APIResponse<bool>(data: true);
  //     }
  //     return APIResponse<bool>(error: true, errorMessage: 'An error occured');
  //   }).catchError((_) =>
  //           APIResponse<bool>(error: true, errorMessage: 'An error occured'));
  // }
}
