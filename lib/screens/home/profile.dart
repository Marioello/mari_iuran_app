import 'package:flutter/material.dart';
import 'package:mari_iuran_app/models/user_app.dart';
import 'package:mari_iuran_app/shared/loading.dart';

class PageProfile extends StatelessWidget {
  final UserData userData;
  PageProfile({this.userData});

  @override
  Widget build(BuildContext context) {
    if (userData == null) {
      return Loading();
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'NAMA',
                  style: TextStyle(
                    color: Colors.grey,
                    letterSpacing: 2.0,
                  ),
                ),
                Text(
                  userData.name,
                  style: TextStyle(
                    color: Colors.brown[500],
                    fontSize: 23.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  'EMAIL',
                  style: TextStyle(
                    color: Colors.grey,
                    letterSpacing: 2.0,
                  ),
                ),
                Text(
                  userData.email,
                  style: TextStyle(
                    color: Colors.brown[500],
                    fontSize: 23.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  'TELEPON',
                  style: TextStyle(
                    color: Colors.grey,
                    letterSpacing: 2.0,
                  ),
                ),
                Text(
                  userData.phone,
                  style: TextStyle(
                    color: Colors.brown[500],
                    fontSize: 23.0,
                    fontWeight: FontWeight.bold,
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

// class Profile extends StatefulWidget {
//   final UserData userdata;
//   Profile({this.userdata});

//   @override
//   _ProfileState createState() => _ProfileState();
// }

// class _ProfileState extends State<Profile> {
//   // DBService get db => GetIt.I<DBService>();
//   // APIResponse<UserData> _userData;

//   UserData userData;
//   // bool _isLoading = false;

//   // @override
//   // void initState() {
//   //   _getUserData();
//   //   super.initState();
//   // }

//   // _getUserData() async {
//   //   setState(() {
//   //     _isLoading = true;
//   //   });

//   //   _userData = await db.getUserData(widget.userdata.uid);
//   //   _userData = _userData ?? UserData();

//   //   setState(() {
//   //     _isLoading = false;
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     userData = widget.userdata;

//     if (userData == null) {
//       return Loading();
//     } else {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text('Profile'),
//           backgroundColor: Colors.brown[400],
//           elevation: 0.0,
//         ),
//         body: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'EMAIL',
//                   style: TextStyle(
//                     color: Colors.grey,
//                     letterSpacing: 2.0,
//                   ),
//                 ),
//                 Text(
//                   userData.email,
//                   style: TextStyle(
//                     color: Colors.brown[500],
//                     fontSize: 23.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 20.0),
//                 Text(
//                   'TELEPON',
//                   style: TextStyle(
//                     color: Colors.grey,
//                     letterSpacing: 2.0,
//                   ),
//                 ),
//                 Text(
//                   userData.phone,
//                   style: TextStyle(
//                     color: Colors.brown[500],
//                     fontSize: 23.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//     }
//   }
// }
// class Profile extends StatefulWidget {
//   final String uid;
//   Profile({this.uid});

//   @override
//   _ProfileState createState() => _ProfileState();
// }

// class _ProfileState extends State<Profile> {
//   DBService get db => GetIt.I<DBService>();
//   APIResponse<UserData> _userData;

//   bool _isLoading = false;

//   @override
//   void initState() {
//     _getUserData();
//     super.initState();
//   }

//   _getUserData() async {
//     setState(() {
//       _isLoading = true;
//     });

//     _userData = await db.getUserData(widget.uid);
//     _userData = _userData ?? UserData();

//     setState(() {
//       _isLoading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (_isLoading == true) {
//       return Loading();
//     } else {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text('Profile'),
//           backgroundColor: Colors.brown[400],
//           elevation: 0.0,
//         ),
//         body: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'EMAIL',
//                   style: TextStyle(
//                     color: Colors.grey,
//                     letterSpacing: 2.0,
//                   ),
//                 ),
//                 Text(
//                   _userData.data.email,
//                   style: TextStyle(
//                     color: Colors.brown[500],
//                     fontSize: 23.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 20.0),
//                 Text(
//                   'TELEPON',
//                   style: TextStyle(
//                     color: Colors.grey,
//                     letterSpacing: 2.0,
//                   ),
//                 ),
//                 Text(
//                   _userData.data.phone,
//                   style: TextStyle(
//                     color: Colors.brown[500],
//                     fontSize: 23.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//     }
//   }
// }
