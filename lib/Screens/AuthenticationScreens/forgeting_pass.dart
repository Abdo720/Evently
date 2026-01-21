import 'package:flutter/material.dart';
import 'package:to_do/core/Colors.dart';

class ForgetingPass extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ForgetPass();
}

class ForgetPass extends State<ForgetingPass> {
  static String routeName = "ForgetPass";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Forget Password",
          style: TextStyle(
            color: AppColors.MainText,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 32,
              width: 32,
              color: AppColors.inputs,
              child: Align(
                alignment: Alignment.center,
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: AppColors.maincolor,
                  size: 24,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Image.asset(
              "assets/images/forget_pass.png",
              height: 390,
              width: 390,
            ),
          ),
          SizedBox(height: 40,),
          Padding(
            padding: EdgeInsets.all(14),
            child: MaterialButton(
              onPressed: () {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)
              ),
              height: 50,
              minWidth: double.infinity,
              color: AppColors.maincolor,
              child: Text(
                "Reset password",
                style: TextStyle(fontSize: 24, color: AppColors.inputs),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
