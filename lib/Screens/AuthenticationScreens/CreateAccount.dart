import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:to_do/Screens/AuthenticationScreens/LoginYourAccount.dart';
import 'package:to_do/Screens/HomeScreen/home_screen.dart';
import 'package:to_do/core/cash_helper.dart';
import 'package:to_do/core/firebaseFunctions.dart';

class Createaccount extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => create();
}

class create extends State<Createaccount> {
  static String routeName = "CreateAAcc";
  final createKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool isPasswordVisible = false;
  bool isPasswordVisible1 = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final iconColor = Theme.of(context).iconTheme.color;
    final textBodySmall = Theme.of(context).textTheme.bodySmall;
    final textDisplayLarge = Theme.of(context).textTheme.displayLarge;

    return Form(
      key: createKey,
      child: Scaffold(
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
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                "create_account".tr(),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 40),
              TextFormField(
                controller: nameController,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "name_required".tr();
                  }
                  return null;
                },
                decoration: InputDecoration(
                  label: Text(
                    "enter_name".tr(),
                    style: textBodySmall,
                  ),
                  prefixIcon: Icon(
                    Icons.person,
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
                  RegExp regex = RegExp(
                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                  );
                  if (val == null || val.isEmpty) {
                    return "enter_password".tr();
                  }
                  if (!regex.hasMatch(val)) {
                    return "password_required".tr();
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
                      isPasswordVisible
                          ? Icons.remove_red_eye_sharp
                          : Icons.visibility_off,
                      color: iconColor,
                      size: 24,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                obscureText: !isPasswordVisible1,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "confirm_password".tr();
                  }
                  if (val != passController.text) {
                    return "password_not_same".tr();
                  }
                  return null;
                },
                decoration: InputDecoration(
                  label: Text(
                    "confirm_password".tr(),
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
                        isPasswordVisible1 = !isPasswordVisible1;
                      });
                    },
                    child: Icon(
                      isPasswordVisible1
                          ? Icons.remove_red_eye_sharp
                          : Icons.visibility_off,
                      color: iconColor,
                      size: 24,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              const SizedBox(height: 52),
              Padding(
                padding: const EdgeInsets.all(14),
                child: MaterialButton(
                  onPressed: () {
                    if (createKey.currentState!.validate()) {
                      Firebasefunctions.createUser(
                        emailController.text,
                        passController.text,
                        nameController.text,
                        onError: (massage) {
                          return ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: colorScheme.surface,
                              content: Text(
                                massage,
                                style: TextStyle(
                                  color: colorScheme.onSurface,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          );
                        },
                        onSuccess: () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            Login.ruoteName,
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
                    "sign_up".tr(),
                    style: textDisplayLarge?.copyWith(color: colorScheme.onPrimary),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "already_have_account".tr(),
                    style: textBodySmall,
                  ),
                  const SizedBox(width: 1),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        Login.ruoteName,
                            (route) => false,
                      );
                    },
                    child: Text(
                      "login".tr(),
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
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(color: colorScheme.onSurface),
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