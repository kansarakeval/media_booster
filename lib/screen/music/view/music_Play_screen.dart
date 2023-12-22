import 'dart:ui' as ui;
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:media_booster/screen/music/provider/music_provider.dart';
import 'package:media_booster/utils/color.dart';
import 'package:provider/provider.dart';

class MusicPlayScreen extends StatefulWidget {
  const MusicPlayScreen({super.key});

  @override
  State<MusicPlayScreen> createState() => _MusicPlayScreenState();
}

class _MusicPlayScreenState extends State<MusicPlayScreen> {
  MusicProvider? providerr;
  MusicProvider? providerw;

  @override
  void initState() {
    super.initState();
    loadSong();
  }

  void loadSong() {
    context.read<MusicProvider>().player.open(
        Audio(
            "${context.read<MusicProvider>().musicList[context.read<MusicProvider>().index].music}"),
        autoStart: context.read<MusicProvider>().isPlay,
        showNotification: true);
    context.read<MusicProvider>().player.current.listen((event) {
      Duration d1 = event!.audio.duration;
      context.read<MusicProvider>().changTotalDuration(d1);
    });
    liveDuration();
  }

  void liveDuration() {
    context.read<MusicProvider>().player.currentPosition.listen((event) {
      if (context.read<MusicProvider>().player.stopped) {
        context.read<MusicProvider>().changeStatus(false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    providerr = context.read<MusicProvider>();
    providerw = context.watch<MusicProvider>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Play Music",
            style: TextStyle(fontSize: 25, color: blue900),
          ),
          iconTheme: IconThemeData(color: blue900),
          centerTitle: true,
          backgroundColor: black,
        ),
        backgroundColor: black,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              "${providerw!.musicList[providerw!.index].image}",
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.black54,
            ),
            // BackdropFilter(
            //   filter: ui.ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
            //   child: Container(
            //     color: Colors.transparent,
            //   ),
            // ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "${providerw!.musicList[providerw!.index].title}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              if (providerr!.index > 0) {
                                providerr!.changIndex(--providerr!.index);
                              }
                              loadSong();
                            },
                            icon: Icon(
                              Icons.skip_previous,
                              color: white,
                              size: 50,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          IconButton(
                            onPressed: () {
                              if (providerr!.isPlay == false) {
                                context.read<MusicProvider>().player.play();
                                providerr!.changeStatus(true);
                              } else {
                                context.read<MusicProvider>().player.pause();
                                providerr!.changeStatus(false);
                              }
                            },
                            icon: Icon(
                              providerw!.isPlay
                                  ? Icons.pause
                                  : Icons.play_circle,
                              color: white,
                              size: 50,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          IconButton(
                            onPressed: () {
                              if (providerr!.index <
                                  providerr!.musicList.length - 1) {
                                providerr!.changIndex(++providerr!.index);
                              }
                              loadSong();
                            },
                            icon: Icon(
                              Icons.skip_next,
                              color: white,
                              size: 50,
                            ),
                          ),
                        ],
                      ),
                      PlayerBuilder.currentPosition(
                        player: context.read<MusicProvider>().player,
                        builder: (context, position) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Slider(
                                min: 0,
                                value: position.inSeconds.toDouble(),
                                max: providerr!.totalDuration.inSeconds.toDouble(),
                                activeColor: blue900,
                                onChanged: (value) {
                                  context.read<MusicProvider>().player.seek(Duration(
                                    seconds: value.toInt(),
                                  ));
                                },
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      "${position.toString().split(".")[0]}",
                                      style: TextStyle(color: white),
                                    ),
                                    Spacer(),
                                    Text(
                                      "${providerw!.totalDuration.toString().split(".")[0]}",
                                      style: TextStyle(color: white),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20,),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.queue_music,color: white,),
                                    Spacer(),
                                    Icon(Icons.favorite_border,color: white,),
                                    Spacer(),
                                    Icon(Icons.share,color: white,),
                                    Spacer(),
                                    Icon(Icons.link_outlined,color: white,),
                                    Spacer(),
                                    Icon(Icons.playlist_add,color: white,),
                                  ],
                                ),
                              ),

                            ],
                          );
                        },
                      ),

                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
