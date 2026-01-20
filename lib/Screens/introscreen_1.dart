import 'package:flutter/material.dart';
import 'package:to_do/Screens/IntroScreens/introscreenfirst.dart';
import 'package:to_do/core/Colors.dart';

class Introscreen1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Intro1();
}

class Intro1 extends State<Introscreen1> {
  static String routeName = "IntroScreen1";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/images/Evently.png", height: 300, width: 150),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset("assets/images/Intro1.png", height: 390, width: 390)),
            SizedBox(height: 30),
            Text(
              "Personalize Your Experience",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1C1C1C),
              ),
            ),
            SizedBox(height: 15),
            Text(
              "Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xFF686868),
              ),
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Text("Language", style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold , color: AppColors.maincolor)),
                Spacer(),
                Row(children: [Text("English"), SizedBox(width: 10,), Text("Arabic")]),
              ],
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Text("Theme", style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold , color: AppColors.maincolor)),
                Spacer(),
                Row(
                  children: [
                    ImageIcon(AssetImage("assets/images/sun.png")),
                    SizedBox(width: 10,),
                    ImageIcon(AssetImage("assets/images/moon.png")),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  height: 55,
                  minWidth: 400,
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, IntroscreenFirst.routeName);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  color: AppColors.maincolor,
                  child: Text(
                    "Let’s start",
                    style: TextStyle(
                        fontSize: 24,
                        color: AppColors.inputs),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
