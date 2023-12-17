import 'package:flutter/material.dart';
import 'package:media_booster/screen/home/view/home_screen.dart';
import 'package:media_booster/screen/music/view/music_Play_screen.dart';

Map<String,WidgetBuilder> app_routes = {
  '/':(context) => const HomeScreen(),
  'musicPlay': (context) => const MusicPlayScreen(),
};