import 'package:flutter/material.dart';
import 'package:to_do/Screens/AuthenticationScreens/LoginYourAccount.dart';
import 'package:to_do/core/Colors.dart';

class Createaccount extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => create();
}

class create extends State<Createaccount> {
  static String routeName = "CreateAAcc";

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
      ),
      backgroundColor: AppColors.background,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Create your account",
              style: TextStyle(
                color: AppColors.maincolor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24),
            Form(
              child: TextFormField(
                decoration: InputDecoration(
                  label: Text(
                    "Enter your name",
                    style: TextStyle(color: AppColors.SecText),
                  ),
                  prefixIcon: Icon(
                    Icons.person,
                    color: AppColors.Disable,
                    size: 24,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Form(
              child: TextFormField(
                decoration: InputDecoration(
                  label: Text(
                    "Enter your email",
                    style: TextStyle(color: AppColors.SecText),
                  ),
                  prefixIcon: Icon(
                    Icons.mail,
                    color: AppColors.Disable,
                    size: 24,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Form(
              child: TextFormField(
                decoration: InputDecoration(
                  label: Text(
                    "Enter your password",
                    style: TextStyle(color: AppColors.SecText),
                  ),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: AppColors.Disable,
                    size: 24,
                  ),
                  suffixIcon: InkWell(
                    onTap: () {
                      Icon(
                        Icons.visibility_off,
                        color: AppColors.Disable,
                        size: 24,
                      );
                      setState(() {});
                    },
                    child: Icon(
                      Icons.remove_red_eye_sharp,
                      color: AppColors.Disable,
                      size: 24,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Form(
              child: TextFormField(
                decoration: InputDecoration(
                  label: Text(
                    "Confirm your password",
                    style: TextStyle(color: AppColors.SecText),
                  ),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: AppColors.Disable,
                    size: 24,
                  ),
                  suffixIcon: InkWell(
                    onTap: () {
                      Icon(
                        Icons.visibility_off,
                        color: AppColors.Disable,
                        size: 24,
                      );
                      setState(() {});
                    },
                    child: Icon(
                      Icons.remove_red_eye_sharp,
                      color: AppColors.Disable,
                      size: 24,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),
            SizedBox(height: 52),
            Padding(
              padding: EdgeInsets.all(14),
              child: MaterialButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                height: 50,
                minWidth: double.infinity,
                color: AppColors.maincolor,
                child: Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 24, color: AppColors.inputs),
                ),
              ),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(color: AppColors.SecText, fontSize: 14),
                ),
                SizedBox(width: 1),
                InkWell(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      Login.ruoteName,
                      (route) => false,
                    );
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.maincolor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 32),
            Center(
              child: Text(
                "Or",
                style: TextStyle(color: AppColors.maincolor, fontSize: 16),
              ),
            ),
            SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.all(14),
              child: MaterialButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                height: 50,
                minWidth: double.infinity,
                color: AppColors.inputs,
                child: Row(
                  children: [
                    Spacer(),
                    Image.asset("assets/images/google.png" , height: 24,width: 24,),
                    SizedBox(width: 10),
                    Text(
                      "Sign up with Google",
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.maincolor,
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
