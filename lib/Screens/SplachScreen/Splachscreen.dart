import 'package:flutter/material.dart';
import 'package:to_do/Screens/AuthenticationScreens/LoginYourAccount.dart';
import 'package:to_do/Screens/HomeScreen/home_screen.dart';
import 'package:to_do/Screens/IntroScreens/introscreen_1.dart';
import 'package:to_do/core/cash_helper.dart';

class Splachscreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Splach();
}

class Splach extends State<Splachscreen> {
  static String routeName = "Splach";

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      bool? opened = CashHelper.Getbool1("Intro");
      bool? sign_in = CashHelper.Getbool2("sign_in");

      if (opened == true && sign_in == true) {
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      } else if (opened == true && sign_in == false) {
        Navigator.pushReplacementNamed(context, Login.ruoteName);
      } else {
        Navigator.pushReplacementNamed(context, Intro1.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            Image.asset("assets/images/Evently.png"),
            const Spacer(),
            Image.asset("assets/images/ABDO.png"),
            const SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
}