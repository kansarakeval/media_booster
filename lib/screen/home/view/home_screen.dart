import 'package:flutter/material.dart';
import 'package:media_booster/screen/music/view/music_screen.dart';
import 'package:media_booster/screen/video/view/viedo_screen.dart';
import 'package:media_booster/utils/color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Media Booster",
              style: TextStyle(fontSize: 25, color: yellow),
            ),
            centerTitle: true,
            backgroundColor: black,
            bottom:  TabBar(
              labelColor: yellow,
              unselectedLabelColor: yellow,
              indicatorColor: yellow,
              tabs: [
                Tab(
                  icon: Icon(Icons.music_note,color: yellow),
                  text: "music",
                ),
                Tab(
                  icon: Icon(Icons.music_video_rounded,color: yellow),
                  text: "video",
                )
              ],
            ),
          ),
          backgroundColor: black,
          body:  const TabBarView(
              children: [
                MusicScreen(),
                VideoScreen(),
              ]
          ),
        ),
      ),
    );
  }
}
