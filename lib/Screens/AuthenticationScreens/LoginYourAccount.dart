import 'package:flutter/material.dart';
import 'package:to_do/Screens/AuthenticationScreens/CreateAccount.dart';
import 'package:to_do/Screens/AuthenticationScreens/forgeting_pass.dart';
import 'package:to_do/core/Colors.dart';

class Loginyouraccount extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Login();
}

class Login extends State<Loginyouraccount> {
  static String ruoteName = "Loginyouraccount";

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
              "Login to your account",
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
            SizedBox(height: 10),
            Row(
              children: [
                Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, ForgetPass.routeName);
                  },
                  child: Text(
                    "Forget Password? ",
                    style: TextStyle(
                      color: AppColors.maincolor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            Padding(
              padding: EdgeInsets.all(16),
              child: Center(
                child: MaterialButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  height: 50,
                  minWidth: double.infinity,
                  color: AppColors.maincolor,
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 24, color: AppColors.inputs),
                  ),
                ),
              ),
            ),
            SizedBox(height: 48),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don’t have an account ? ",
                  style: TextStyle(color: AppColors.SecText, fontSize: 14),
                ),
                SizedBox(width: 1),
                InkWell(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      create.routeName,
                      (route) => false,
                    );
                  },
                  child: Text(
                    "Signup",
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
