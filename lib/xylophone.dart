import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Xylophone extends StatefulWidget {
  const Xylophone({super.key});

  @override
  State<Xylophone> createState() => _XylophoneState();
}

class _XylophoneState extends State<Xylophone> {
  void playMusic(int x) {
    final player = AudioPlayer();
    player.play(AssetSource('note$x.wav'));
  }

  Widget mainBox(
      {required double deviceHeight,
      required Color color,
      required int audioNum}) {
    return GestureDetector(
      onTap: () {
        playMusic(audioNum);
      },
      child: Container(
        color: color,
        height: deviceHeight * 0.14285714,
        width: double.infinity,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: 7,
            itemBuilder: (context, index) {
              double deviceHeight = MediaQuery.of(context).size.height;
              // Color color = Colors.primaries[index];
              List<Color> colors = [
                const Color(0xffF44236),
                const Color(0xffFF9800),
                const Color(0xffFEEB3B),
                const Color(0xff4CAF50),
                const Color(0xff049588),
                const Color(0xff2296F3),
                const Color(0xff9C26B0),
              ];
              int audioNum = index + 1;
              return mainBox(
                  audioNum: audioNum,
                  deviceHeight: deviceHeight,
                  color: colors[index]);
            }));
  }
}
