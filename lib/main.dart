import 'package:flutter/material.dart';
import 'package:to_do/Screens/AuthenticationScreens/CreateAccount.dart';
import 'package:to_do/Screens/AuthenticationScreens/LoginYourAccount.dart';
import 'package:to_do/Screens/AuthenticationScreens/forgeting_pass.dart';
import 'package:to_do/Screens/IntroScreens/introscreenbetwen.dart';
import 'package:to_do/Screens/IntroScreens/introscreenfirst.dart';
import 'package:to_do/Screens/IntroScreens/introscreenlast.dart';
import 'package:to_do/Screens/Splachscreen.dart';
import 'package:to_do/Screens/introscreen_1.dart';

void main (){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Splach.routeName,
      routes: {
        Splach.routeName : (context)=>Splachscreen(),
        Intro1.routeName : (context)=>Introscreen1(),
        IntroscreenFirst.routeName : (context)=>IntroscreenFirst(
          image: "assets/images/Intro2.png",
          titele: "Find Events That Inspire You",
          desc:
          "Dive into a world of events crafted to fit your unique interests. Whether you're into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.",
        ),
        Introscreenbetwen.routeName : (context)=>Introscreenbetwen(
          image: "assets/images/Intro3.png",
          titele: "Effortless Event Planning",
          desc:
          "Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.",
        ),
        Introscreenlast.routeName : (context)=> Introscreenlast(
          image: "assets/images/Intro4.png",
          titele: "Connect with Friends & Share Moments",
          desc:
          "Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.",
        ),
        create.routeName : (context) =>Createaccount(),
        Login.ruoteName : (context) => Loginyouraccount(),
        ForgetPass.routeName : (context) =>ForgetingPass(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}