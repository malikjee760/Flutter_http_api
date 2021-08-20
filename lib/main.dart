import 'dart:convert';
//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() async {
  // List mydata = await _getfetchdata_http();
  List mydata = await getJsonData();

 // List d1 = mydata1['contacts'];
  print(mydata);
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Http Api'),
        ),
        // body: ListView.builder(
        //     itemCount: mydata.length,
        //     itemBuilder: (BuildContext context, int position) {
        //       return ListTile(
        //         title: Text(mydata[position].toString()),
        //       );
        //     }),
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
  String url = 'https://jsonplaceholder.typicode.com/users';

  http.Response response = await http.get(Uri.parse(url));   

  return jsonDecode(response.body);
}
