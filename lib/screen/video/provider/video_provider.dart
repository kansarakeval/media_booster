import 'package:flutter/material.dart';
import 'package:media_booster/screen/video/modal/video_modal.dart';

class VideoProvider with ChangeNotifier {
  List<VideoModel> videoList = [
    VideoModel(
        title: "Humraah",
        image: "assets/videoimage/v1.jpg",
        video: "assets/video/viedeo1.mp4"),
    VideoModel(
        title: "Zindagi",
        image: "assets/videoimage/v2.jpg",
        video: "assets/video/viedeo2.mp4"),
    VideoModel(
        title: "Hindustani",
        image: "assets/videoimage/v3.jpg",
        video: "assets/video/viedeo3.mp4"),
    VideoModel(
        title: "Ek Aankh",
        image: "assets/videoimage/v4.jpg",
        video: "assets/video/viedeo4.mp4"),
    VideoModel(
        title: "Baarish",
        image: "assets/videoimage/v5.jpg",
        video: "assets/video/viedeo5.mp4"),
    VideoModel(
        title: "Ik pal",
        image: "assets/videoimage/v6.jpg",
        video: "assets/video/viedeo6.mp4"),
    VideoModel(
        title: "Aeroplane",
        image: "assets/videoimage/v7.jpg",
        video: "assets/video/viedeo7.mp4"),
    VideoModel(
        title: "Awara",
        image: "assets/videoimage/v8.jpg",
        video: "assets/video/viedeo8.mp4"),
  ];
  int index = 0;

  void changIndex(int i) {
    index = i;
    notifyListeners();
  }
}
