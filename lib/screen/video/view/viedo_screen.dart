import 'package:flutter/material.dart';
import 'package:media_booster/screen/video/provider/video_provider.dart';
import 'package:media_booster/utils/color.dart';
import 'package:provider/provider.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  VideoProvider? provider;
  VideoProvider? providew;
  @override
  Widget build(BuildContext context) {
    provider = context.read<VideoProvider>();
    providew = context.watch<VideoProvider>();

    return SafeArea(
      child: Scaffold(
        body: GridView.builder(
          itemCount: providew!.videoList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                provider!.changIndex(index);
                Navigator.pushNamed(context, 'videoPlay');
              },
              child: Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: white,
                  border: Border.all(color: yellow),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        "${providew!.videoList[index].image}",
                        fit: BoxFit.cover,
                        height: double.infinity,
                        width: double.infinity,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${providew!.videoList[index].title}",
                            style: TextStyle(color: Colors.white,fontSize: 20),
                          ),
                          Row(
                            children: [
                              Text(
                                "4.5",
                                style: TextStyle(color: Colors.white,),
                              ),
                              SizedBox(width: 5,),
                              Icon(Icons.star,color: white,size: 15,),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
          backgroundColor: Colors.black,
      ),
    );
  }
}
