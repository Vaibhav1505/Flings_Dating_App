// // ignore_for_file: prefer_const_constructors, avoid_print

// import 'dart:convert';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class HttpGETFile extends StatefulWidget {
//   const HttpGETFile({super.key});

//   @override
//   State<HttpGETFile> createState() => _HttpGETFileState();
// }

// class _HttpGETFileState extends State<HttpGETFile> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.black,
//           centerTitle: true,
//           title: Text(
//             "GET Requests",
//             style: TextStyle(color: Colors.white),
//           ),
//         ),
//         body: ListView.builder(
//             // itemCount: games.length,
//             itemBuilder: (context, index) {
//               // final game = games[index];

//               return ListTile(
//                   tileColor: Colors.blue[100],
//                   leading: ClipRRect(
//                     borderRadius: BorderRadius.circular(10),
//                     // child: Image.network(game.imagePath),
//                   ),
//                   title: Text(
//                     game.title.toString(),
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
//                   ),
//                   subtitle: Text(
//                     game.description.toString(),
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   trailing: Text("Rs. ${game.price.toString()}"));
//             }),
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//         floatingActionButton: FloatingActionButton.extended(
//             icon: Icon(
//               CupertinoIcons.folder_open,
//               color: Colors.white,
//             ),
//             backgroundColor: Colors.black,
//             onPressed: fetchUserData,
//             label: Text(
//               "Get User Data",
//               style: TextStyle(color: Colors.white),
//             )));
//   }

//   //GET REQUEST FOR USERDATA

//   void fetchUserData() async {
//     print("Fetching User Data");
//     const url = 'http://192.168.1.24:3000/products';
//     final baseURL = Uri.parse(url);
//     print(baseURL);

//     final res = await http.get(baseURL);
//     print(res);
//     final body = res.body;
//     print(body);
//     final jsonData = jsonDecode(body);
//     final results = jsonData['resultData'] as List<dynamic>;

//     //WE WRITE RESULTDATA HERE BECAUSE WE KNOW DATA COMES IN ARAAY NAMED RESULTDATA...SO WE HAVE TO PASS THAT NAME...
//     // IF WE DONT PASS A NAME OR DATA NOT COMES IN ARRAY SO WE GIVE RANDOM NAME TO ARRAY AND DART AUTOMATICALLY HANDLES IT

//     print(results);

//     // setState(() {
//     //   games = results.map((e) {
//     //     return Games(
//     //       title: e['title'],
//     //       imagePath: e['imagePath'],
//     //       description: e['description'],
//     //       price: e["price"],
//     //     );
//     //   }).toList();
//     // });
//     print("Fetching Completed");
//   }

//   // void deleteUser() {
//   //   print("User Removed");
//   //   setState(() {
//   //     users.remove(users[index]);
//   //   });
//   // }
// }

// // WAY TO ACCESS ANYHTING IN FLUTTER IN GIVEN OBJECTS
// //MODEL IS NOT CREATED...

// // final user = users[index];
// // final name = user['name']['first'];
// // final email = user['email'];
// // final ImageURL = user['picture']['thumbnail'];