import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'info.dart';
import 'panic.dart';

class Ask extends StatefulWidget {
  const Ask({Key? key}) : super(key: key);

  @override
  AskState createState() => AskState();
}

class AskState extends State<Ask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          appbarWidget(MediaQuery.of(context).size, context, "Ask My Peers"),
          menubarWidget(MediaQuery.of(context).size, context),
          searchBar(context),
          const SizedBox(
            height: 20,
          ),
          const Admin(),
        ],
      ),
    );
  }
}

class Admin extends StatelessWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double widthOfScreen = MediaQuery.of(context).size.width;

    return Flexible(
        child: ListView(children: [
      buildCard('Anonymous', 'assets/Pictures/violent-g34c0f86bd_1920 1.png',
          'My husband of 12 years layed his hands on me for the first time. My family members told me to leave the mariage. I have told the mthat this man just had a minor rage.Everyone thinks I am insane, I really love this man and I wouldn’t want my kids to grow up without a father figure. What do you guys think?'),
      buildCard('Anonymous', 'assets/Pictures/violent-g34c0f86bd_1920 1.png',
          'My husband of 12 years layed his hands on me for the first time. My family members told me to leave the mariage. I have told the mthat this man just had a minor rage.Everyone thinks I am insane, I really love this man and I wouldn’t want my kids to grow up without a father figure. What do you guys think?'),
      buildCard('Anonymous', 'assets/Pictures/violent-g34c0f86bd_1920 1.png',
          'My husband of 12 years layed his hands on me for the first time. My family members told me to leave the mariage. I have told the mthat this man just had a minor rage.Everyone thinks I am insane, I really love this man and I wouldn’t want my kids to grow up without a father figure. What do you guys think?')
    ]));
  }
}

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

Widget buildCard(String title, String imageAsset, String message) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: Card(
        child: ExpansionTile(
      title: Text(title),
      onExpansionChanged: (isExpanded) {},
      initiallyExpanded: true,
      children: [
        Image(image: AssetImage(imageAsset)),
        Text(message),
        TextButton(onPressed: () {}, child: const Text('Comment'))
        // Text()
      ],
    )),
  );
}

void search(String search) {}
