import 'dart:convert';

import 'dart:async'; // 非同期処理用ライブラリ
import 'dart:ffi';
import 'dart:io'; // ファイル出力用ライブラリ

import 'package:chunirate_plus/score.dart';
import 'package:chunirate_plus/search.dart';
import 'package:chunirate_plus/tab.dart';
import 'package:chunirate_plus/widget/card.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

import '../model/music.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

const favorites = 'favorite_musics';

const version = 1.0;

String token = "";

void main() async {
  await DotEnv().load(fileName: ".env");
  token = DotEnv().env['TOKEN_KEY'].toString();
  await Hive.initFlutter();
  await Hive.openBox(favorites);
  await Hive.openBox('Settings');
  Box settings = Hive.box('Settings');
  settings.put("Score", 1007500);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chunirate ${version}',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TabPage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List music = [];
  late List<CardMusic> cards = [];
  late List<CardMusic> copyCards = [];
  var cont = TextEditingController();
  late Box<String> box;

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
    Box box = Hive.box(favorites);
    setState(() {
      music = test;
      for (var val in music) {
        var test = addListMusic(val);
        if (test != null) {
          for (var e in test) {
            cards.add(e);
            if (box.get('${e.diff}.${e.title}') == null) {
              box.put('${e.diff}.${e.title}', '0');
            } else {}
          }
        }
      }
      setState(() {
        copyCards = cards;
        copyCards.sort(((a, b) => b.rate.compareTo(a.rate)));
      });
    });
  }

  void runFilter(String inputKeyword) {
    List<CardMusic> results = [];
    if (inputKeyword.isEmpty) {
      results = cards;
    } else {
      for (CardMusic music in cards) {
        if (music.title.contains(inputKeyword)) {
          results.add(music);
        }
      }
    }
    setState(() {
      copyCards = results;
      sortMusic();
    });
  }

  @override
  void initState() {
    super.initState();
    fetchMusic();
  }

  int sortValue = 0;

  List<DropdownMenuItem<int>> sortList = [
    const DropdownMenuItem(
      value: 0, //定数ソート (昇順)
      child: Text("譜面定数(昇順)"),
    ),
    const DropdownMenuItem(
      value: 1,
      child: Text("譜面定数(降順)"),
    ),
    const DropdownMenuItem(
      value: 2,
      child: Text("ノーツ数(昇順)"),
    ),
    const DropdownMenuItem(
      value: 3,
      child: Text("ノーツ数(降順)"),
    )
  ];

  List<DropdownMenuItem<double>> levels = levelList;
  double minRate = 1.0;
  double maxRate = 15.5;
  var minController = TextEditingController(text: '1');
  var maxController = TextEditingController(text: '15.4');

  void sortMusic() {
    List<CardMusic> copy = [];
    for (var e in cards) {
      if (e.rate >= minRate && e.rate <= maxRate) {
        copy.add(e);
      }
    }
    setState(() {
      copyCards = copy;
      switch (sortValue) {
        case 0:
          copyCards.sort(((a, b) => b.rate.compareTo(a.rate)));
          break;
        case 1:
          copyCards.sort(((a, b) => a.rate.compareTo(b.rate)));
          break;
        case 2:
          copyCards.sort(((a, b) => b.combo.compareTo(a.combo)));
          break;
        case 3:
          copyCards.sort(((a, b) => a.combo.compareTo(b.combo)));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(20, 5, 50, 2),
            child: Row(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: DropdownButton(
                    items: sortList,
                    value: sortValue,
                    onChanged: (int? value) {
                      setState(() {
                        sortValue = value!;
                        this.sortMusic();
                      });
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(2, 0, 0, 0),
                  child: IconButton(
                    icon: Icon(Icons.label),
                    onPressed: () {
                      setState(() {
                        maxRate = minRate;
                        maxController.text = minRate.toString();
                        sortMusic();
                      });
                    },
                  ),
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(2.5, 0, 0, 0),
                    height: 30,
                    child: SizedBox(
                      width: 55,
                      child: TextFormField(
                        style: TextStyle(fontSize: 12),
                        maxLength: 4,
                        controller: minController,
                        onChanged: (value) {
                          setState(() {
                            try {
                              minRate = double.parse(value);
                            } catch (e) {}
                            sortMusic();
                          });
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'min',
                            counterText: ""),
                      ),
                    )),
                Text("~"),
                Container(
                    margin: EdgeInsets.fromLTRB(2.5, 0, 0, 0),
                    height: 30,
                    child: SizedBox(
                      width: 55,
                      child: TextFormField(
                        style: TextStyle(fontSize: 12),
                        maxLength: 4,
                        controller: maxController,
                        onChanged: (value) {
                          setState(() {
                            try {
                              maxRate = double.parse(value);
                            } catch (e) {}
                            sortMusic();
                          });
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'max',
                            counterText: ""),
                      ),
                    )),
              ],
            ),
          ),
          Expanded(
              child: Scrollbar(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: copyCards.length,
              itemBuilder: (context, index) {
                if (cards[index] != null) {
                  var tmp = copyCards[index];
                  return MusicCard(tmp.title, tmp.genre, tmp.rate, tmp.level,
                      tmp.combo, tmp.diff, true, this.cards);
                } else {
                  return const Text("データなんかねぇよ");
                }
              },
            ),
          ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => SearchPage(
                        music: cards,
                      ))));
        },
      ),
    );
  }
}

List<CardMusic>? addListMusic(Music musicMain) {
  Music music = musicMain;
  List<CardMusic> list = [];
  if (music.data.bas != null) {
    var tmp = music.data.bas!;
    var rate = tmp.rate;
    if (tmp.rate == 0) {
      rate = tmp.level;
    }
    list.add(CardMusic(
      music.meta.title,
      music.meta.genre,
      tmp.level,
      rate,
      tmp.combo,
      'bas',
    ));
  }
  if (music.data.adv != null) {
    var tmp = music.data.adv!;
    var rate = tmp.rate;
    if (tmp.rate == 0) {
      rate = tmp.level;
    }
    list.add(CardMusic(
      music.meta.title,
      music.meta.genre,
      tmp.level,
      rate,
      tmp.combo,
      'adv',
    ));
  }
  if (music.data.exp != null) {
    var tmp = music.data.exp!;
    var rate = tmp.rate;
    if (tmp.rate == 0) {
      rate = tmp.level;
    }
    list.add(CardMusic(
      music.meta.title,
      music.meta.genre,
      tmp.level,
      rate,
      tmp.combo,
      'exp',
    ));
  }
  if (music.data.mas != null) {
    var tmp = music.data.mas!;
    var rate = tmp.rate;
    if (tmp.rate == 0) {
      rate = tmp.level;
    }
    list.add(CardMusic(
      music.meta.title,
      music.meta.genre,
      tmp.level,
      rate,
      tmp.combo,
      'mas',
    ));
    if (music.data.ult != null) {
      var tmp = music.data.ult!;
      var rate = tmp.rate;
      if (tmp.rate == 0) {
        rate = tmp.level;
      }
      list.add(CardMusic(
        music.meta.title,
        music.meta.genre,
        tmp.level,
        rate,
        tmp.combo,
        'ult',
      ));
    }
    if (music.data.we != null) {
      var tmp = music.data.we!;
      var rate = tmp.rate;
      list.add(CardMusic(
        music.meta.title,
        music.meta.genre,
        tmp.level,
        rate,
        tmp.combo,
        'we',
      ));
    }
    return list;
  }
}
