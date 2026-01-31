import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:to_do/Screens/AuthenticationScreens/CreateAccount.dart';
import 'package:to_do/Screens/AuthenticationScreens/forgeting_pass.dart';
import 'package:to_do/Screens/HomeScreen/home_screen.dart';
import 'package:to_do/core/cash_helper.dart';
import 'package:to_do/core/firebaseFunctions.dart';

class Loginyouraccount extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Login();
}

class Login extends State<Loginyouraccount> {
  static String ruoteName = "Loginyouraccount";
  final LoginKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final iconColor = Theme.of(context).iconTheme.color;
    final textBodySmall = Theme.of(context).textTheme.bodySmall;
    final textDisplayLarge = Theme.of(context).textTheme.displayLarge;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Image.asset(
          "assets/images/Evently.png",
          height: 300,
          width: 150,
        ),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Form(
          key: LoginKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "login_to_account".tr(),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: emailController,
                validator: (val) {
                  final bool emailValid = RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                  ).hasMatch(val!);
                  if (val == null || val.isEmpty) {
                    return "email_required".tr();
                  }
                  if (!emailValid) {
                    return "email_invalid".tr();
                  }
                  return null;
                },
                decoration: InputDecoration(
                  label: Text(
                    "enter_email".tr(),
                    style: textBodySmall,
                  ),
                  prefixIcon: Icon(
                    Icons.mail,
                    color: iconColor,
                    size: 24,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "enter_password".tr();
                  }
                  return null;
                },
                controller: passController,
                obscureText: !isPasswordVisible,
                decoration: InputDecoration(
                  label: Text(
                    "enter_password".tr(),
                    style: textBodySmall,
                  ),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: iconColor,
                    size: 24,
                  ),
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                    child: Icon(
                      isPasswordVisible ? Icons.remove_red_eye_sharp : Icons.visibility_off,
                      color: iconColor,
                      size: 24,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, ForgetPass.routeName);
                    },
                    child: Text(
                      "forget_password".tr(),
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Center(
                  child: MaterialButton(
                    onPressed: () {
                      if (LoginKey.currentState!.validate()) {
                        Firebasefunctions.signIn(
                          emailController.text,
                          passController.text,
                          onError: (massage) {
                            return ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: colorScheme.surface,
                                content: Text(
                                  massage,
                                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                    color: colorScheme.onSurface,
                                  ),
                                ),
                              ),
                            );
                          },
                          onSuccess: () {
                            CashHelper.Savebool2(true);
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              HomeScreen.routeName,
                                  (route) => false,
                            );
                          },
                        );
                      }
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    height: 50,
                    minWidth: double.infinity,
                    color: colorScheme.primary,
                    child: Text(
                      "login".tr(),
                      style: textDisplayLarge?.copyWith(color: colorScheme.onPrimary),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 48),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "no_account".tr(),
                    style: textBodySmall,
                  ),
                  const SizedBox(width: 1),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        create.routeName,
                            (route) => false,
                      );
                    },
                    child: Text(
                      "sign_up".tr(),
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Center(
                child: Text(
                  "or".tr(),
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.all(14),
                child: MaterialButton(
                  onPressed: () async {
                    CashHelper.Savebool3(true);
                    var user = await Firebasefunctions.signInWithGoogle();
                    if (user != null) {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        HomeScreen.routeName,
                            (route) => false,
                      );
                    }
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  height: 50,
                  minWidth: double.infinity,
                  color: colorScheme.surface,
                  child: Row(
                    children: [
                      const Spacer(),
                      Image.asset(
                        "assets/images/google.png",
                        height: 24,
                        width: 24,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "sign_up_google".tr(),
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: colorScheme.onSurface,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}