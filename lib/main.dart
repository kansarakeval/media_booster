import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:media_booster/screen/music/provider/music_provider.dart';
import 'package:media_booster/screen/video/provider/video_provider.dart';
import 'package:media_booster/utils/app_routes.dart';
import 'package:media_booster/utils/color.dart';
import 'package:provider/provider.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: black,
    systemNavigationBarColor: black,
  ));
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MusicProvider(),),
        ChangeNotifierProvider(create: (context) => VideoProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        routes: app_routes,
      ),
    ),
  );
}