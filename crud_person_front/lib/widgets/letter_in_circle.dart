import 'package:flutter/material.dart';

class LetterInCircle extends StatelessWidget {
  LetterInCircle({super.key, required this.letter});

  final String letter;

  final Map<String, List<Color>> avatarCircleColor = {
    // 'letter' : [backgroundColor, foregroundColor]
    'A': [Colors.greenAccent, Colors.white],
    'B': [Colors.redAccent, Colors.white],
    'C': [Colors.blueGrey, Colors.white],
    'D': [Colors.blueAccent, Colors.white],
    'E': [Colors.yellowAccent, Colors.black],
    'F': [Colors.brown, Colors.white],
    'G': [Colors.purpleAccent, Colors.white],
    'H': [Colors.purple, Colors.white],
    'I': [Colors.pinkAccent, Colors.white],
    'J': [Colors.green, Colors.white],
    'K': [Colors.greenAccent, Colors.black],
    'L': [Colors.brown, Colors.white],
    'M': [Colors.orange, Colors.white],
    'N': [Colors.lightBlue, Colors.white],
    'O': [Colors.deepPurple, Colors.white],
    'P': [Colors.deepPurpleAccent, Colors.white],
    'Q': [Colors.lightGreenAccent, Colors.black],
    'R': [Colors.lightGreen, Colors.white],
    'S': [Colors.lightBlueAccent, Colors.white],
    'T': [Colors.deepOrange, Colors.white],
    'U': [Colors.lime, Colors.white],
    'V': [Colors.limeAccent, Colors.black],
    'W': [Colors.yellow, Colors.black],
    'X': [Colors.red, Colors.white],
    'Y': [Colors.blue, Colors.white],
    'Z': [Colors.black, Colors.white],
  };

  @override
  Widget build(BuildContext context) {
    List<Color> circleAvatarColorsList = [Colors.black, Colors.white];
    if (avatarCircleColor.containsKey(letter)) {
      circleAvatarColorsList = avatarCircleColor[letter]!;
    }
    return CircleAvatar(
      backgroundColor: circleAvatarColorsList[0],
      foregroundColor: circleAvatarColorsList[1],
      radius: 20,
      child: Text(letter.toUpperCase()),
    );
  }
}
