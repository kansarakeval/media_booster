import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:media_booster/screen/video/provider/video_provider.dart';
import 'package:media_booster/utils/color.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class VideoPlayScreen extends StatefulWidget {
  const VideoPlayScreen({super.key});

  @override
  State<VideoPlayScreen> createState() => _VideoPlayScreenState();
}

class _VideoPlayScreenState extends State<VideoPlayScreen> {
  VideoProvider? providerr;
  VideoProvider? providerw;

  VideoPlayerController? videoPlayerController;
  ChewieController? controller;

  @override
  void initState() {
    super.initState();
    videoPlayerController =
    VideoPlayerController.asset("${context.read<VideoProvider>().videoList[context.read<VideoProvider>().index].video}")
      ..initialize().then((value) {
        setState(() {});
      });
    controller = ChewieController(videoPlayerController: videoPlayerController!);
  }

  @override
  Widget build(BuildContext context) {
    providerr = context.read<VideoProvider>();
    providerw = context.watch<VideoProvider>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Video Play",
            style: TextStyle(fontSize: 25, color: yellow),
          ),
          centerTitle: true,
          backgroundColor: black,
        ),
        backgroundColor: black,
        body: Center(
          child: Container(
            height: 200,
            width: double.infinity,
            child: Chewie(controller: controller!,),
          ),
        ),
      ),
    );
  }
}
