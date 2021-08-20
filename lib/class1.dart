// import 'dart:convert';
// //import 'dart:js';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class abc extends StatefulWidget {
//   @override
//   _abcState createState() => _abcState();
// }

// class _abcState extends State<abc> {
  
//   @override
 
//   List mydata = await getJsonData();
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Http Api'),
//       ),
//       body: GridView.count(
//         // Create a grid with 2 columns. If you change the scrollDirection to
//         // horizontal, this produces 2 rows.
//         crossAxisCount: 2,
//         // Generate 100 widgets that display their index in the List.
//         children: List.generate(mydata.length, (index) {
//           return Image.network(mydata[index]['url']);
//         }),
//       ),
//     );
//   }
// }

// Future<List> getJsonData() async {
//   String url = 'https://jsonplaceholder.typicode.com/photos';

//   http.Response response = await http.get(Uri.parse(url));

//   return jsonDecode(response.body);
  
// }



