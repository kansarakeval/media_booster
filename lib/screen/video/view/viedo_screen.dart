import 'package:carousel_slider/carousel_slider.dart';
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
        body: Column(
          children: [
            SizedBox(
              height: 200,
              child: CarouselSlider.builder(
                itemCount: 5,
                itemBuilder: (context, index, realIndex) {
                  return Container(
                    height: 100,
                    width: MediaQuery.sizeOf(context).width,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        InkWell(
                          onTap: () {
                            provider!.changIndex(index);
                            Navigator.pushNamed(context, 'videoPlay');
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              "${providew!.videoList[index].image}",
                              fit: BoxFit.cover,
                              height: double.infinity,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${providew!.videoList[index].title}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  autoPlayInterval: Duration(seconds: 2),
                  onPageChanged: (index, reason) {
                    provider!.changeIndexofSlider(index);
                  },
                  initialPage: providew!.sliderIndex,
                ),
              ),
            ),
            SizedBox(
              height: 20,
              width: MediaQuery.sizeOf(context).width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) => indecaterTile(index),),
              ),
            ),
            Expanded(
              child: GridView.builder(
                itemCount: providew!.videoList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
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
                                  style: TextStyle(color: Colors.white,fontSize: 18),
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
            ),
          ],
        ),
          backgroundColor: black,
      ),
    );
  }

  Container indecaterTile(int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3),
      height: 10,
      width: 10,
      decoration: BoxDecoration(shape: BoxShape.circle,color: index==providew!.sliderIndex?blue900:white),
    );
  }
}
