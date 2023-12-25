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
              style: TextStyle(fontSize: 25, color: blue900),
            ),
            centerTitle: true,
            backgroundColor: black,
            bottom:  TabBar(
              labelColor: blue900,
              unselectedLabelColor: blue900,
              indicatorColor: blue900,

              tabs: [
                Tab(
                  icon: Icon(Icons.music_note,color: blue900),
                  text: "music",
                ),
                Tab(
                  icon: Icon(Icons.music_video_rounded,color: blue900),
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
