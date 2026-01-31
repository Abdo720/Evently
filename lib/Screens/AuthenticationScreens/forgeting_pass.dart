import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:to_do/core/firebaseFunctions.dart';

class ForgetingPass extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ForgetPass();
}

class ForgetPass extends State<ForgetingPass> {
  static String routeName = "ForgetPass";
  final forgetKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final dividerColor = Theme.of(context).dividerColor;
    final iconColor = Theme.of(context).iconTheme.color;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          "forget_password".tr(),
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: dividerColor),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: iconColor ?? colorScheme.primary,
                  size: 24,
                ),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                "assets/images/forget_pass.png",
                height: 390,
                width: 390,
              ),
            ),
            const SizedBox(height: 50),
            Text(
              "email".tr(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 10),
            Form(
              key: forgetKey,
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  label: Text(
                    "enter_email".tr(),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: colorScheme.primary),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: colorScheme.primary),
                  ),
                ),
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
              ),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(14),
              child: MaterialButton(
                onPressed: () {
                  if (forgetKey.currentState!.validate()) {
                    Firebasefunctions.resetPassword(
                        emailController.text, onSuccess: () {
                      return ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: colorScheme.surface,
                          content: Text(
                            "check_email".tr(),
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(color: colorScheme.onSurface),
                          ),
                        ),
                      );
                    }, onError: (massage) {
                      return ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: colorScheme.surface,
                          content: Text(
                            massage,
                            style: TextStyle(
                              color: colorScheme.primary,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      );
                    });
                  }
                  Navigator.pop(context);
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                height: 50,
                minWidth: double.infinity,
                color: colorScheme.primary,
                child: Text(
                  "reset_password".tr(),
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge
                      ?.copyWith(color: colorScheme.onPrimary),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}