import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_http_api/model/post.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return homeScreen();
  }
}

class homeScreen extends StatefulWidget {
  @override
  _homeScreenState createState() => _homeScreenState();
}

// ignore: camel_case_types
class _homeScreenState extends State<homeScreen> {
  late Future<Post> futurepost;
  @override
  void initState() {
    super.initState();
    futurepost = getHttpData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetching data'),
        ),
        body: Center(
          child: FutureBuilder<Post>(
            future: futurepost,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.title);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }

  Future<Post> getHttpData() async {
    String url = 'https://jsonplaceholder.typicode.com/posts/2';
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      //print(jsonDecode(response.body));
      return Post.fromJson(json.decode(response.body));
    } else {
      return throw Exception('Error in fetching');
    }
  }
}
