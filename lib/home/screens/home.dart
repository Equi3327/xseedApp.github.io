import 'package:flutter/material.dart';
import 'package:tex_markdown/tex_markdown.dart';
import 'package:xseed_app/home/widgets/play_video.dart';
import 'package:xseed_app/models/topic.dart';

class Home extends StatefulWidget {
  const Home({super.key,});


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Lesson _lesson;
  String introBody = "In 1798, Henry Cavendish designed and created an apparatus and experiment to determine the density of the planet and the value of the gravitational constant. His apparatus involved a light, rigid rod about 2-feet long with two small lead spheres attached to the ends. The rod was suspended by a thin wire. When the rod rotated, the twisting of the wire pushed backwards to restore the rod to the original position.";
  String videoUrl = "https://www.youtube.com/watch?v=PHiyQID7SBs&ab_channel=PBSSpaceTime";
  String videoId = "PHiyQID7SBs";
  String formula = r'$F_g =\frac{Gm_1m_2}{r^2}$';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _lesson =
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment:  CrossAxisAlignment.start,
        children: [
          Text("2.2 Centripetal Force"),
          Text("Last Modified: Nov 26, 2019"),
          // ActionItems(),
          Text("Lesson"),
          Divider(thickness: 2.0,),
          Image.asset("assets/images/torsion.png", width: 200.0,height: 200.0,),
          Text(introBody),
          Text("Force of Gravity"),
          Text(introBody),
          Text(introBody),
          Text(introBody),
          Align(alignment:Alignment.center,child: PlayVideo(url: videoId,)),
          Text("Examples"),
          Text("Example 1"),
          Align(
            alignment:Alignment.center,
            child: TexMarkdown(formula,style: const TextStyle(
              color: Colors.red,
            )),
          ),
          Text(introBody),
          Text("Example 2"),
          Text(introBody),
          Align(
            alignment:Alignment.center,
            child: TexMarkdown(formula,style: const TextStyle(
              color: Colors.red,
            )),
          ),
          Text("Summary"),
          Text(introBody),
          Align(
            alignment:Alignment.center,
            child: TexMarkdown(formula,style: const TextStyle(
              color: Colors.red,
            )),
          ),
          Text("Review"),
          Text(introBody),
          Align(
            alignment:Alignment.center,
            child: TexMarkdown(formula,style: const TextStyle(
              color: Colors.red,
            )),
          ),
          Text("Resources",),
          Text(introBody),
          Align(
            alignment:Alignment.center,
            child: TexMarkdown(formula,style: const TextStyle(
              color: Colors.red,
            )),
          ),
          Text("FAQs"),
          Text(introBody),
          Align(
            alignment:Alignment.center,
            child: TexMarkdown(formula,style: const TextStyle(
              color: Colors.red,
            ),
            ),
          ),
        ],
      )
    );
  }
}


