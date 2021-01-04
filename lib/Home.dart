import 'dart:convert';

import 'package:consumo_servico_avancado/Character.dart';
import 'package:consumo_servico_avancado/Post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _urlBase = "https://jsonplaceholder.typicode.com";
  String _urlBase2 = "https://swapi.dev/api/people/1/";

  Future<List<Post>> _getPost() async {
    http.Response response = await http.get(_urlBase + "/posts");
    List postList = jsonDecode(response.body);
    var lists = postList.map((data) => Post.fromJson(data)).toList();
    return lists;
  }

  Future<Character> _getChar() async {
    http.Response response = await http.get(_urlBase2);
    Map character = jsonDecode(response.body);
    var char = Character.fromJson(character);
    return char;
  }

  //Future<Post> _post() async {
  //var corpo = jsonEncode(Post("body", 1, "title", 1));
  //http.Response response = await http.post(_urlBase + "/posts",
  //headers: {"Content-type": "application/json; charset=UTF-8"},
  //body: corpo);
  //print(response.statusCode);
  //}

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
                  onPressed: () {},
                ),
                RaisedButton(
                  child: Text("Remover"),
                  onPressed: () {},
                ),
              ],
            ),
            Expanded(
              child: FutureBuilder<Character>(
                future: _getChar(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                      break;
                    default:
                  }
                  Character character = snapshot.data;
                  return ListView.builder(
                    itemCount: character.films.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(character.films[index]),
                      );
                    },
                  );
                },
              ),
            ),
            FutureBuilder<Character>(
              future: _getChar(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                    break;
                  default:
                }
                Character character = snapshot.data;
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: character.species.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("bla"),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
