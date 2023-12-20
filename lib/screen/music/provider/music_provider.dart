import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:media_booster/screen/music/model/music_model.dart';

class MusicProvider with ChangeNotifier
{
  AssetsAudioPlayer player = AssetsAudioPlayer();

  List<MusicModel> musicList = [
    MusicModel(image:"assets/image/e1.jpg", music:"assets/music/music1.mp3", title:"Adele"),
    MusicModel(image:"assets/image/e2.jpg", music:"assets/music/music2.mp3", title:"Bob Dylan"),
    MusicModel(image:"assets/image/e3.jpg", music:"assets/music/music3.mp3", title:"Annie Lennox"),
    MusicModel(image:"assets/image/e4.jpg", music:"assets/music/music4.mp3", title:"Ed Sheeran"),
    MusicModel(image:"assets/image/e5.jpg", music:"assets/music/music5.mp3", title:"Alicia Keys"),
    MusicModel(image:"assets/image/e6.jpg", music:"assets/music/music6.mp3", title:"Ariana Grande"),
    MusicModel(image:"assets/image/e7.jpg", music:"assets/music/music7.mp3", title:"Dua Lipa"),
    MusicModel(image:"assets/image/e8.jpg", music:"assets/music/music8.mp3", title:"Elton John"),
  ];

  bool isPlay = false;
  Duration totalDuration =  Duration(seconds: 0);
  int index = 0;
  int sliderIndex = 0;

  void changeIndexofSlider(int i)
  {
    sliderIndex = i;
    notifyListeners();
  }

  void changIndex(int i)
  {
    index = i;
    notifyListeners();
  }

  void changTotalDuration(Duration d1)
  {
    totalDuration = d1;
    notifyListeners();
  }

  void changeStatus(bool status)
  {
    isPlay = status;
    notifyListeners();
  }

}