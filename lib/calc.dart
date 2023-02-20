import 'dart:ffi';
import 'dart:math';

import 'package:chunirate_plus/model/music.dart';
import 'package:chunirate_plus/score.dart';
import 'package:chunirate_plus/widget/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CalcPage extends StatefulWidget {
  CalcPage({
    Key? key,
    required this.title,
    required this.genre,
    required this.rate,
    required this.level,
    required this.combo,
    required this.diff,
    required this.music,
  }) : super(key: key);

  final String title;
  final String genre;
  final double rate;
  final double level;
  final int combo;
  final String diff;
  final List<CardMusic> music;

  @override
  _CalcPageState createState() => _CalcPageState();
}

class _CalcPageState extends State<CalcPage> {
  int score = 1007500;
  double rate = 0;
  var scoreContoroller = TextEditingController();

  void changeRate(score) {
    rate = getRate(rate, this.score);
  }

  List<CardMusic> getSameNameMusic(
      String name, List<CardMusic> list, String diff) {
    List<CardMusic> sameLevelMusic = [];
    for (CardMusic e in list) {
      if (e.title == name && e.diff != diff) {
        sameLevelMusic.add(e);
      }
    }
    return sameLevelMusic;
  }

  //理論値 101%
  //SS 100%

  List<Score> getKyoyouScore(int combo, int tragetScore) {
    return Score(combo, 0, 0, 0, combo).getKyoyouByCombo(tragetScore);
  }

  List<DataRow> getRow() {
    List<DataRow> rows = [];
    var rowKyoyous = getKyoyouScore(widget.combo, score);
    for (Score e in rowKyoyous) {
      rows.add(DataRow(cells: [
        DataCell(Container(
          alignment: Alignment.center,
          child: Text(
            "${e.justice}",
          ),
        )),
        DataCell(Container(
          alignment: Alignment.center,
          child: Text(
            "${e.attack}",
          ),
        )),
        DataCell(Container(
          alignment: Alignment.center,
          child: Text(
            "${e.miss}",
          ),
        )),
      ]));
    }
    return rows;
  }

  List<CardMusic> sameNameMusic = [];
  List<Score> kyoyous = [];

  int _calcScore = 1007500;

  @override
  void initState() {
    sameNameMusic = getSameNameMusic(widget.title, widget.music, widget.diff);
    kyoyous = getKyoyouScore(widget.combo, score);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
            appBar: AppBar(
              title: const Text('詳細'),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 100,
                        width: double.infinity,
                        margin: const EdgeInsets.fromLTRB(100, 0, 100, 0),
                        alignment: Alignment.center,
                        child: Center(
                            child: TextField(
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(hintText: 'スコアを入力'),
                          style: TextStyle(fontSize: 35),
                          onChanged: (s) {
                            setState(() {
                              try {
                                _calcScore = int.parse(s);
                                // ignore: empty_catches
                              } catch (e) {}
                            });
                            if (_calcScore < 1000000) {
                            } else {
                              setState(() {
                                score = _calcScore;
                              });
                            }
                          },
                        )),
                      ),
                      MusicCard(
                          widget.title,
                          widget.genre,
                          widget.rate,
                          widget.level,
                          widget.combo,
                          widget.diff,
                          false,
                          widget.music),
                      const Icon(Icons.arrow_drop_down),
                      MusicCard(
                          widget.title,
                          widget.genre,
                          getRate(widget.rate, _calcScore),
                          widget.level,
                          widget.combo,
                          widget.diff,
                          false,
                          widget.music),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                        padding: const EdgeInsets.all(5),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 143, 210, 240),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text(
                          "Other Levels",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: sameNameMusic.length,
                        itemBuilder: (context, index) {
                          var tmp = sameNameMusic[index];
                          return MusicCard(
                              tmp.title,
                              tmp.genre,
                              tmp.rate,
                              tmp.level,
                              tmp.combo,
                              tmp.diff,
                              true,
                              widget.music);
                        },
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(50, 0, 50, 10),
                    padding: const EdgeInsets.all(5),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 143, 210, 240),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text(
                      "許容値",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: SingleChildScrollView(
                        child: DataTable(columns: const [
                          DataColumn(
                            label: Text(
                              '　JUSTICE',
                              style: TextStyle(color: Colors.brown),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              '　ATTACK',
                              style: TextStyle(color: Colors.green),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              '　MISS',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 172, 172, 172)),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ], rows: getRow()),
                      )),
                ],
              ),
            )));
  }
}

class Score {
  int critical;
  int justice;
  int attack;
  int miss;
  int combo;
  Score(this.critical, this.justice, this.attack, this.miss, this.combo);

  int getScore() {
    var totalNotes = combo;
    var ns = 1000000 / totalNotes;
    var justiceLost = (ns * 0.01);
    var attackLost = (ns * 0.51);
    var missLost = (ns * 1.01);
    var totalScore = 1010000;
    totalScore -=
        (justice * justiceLost + attack * attackLost + miss * missLost).ceil();
    return totalScore;
  }

  List<Score> getKyoyouByCombo(int target) {
    if (combo == 0) {
      return [Score(combo, 0, 0, 0, combo)];
    }
    var ns = 1000000 / combo;
    var justiceLost = ns * 0.01;
    var attackLost = ns * 0.51;
    var missLost = ns * 1.01;
    var limit = 1010000 - target;
    var maxMiss = limit ~/ missLost;
    List<Score> scores = [];
    for (int nowMiss = 0; nowMiss < maxMiss + 1; nowMiss++) {
      var limitAttack = limit - nowMiss * missLost;
      var maxAttack = limitAttack ~/ attackLost;
      var limitJustice = limitAttack - maxAttack * attackLost;
      var maxJustice = limitJustice ~/ justiceLost;
      var critical = combo - maxJustice - maxAttack - nowMiss;
      var s = Score(critical, maxJustice, maxAttack, nowMiss, combo);
      scores.add(s);
    }
    return scores;
  }

  double getNormalScore() {
    return 1000000 / combo;
  }
}

class InitTextField extends StatelessWidget {
  InitTextField(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: TextEditingController(text: title),
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      style: TextStyle(fontSize: 30),
    );
  }
}

double getRate(double rate, int score) {
  double n = 0;
  if (score < 975000) {
    if (score >= 800000) n = (rate - 5) / 2;
    if (score >= 900000) n = rate - 5;
    if (score >= 925000) n = rate - 3;
  } else {
    n = rate + (score - 975000) ~/ 2500 * 0.1; //S・S+の場合
    if (score >= 1000000) n = rate + (score - 1000000) ~/ 1000 * 0.1 + 1; //SS
    if (score >= 1005000) n = rate + (score - 1005000) ~/ 500 * 0.1 + 1.5; //SS+
    if (score >= 1007500) n = rate + (score - 1007500) ~/ 100 * 0.01 + 2; //SSS
    if (score >= 1009000) n = rate + 2.15; //SSS+
  }
  return double.parse(n.toStringAsFixed(2));
}
