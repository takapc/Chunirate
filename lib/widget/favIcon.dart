import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class favIcon extends StatefulWidget {
  final String diff;
  final String title;

  @override
  _favIconState createState() => _favIconState();
  favIcon({required this.diff, required this.title});
}

class _favIconState extends State<favIcon> {
  bool isPressed = false;
  IconData icon = Icons.favorite;
  MaterialColor color = Colors.grey;
  List<MaterialColor> cs = [Colors.grey, Colors.red];
  @override
  void initState() {
    super.initState();
    setColor();
  }

  void setColor() {
    Box box = Hive.box('favorite_musics');
    if (box.get('${widget.diff}.${widget.title}') == '0') {
      color = cs[0];
    } else if (box.get('${widget.diff}.${widget.title}') == '1') {
      color = cs[1];
    } else {
      debugPrint('Error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        icon,
        size: 20,
        color: color,
      ),
      onPressed: () {
        isPressed = !isPressed;
        Box box = Hive.box('favorite_musics');
        if (box.get('${widget.diff}.${widget.title}') == '0') {
          box.put('${widget.diff}.${widget.title}', '1');
        } else if (box.get('${widget.diff}.${widget.title}') == '1') {
          box.put('${widget.diff}.${widget.title}', '0');
        }
        debugPrint(
            widget.title + ' : ' + box.get('${widget.diff}.${widget.title}')!);
        setState(() {
          setColor();
        });
      },
    );
  }
}
