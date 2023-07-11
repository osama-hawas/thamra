import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class PaiementsScreen extends StatefulWidget {
  const PaiementsScreen({Key? key}) : super(key: key);

  @override
  State<PaiementsScreen> createState() => _PaiementsScreenState();
}

class _PaiementsScreenState extends State<PaiementsScreen> {
  final audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    start: 16,
                    end: 16,
                    bottom: 16,
                  ),
                  child: Row(
                    children: [
                      Text(
                        "الفاتحة",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Theme
                                .of(context)
                                .primaryColor),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () async {
                          await  audioPlayer.play(UrlSource(
                                "https://cdn.islamic.network/quran/audio/128/ar.alafasy/1.mp3"));
                          },
                          icon: Icon(
                            Icons.play_circle_fill_sharp,
                            color: Theme
                                .of(context)
                                .primaryColor,
                            size: 32,
                          )),IconButton(
                          onPressed: () async {
                            await  audioPlayer.pause();
                          },
                          icon: Icon(
                            Icons.pause_circle,
                            color: Theme
                                .of(context)
                                .primaryColor,
                            size: 32,
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
