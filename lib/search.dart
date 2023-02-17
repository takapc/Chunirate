import 'package:chunirate_plus/widget/card.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  SearchPage({
    Key? key,
    required this.music,
  }) : super(key: key);
  final List<CardMusic> music;

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final cont = TextEditingController();
  List<CardMusic> copy = [];

  void runFilter(List<CardMusic> music, String input) {
    copy = [];
    List<CardMusic> cards = [];
    for (CardMusic e in music) {
      if (e.title.contains(input)) {
        cards.add(e);
      }
      setState(() {
        copy = cards;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chunirate v1.3'),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(20, 2, 20, 2),
            child: TextField(
              controller: cont,
              onChanged: (input) => this.runFilter(widget.music, input),
              decoration: const InputDecoration(
                  labelText: "検索", suffixIcon: Icon(Icons.search)),
            ),
          ),
          Expanded(
            child: Scrollbar(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: copy.length,
                itemBuilder: (context, index) {
                  if (copy[index] != null) {
                    var tmp = copy[index];
                    return MusicCard(tmp.title, tmp.genre, tmp.rate, tmp.level,
                        tmp.combo, tmp.diff, true, widget.music);
                  } else {
                    return const Text("データなんかねぇよ");
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
