import 'package:flutter/material.dart';
import 'package:to_do/Screens/introscreen_1.dart';
import 'package:to_do/core/Colors.dart';

class Splachscreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Splach();
}
class Splach extends State<Splachscreen> {
  static String routeName = "Splach";
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3) , (){
      Navigator.pushReplacementNamed(context, Intro1.routeName);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          children: [
            Spacer(),
            Image.asset("assets/images/Evently.png"),
            Spacer(),
            Image.asset("assets/images/ABDO.png"),
            SizedBox(height: 90,),
          ],
        ),
      ),
    );
  }
}