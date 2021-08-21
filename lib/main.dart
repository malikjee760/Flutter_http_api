
//import 'dart:js';
import 'package:flutter/material.dart';

import 'del_update.dart';

// void main() async {
//   // List mydata = await _getfetchdata_http();
//   List mydata = await getJsonData();

//   //print(mydata);
  
//   runApp(
//     MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Http Api'),
//         ),
         
//         body: GridView.count(
//   // Create a grid with 2 columns. If you change the scrollDirection to
//   // horizontal, this produces 2 rows.
//   crossAxisCount: 2,
//   // Generate 100 widgets that display their index in the List.
//   children: List.generate(mydata.length, (index) {
//     return Image.network(mydata[index]['url']);
//   }),
// )
//       ),
//     ),
//   );
// }

// // ignore: non_constant_identifier_names
// // Future<List> _getfetchdata_http() async {
// //   String url = 'https://jsonplaceholder.typicode.com/posts';

// //   http.Response response = await http.get(Uri.parse(url));

// //   return jsonDecode(response.body);
// // }

// Future<List> getJsonData() async {
//   String url = 'https://jsonplaceholder.typicode.com/photos';

//   http.Response response = await http.get(Uri.parse(url));

//   return jsonDecode(response.body);
// }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  late Future<Album> _futureAlbum;

  @override
  void initState() {
    super.initState();
    _futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delete Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Delete Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Album>(
            future: _futureAlbum,
            builder: (context, snapshot) {
              // If the connection is done,
              // check for response data or an error.
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(snapshot.data?.title ?? 'Deleted'),
                      ElevatedButton(
                        child: const Text('Delete Data'),
                        onPressed: () {
                          setState(() {
                            _futureAlbum =
                                deleteAlbum(snapshot.data!.id.toString());
                          });
                        },
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}