import 'package:chunirate_plus/calc.dart';
import 'package:chunirate_plus/widget/favIcon.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:hive/hive.dart';

class MusicCard extends StatelessWidget {
  final String title;
  final String genre;
  final String diff;
  final double rate;
  final double level;
  final int combo;
  final bool calc;
  final List<CardMusic> cards;

  MusicCard(this.title, this.genre, this.rate, this.level, this.combo,
      this.diff, this.calc, this.cards);

  //レート配色
  final Rainbow = const TextStyle(color: Color.fromARGB(255, 0, 250, 154));
  final Platina = const TextStyle(color: Color.fromARGB(255, 162, 149, 34));
  final Gold = const TextStyle(color: Color.fromARGB(255, 134, 117, 71));
  final Silver = const TextStyle(color: Color.fromARGB(255, 192, 192, 192));
  final Copper = const TextStyle(color: Color.fromARGB(255, 205, 133, 63));
  final Purple = const TextStyle(color: Color.fromARGB(255, 128, 0, 128));
  final Red = const TextStyle(color: Color.fromARGB(255, 255, 0, 0));
  final Orange = const TextStyle(color: Color.fromARGB(255, 255, 165, 0));
  final Green = const TextStyle(color: Color.fromARGB(255, 0, 128, 0));

  //ジャンル配色
  final original = const Color(0xFFf08080);
  final gekimai = const Color(0xFFffff80);
  final irodori = const Color(0xFFfffacd);
  final variety = const Color(0xFF98fb98);
  final touhou = const Color(0xFF87cefa);
  final niconico = const Color(0xFFdda0dd);
  final anime = const Color(0xFFffa0c0);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (this.calc) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CalcPage(
                      title: title,
                      genre: genre,
                      rate: rate,
                      level: level,
                      combo: combo,
                      diff: diff,
                      music: cards)));
        }
      },
      child: Card(
        child: SizedBox(
          child: ListTile(
              dense: true,
              leading: Image.asset(
                "lib/assets/logos/${diff}.png",
              ),
              title: AutoSizeText(
                title,
                style: TextStyle(fontSize: 10),
                maxLines: 2,
              ),
              trailing: favIcon(diff: this.diff, title: this.title),
              subtitle: Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  children: [
                    Text("${rate} ", style: _getRateStyle(rate)),
                    Text("${combo}", style: _getComboStyle(combo)),
                    Text("combo"),
                    const Expanded(
                      child: SizedBox(),
                    ),
                    Container(
                        padding: EdgeInsets.all(2.5),
                        color: original,
                        child: Center(
                          child: Text(genre),
                        ))
                  ],
                ),
              )),
        ),
      ),
    );
  }

  TextStyle? _getRateStyle(double rate) {
    TextStyle? style;
    if (rate >= 15.0) {
      style = Rainbow;
    } else if (rate >= 14.0) {
      style = Platina;
    } else if (rate >= 13.0) {
      style = Gold;
    } else if (rate >= 12.0) {
      style = Silver;
    } else if (rate >= 11.0) {
      style = Copper;
    } else if (rate >= 10.0) {
      style = Purple;
    } else if (rate >= 7.0) {
      style = Red;
    } else if (rate >= 5.0) {
      style = Orange;
    } else if (rate <= 3.0) {
      style = Green;
    }
    return style;
  }

  TextStyle? _getComboStyle(int combo) {
    TextStyle? style;
    if (combo >= 4000) {
      style = TextStyle(color: Colors.black);
    } else if (combo >= 3000) {
      style = TextStyle(color: Colors.purple);
    } else if (combo >= 2000) {
      style = TextStyle(color: Colors.red);
    } else if (combo >= 1000) {
      style = TextStyle(color: Colors.orange);
    } else {
      style = TextStyle(color: Colors.green);
    }
    return style;
  }
}

class CardMusic {
  String title;
  String genre;
  double level;
  double rate;
  int combo;
  String diff;
  CardMusic(
      this.title, this.genre, this.level, this.rate, this.combo, this.diff);
}
