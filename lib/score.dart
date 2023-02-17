import 'package:flutter/material.dart';

List<DropdownMenuItem<int>> scoreList = List.from([
  create(0, 'D'),
  create(500000, 'C'),
  create(600000, 'B'),
  create(700000, 'BB'),
  create(800000, 'BBB'),
  create(900000, 'A'),
  create(925000, 'AA'),
  create(950000, 'AAA'),
  create(975000, 'S'),
  create(990000, 'S+'),
  create(1000000, 'SS'),
  create(1005000, 'SS+'),
  create(1007500, 'SSS'),
  create(1009000, 'SSS+'),
  create(1010000, 'AJC'),
].reversed);

List<DropdownMenuItem<double>> levelList = List.from([
  level('1', 1),
  level('2', 2),
  level('3', 3),
  level('4', 4),
  level('5', 5),
  level('6', 6),
  level('7', 7),
  level('7+', 7.5),
  level('8', 8),
  level('8+', 8.5),
  level('9', 9),
  level('9+', 9.5),
  level('10', 10),
  level('10+', 10.5),
  level('11', 11),
  level('11+', 11.5),
  level('12', 12),
  level('12+', 12.5),
  level('13', 13),
  level('13+', 13.5),
  level('14', 14),
  level('14+', 14.5),
  level('15', 15),
  level('15+', 15.5),
].reversed);
DropdownMenuItem<int> create(int score, String text) {
  return DropdownMenuItem(
      value: score,
      child: Center(
          child: Align(
        alignment: Alignment.center,
        child: Text(text),
      )));
}

DropdownMenuItem<double> level(String lv, double rate) {
  return DropdownMenuItem(
    value: rate,
    child: Center(
      child: Align(
        alignment: Alignment.center,
        child: Text(lv),
      ),
    ),
  );
}
