import 'package:flutter/material.dart';
import 'package:flutter_rest/ui/register_screen.dart';
// import 'package:flutter_rest/autoget.dart';
// import 'package:flutter_rest/deletedata.dart';
// import 'package:flutter_rest/getdata.dart';
// import 'package:flutter_rest/postdata.dart';
// import 'package:flutter_rest/putpatchdata.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: const HomeScreen(),
//     );
//   }
// }

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 5,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('RESTFULL REQRES.IN'),
//           bottom: const TabBar(
//             isScrollable: true,
//             tabs: [
//               Tab(text: 'AutoGet'),
//               Tab(text: 'DeleteData'),
//               Tab(text: 'GetData'),
//               Tab(text: 'PostData'),
//               Tab(text: 'PutPatchData'),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             AutogetData(),
//             Deletedata(),
//             Getdata(),
//             Postdata(),
//             PutPatch(),
//           ],
//         ),
//       ),
//     );
//   }
// }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/register',
      routes: {'/register': (context) => RegisterScreen()},
    );
  }
}
