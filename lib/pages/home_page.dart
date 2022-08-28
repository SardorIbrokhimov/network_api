import 'package:flutter/material.dart';
import 'package:network_api/model/post_create.dart';

import '../sevices/Network.dart';

class HomePage extends StatefulWidget {
  static const String id = "home_page";

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String data = "";

  void _apiGet() {
    Network.GET(Network.API_GET, Network.paramsEmpty()).then((response) => {
          print(response),
          _showResponse(response!),
        });
  }

  void _apiCreatePost(Post post1) {
    Network.POST(Network.API_POST, Network.paramsCreate(post1))
        .then((response) => {
              print(response),
              _showResponse(response!),
            });
  }

  void _apiUpdatePost(Post post1) {
    Network.PUT(
            Network.API_PUT + post1.id.toString(), Network.paramsUpdate(post1))
        .then((response) => {
              print(response),
              _showResponse(response!),
            });
  }

  void _apiDeletePost(Post post1) {
    Network.DELETE(
            Network.API_DELETE + post1.id.toString(), Network.paramsEmpty())
        .then((response) => {
              print(response),
              _showResponse(response!),
            });
  }

  void _showResponse(String responses) {
    setState(() {
      data = responses;
    });
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    var post = Post(id: 2, name: "Sardor", salary: "500", age: "20");
   _apiDeletePost(post);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(data != null ? data : "No data"),
      ),
    );
  }
}
