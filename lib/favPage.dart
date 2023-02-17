import 'dart:convert';

import 'package:chunirate_plus/widget/card.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:http/http.dart' as http;

import 'dart:async'; // 非同期処理用ライブラリ
import 'dart:io'; // ファイル出力用ライブラリ

import 'main.dart';
import 'model/music.dart';

import 'package:path_provider/path_provider.dart';

class FavPage extends StatefulWidget {
  FavPage({
    Key? key,
  }) : super(key: key);

  @override
  _FavPageState createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  late List music = [];
  late List<CardMusic> cards = [];

  Future<File> getFilePath(String fileName) async {
    final directory = await getApplicationDocumentsDirectory();
    return File(directory.path + '/' + fileName);
  }

  Future<void> writeTxtFile(String fileName, String data) async {
    final file = await getFilePath(fileName);
    file.writeAsString(data);
  }

  Future<String> readTxtFile(String fileName) async {
    final file = await getFilePath(fileName);
    return file.readAsString();
  }

  void fetchMusic() async {
    http.Response jsonData;
    String data;
    try {
      jsonData = await http.get(Uri.parse(
          "https://api.chunirec.net/2.0/music/showall.json\?region\=jp2\&token\=${token}"));
      data = utf8.decode(jsonData.bodyBytes);
      writeTxtFile('musics.json', data);
    } catch (e) {
      data = await readTxtFile('musics.json');
    }
    var json = jsonDecode(data);
    List test = json.map((json) => Music.fromJson(json)).toList();
    Box box = Hive.box('favorite_musics');
    setState(() {
      music = test;
      for (var val in music) {
        var test = addListMusic(val);
        if (test != null) {
          for (var e in test) {
            if (box.get(e.diff + '.' + e.title) == '1') {
              cards.add(e);
            }
          }
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    this.fetchMusic();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Chunirate ${version}'),
        ),
        body: Scrollbar(
            child: ListView.builder(
          shrinkWrap: true,
          itemCount: cards.length,
          itemBuilder: (context, index) {
            if (cards[index] != null) {
              var tmp = cards[index];
              return MusicCard(tmp.title, tmp.genre, tmp.rate, tmp.level,
                  tmp.combo, tmp.diff, true, this.cards);
            } else {
              return const Text("データなんかねぇよ");
            }
          },
        )));
  }
}
