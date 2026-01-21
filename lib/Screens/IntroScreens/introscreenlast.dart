import 'package:flutter/material.dart';
import 'package:to_do/Screens/AuthenticationScreens/CreateAccount.dart';
import 'package:to_do/Screens/IntroScreens/introscreenbetwen.dart';
import 'package:to_do/core/Colors.dart';

class Introscreenlast extends StatelessWidget {
  static String routeName = "Introscreenlast";
  final String image;
  final String titele;
  final String desc;

  Introscreenlast({
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
        leading: Padding(
          padding: EdgeInsets.symmetric(vertical: 16 , horizontal: 16),
          child: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              height: 32,
              width: 32,
              color: AppColors.inputs,
              child: Align(
                  alignment: Alignment.center,
                  child: Icon(Icons.arrow_back_ios_new , color: AppColors.maincolor, size: 24,)
              ),
            ),
          ),
        ),
      ),
      backgroundColor: AppColors.background,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16 , horizontal: 16),
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
              desc
              ,style: TextStyle(
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
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      create.routeName,
                          (route) => false,
                    );
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)
                  ),
                  height: 50,
                  minWidth: double.infinity,
                  color: AppColors.maincolor,
                  child: Text(
                    "Get Started",
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
