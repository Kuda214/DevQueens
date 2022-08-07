import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Info extends StatefulWidget {
  const Info({Key? key}) : super(key: key);

  @override
  InfoState createState() => InfoState();
}

class InfoState extends State<Info> {
  late YoutubePlayerController firstController;
  late YoutubePlayerController secondController;
  late YoutubePlayerController thirdController;
  late YoutubePlayerController forthController;
  late YoutubePlayerController fifthController;
  late YoutubePlayerController sixthController;

  @override
  void initState() {
    super.initState();
    const firstUrl = 'https://youtu.be/F37Sr98uA7I';
    firstController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(firstUrl)!,
      flags: const YoutubePlayerFlags(mute: false, loop: true, autoPlay: false),
    );
    const secondUrl = 'https://youtu.be/adUToRtRkaY';
    secondController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(secondUrl)!,
      flags: const YoutubePlayerFlags(mute: false, loop: true, autoPlay: false),
    );
    const thirdUrl = 'https://youtu.be/6Rfn94k717U';
    thirdController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(thirdUrl)!,
      flags: const YoutubePlayerFlags(mute: false, loop: true, autoPlay: false),
    );
    const forthUrl = 'https://youtu.be/IU1i2IlkLbU';
    forthController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(forthUrl)!,
      flags: const YoutubePlayerFlags(mute: false, loop: true, autoPlay: false),
    );
    const fifthUrl = 'https://youtu.be/V1yW5IsnSjo';
    fifthController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(fifthUrl)!,
      flags: const YoutubePlayerFlags(mute: false, loop: true, autoPlay: false),
    );
    const sixthUrl = 'https://youtu.be/GDclMXpjvj8';
    sixthController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(sixthUrl)!,
      flags: const YoutubePlayerFlags(mute: true, loop: true, autoPlay: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    double widthOfScreen = MediaQuery.of(context).size.width;
    int crossAxis = 2;
    if (widthOfScreen < 400.0) {
      crossAxis = 2;
    } else {
      crossAxis = 3;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          appbarWidget(
              MediaQuery.of(context).size, context, "Information Center"),
          menubarWidget(MediaQuery.of(context).size, context),
          searchBar(context),
          const SizedBox(
            height: 20,
          ),
          Flexible(
            child: GridView.count(
              childAspectRatio: 1.0,
              padding: const EdgeInsets.only(left: 16, right: 16),
              crossAxisCount: crossAxis,
              crossAxisSpacing: 18,
              mainAxisSpacing: 18,
              children: <Widget>[
                GestureDetector(
                  onTap: () {},
                  child: YoutubePlayerBuilder(
                    player: YoutubePlayer(controller: firstController),
                    builder: (context, player) => Container(child: player),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => const Panic()),
                    // );
                  },
                  child: YoutubePlayerBuilder(
                    player: YoutubePlayer(controller: secondController),
                    builder: (context, player) => Container(child: player),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => const ___),
                    // );
                  },
                  child: YoutubePlayerBuilder(
                    player: YoutubePlayer(controller: thirdController),
                    builder: (context, player) => Container(child: player),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => const ___),
                    // );
                  },
                  child: YoutubePlayerBuilder(
                    player: YoutubePlayer(controller: forthController),
                    builder: (context, player) => Container(child: player),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => const ___),
                    // );
                  },
                  child: YoutubePlayerBuilder(
                    player: YoutubePlayer(controller: fifthController),
                    builder: (context, player) => Container(child: player),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    //print("Container clicked");
                  },
                  child: YoutubePlayerBuilder(
                    player: YoutubePlayer(controller: sixthController),
                    builder: (context, player) => Container(child: player),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class Admin extends StatelessWidget {
//   const Admin({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     double widthOfScreen = MediaQuery.of(context).size.width;
//     int crossAxis = 2;
//     if (widthOfScreen < 400.0) {
//       crossAxis = 2;
//     } else {
//       crossAxis = 3;
//     }

//     return Flexible(
//       child: GridView.count(
//         childAspectRatio: 1.0,
//         padding: const EdgeInsets.only(left: 16, right: 16),
//         crossAxisCount: crossAxis,
//         crossAxisSpacing: 18,
//         mainAxisSpacing: 18,
//         children: <Widget>[
//           GestureDetector(
//             onTap: () {},
//             child: YoutubePlayerBuilder(
//               player: YoutubePlayer(controller: firstController),
//               builder: (context,player) => Container(
//                 decoration: BoxDecoration(
//                     color: Colors.pink[100],
//                     borderRadius: BorderRadius.circular(10)),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Image.asset(
//                       "assets/Pictures/play.png",
//                       width: 42,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           GestureDetector(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const Panic()),
//               );
//             },
//             child: Container(
//               decoration: BoxDecoration(
//                   color: Colors.pink[100],
//                   borderRadius: BorderRadius.circular(10)),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Image.asset(
//                     "assets/Pictures/play.png",
//                     width: 42,
//                   ),
//                   const SizedBox(
//                     height: 8,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           GestureDetector(
//             onTap: () {
//               // Navigator.push(
//               //   context,
//               //   MaterialPageRoute(builder: (context) => const ___),
//               // );
//             },
//             child: Container(
//               decoration: BoxDecoration(
//                   color: Colors.pink[100],
//                   borderRadius: BorderRadius.circular(10)),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Image.asset(
//                     "assets/Pictures/play.png",
//                     width: 42,
//                   ),
//                   const SizedBox(
//                     height: 8,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           GestureDetector(
//             onTap: () {
//               // Navigator.push(
//               //   context,
//               //   MaterialPageRoute(builder: (context) => const ___),
//               // );
//             },
//             child: Container(
//               decoration: BoxDecoration(
//                   color: Colors.pink[100],
//                   borderRadius: BorderRadius.circular(10)),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Image.asset(
//                     "assets/Pictures/play.png",
//                     width: 42,
//                   ),
//                   const SizedBox(
//                     height: 8,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           GestureDetector(
//             onTap: () {
//               // Navigator.push(
//               //   context,
//               //   MaterialPageRoute(builder: (context) => const ___),
//               // );
//             },
//             child: Container(
//               decoration: BoxDecoration(
//                   color: Colors.pink[100],
//                   borderRadius: BorderRadius.circular(10)),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Image.asset(
//                     "assets/Pictures/play.png",
//                     width: 42,
//                   ),
//                   const SizedBox(
//                     height: 8,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           GestureDetector(
//             onTap: () {
//               //print("Container clicked");
//             },
//             child: Container(
//               decoration: BoxDecoration(
//                   color: Colors.pink[100],
//                   borderRadius: BorderRadius.circular(10)),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Image.asset(
//                     "assets/Pictures/play.png",
//                     width: 42,
//                   ),
//                   const SizedBox(
//                     height: 8,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

Widget appbarWidget(Size size, BuildContext context, String groupName) {
  return Container(
    padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 6),
    width: size.width,
    height: 100,
    color: Colors.pink[100],
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          groupName,
          style: const TextStyle(fontSize: 25, color: Colors.white),
        ),
      ],
    ),
  );
}

Widget menubarWidget(Size size, BuildContext context) {
  return Container(
    // padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 6),
    width: size.width,
    height: 25,
    color: Colors.grey[300],
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            "Info Center    Health    Alert    About Us  ",
            style: TextStyle(fontSize: 10, color: Colors.white),
          ),
        ),
      ],
    ),
  );
}

@override
Widget searchBar(BuildContext context) {
  return Material(
      child: SingleChildScrollView(
          child: Column(children: <Widget>[
    Container(
      margin: const EdgeInsets.all(15),
      height: 50,
      child: TextField(
        onChanged: (value) => search(value),
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(0),
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.black45,
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 1.0),
              borderRadius: BorderRadius.circular(50),
            ),
            hintStyle: const TextStyle(
              fontSize: 14,
            ),
            hintText: "Search..."),
      ),
    ),
  ])));
}

void search(String search) {}
