import 'package:flutter/material.dart';
import 'package:to_do/Screens/IntroScreens/introscreenbetwen.dart';
import 'package:to_do/core/Colors.dart';

class IntroscreenFirst extends StatelessWidget {
  static String routeName = "IntroscreenFirst";
  final String image;
  final String titele;
  final String desc;

  IntroscreenFirst({
    super.key,
    required this.image,
    required this.titele,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Image.asset(
          "assets/images/Evently.png",
          height: 300,
          width: 150,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16 , horizontal: 16),
            child: InkWell(
              onTap: (){},
              child: Container(
                height: 32,
                width: 63,
                color: AppColors.inputs,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Skip",
                    style: TextStyle(color: AppColors.maincolor , fontSize: 14 , fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset(image, height: 390, width: 390)),
            SizedBox(height: 30),
            Text(
              titele,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1C1C1C),
              ),
            ),
            SizedBox(height: 15),
            Text(
              desc,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xFF686868),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.all(16),
              child: Center(
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context,Introscreenbetwen.routeName);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)
                  ),
                  height: 50,
                  minWidth: double.infinity,
                  color: AppColors.maincolor,
                  child: Text(
                    "Next",
                    style: TextStyle(fontSize: 24, color: AppColors.inputs),
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
