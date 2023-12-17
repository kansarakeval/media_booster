import 'package:flutter/material.dart';
import 'package:media_booster/screen/music/provider/music_provider.dart';
import 'package:media_booster/utils/color.dart';
import 'package:provider/provider.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({super.key});

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  MusicProvider? providerr;
  MusicProvider? providerw;
  @override
  Widget build(BuildContext context) {
    providerr = context.read<MusicProvider>();
    providerw = context.watch<MusicProvider>();
    return SafeArea(
      child: Scaffold(
        body: GridView.builder(
          itemCount: providerw!.musicList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                providerr!.changIndex(index);
                Navigator.pushNamed(context, 'musicPlay');
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
                          "${providerw!.musicList[index].image}",
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
                            "${providerw!.musicList[index].title}",
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
