import 'dart:convert';
//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() async {
  // List mydata = await _getfetchdata_http();
  List mydata = await getJsonData();

  //print(mydata);
  
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Http Api'),
        ),
         
        body: GridView.count(
  // Create a grid with 2 columns. If you change the scrollDirection to
  // horizontal, this produces 2 rows.
  crossAxisCount: 2,
  // Generate 100 widgets that display their index in the List.
  children: List.generate(mydata.length, (index) {
    return Image.network(mydata[index]['url']);
  }),
)
      ),
    ),
  );
}

// ignore: non_constant_identifier_names
// Future<List> _getfetchdata_http() async {
//   String url = 'https://jsonplaceholder.typicode.com/posts';

//   http.Response response = await http.get(Uri.parse(url));

//   return jsonDecode(response.body);
// }

Future<List> getJsonData() async {
  String url = 'https://jsonplaceholder.typicode.com/photos';

  http.Response response = await http.get(Uri.parse(url));

  return jsonDecode(response.body);
}
