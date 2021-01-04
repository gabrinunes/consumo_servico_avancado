import 'dart:convert';

import 'package:consumo_servico_avancado/Post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _urlBase = "https://jsonplaceholder.typicode.com";

  Future<List<Post>> _getPost() async {
    http.Response response = await http.get(_urlBase + "/posts");
    List postList = jsonDecode(response.body);
    var lists = postList.map((data) => Post.fromJson(data)).toList();
    return lists;
  }

  Future<Post> _post() async {
    var corpo = jsonEncode(Post("body", 1, "title", 1));
    http.Response response = await http.post(_urlBase + "/posts",
        headers: {"Content-type": "application/json; charset=UTF-8"},
        body: corpo);
    print(response.statusCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo de servico avancado"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                RaisedButton(
                  child: Text("Salvar"),
                  onPressed: () {},
                ),
                RaisedButton(
                  child: Text("Atualizar"),
                  onPressed: () {
                    _post();
                  },
                ),
                RaisedButton(
                  child: Text("Remover"),
                  onPressed: () {},
                ),
              ],
            ),
            Expanded(
              child: FutureBuilder<List<Post>>(
                future: _getPost(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                      break;
                    default:
                  }
                  List<Post> post = snapshot.data;
                  return ListView.builder(
                    itemCount: post.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(post[index].title),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
