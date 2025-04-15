import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

final player = AudioPlayer();

class ColorsPage extends StatelessWidget {
  const ColorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Xylophone",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Tile(color: Colors.red, noteSound: 'note1.wav'),
            Tile(color: Colors.orange, noteSound: 'note2.wav'),
            Tile(color: Colors.yellow, noteSound: 'note3.wav'),
            Tile(color: Colors.green, noteSound: 'note4.wav'),
            Tile(color: Colors.blue, noteSound: 'note5.wav'),
            Tile(color: Colors.purple, noteSound: 'note6.wav'),
            Tile(color: Colors.pink, noteSound: 'note7.wav'),
          ],
        ),
      ),
    );
  }
}

class Tile extends StatelessWidget {
  Tile({super.key, required this.color, required this.noteSound});

  Color color;
  String noteSound;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(

        onTap: ()async
    {

      await player.setAsset('assets/audio/$noteSound');
      player.play();
        },
        child: Container(
          padding: EdgeInsets.only(left: 25, right: 25),
          color: color,
          height: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.circle, size: 30),
              Icon(Icons.circle, size: 30),
            ],
          ),
        ),
      ),
    );
  }
}
