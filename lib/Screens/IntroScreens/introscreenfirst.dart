import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:to_do/Screens/AuthenticationScreens/LoginYourAccount.dart';
import 'package:to_do/Screens/IntroScreens/introscreenbetwen.dart';
import 'package:to_do/core/cash_helper.dart';

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
        title: Image.asset(
          "assets/images/Evently.png",
          height: 300,
          width: 150,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: InkWell(
              onTap: () {
                CashHelper.Savebool1(true);
                Navigator.pushNamedAndRemoveUntil(context, Login.ruoteName, (route) => false);
              },
              child: Container(
                height: 32,
                width: 63,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Theme.of(context).dividerColor),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "skip".tr(),
                    style: Theme.of(context).textTheme.displaySmall,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset(image, height: 343, width: 343)),
            const SizedBox(height: 15),
            Text(
              titele,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              desc,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Introscreenbetwen.routeName);
                  },
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  height: 50,
                  minWidth: double.infinity,
                  color: Theme.of(context).colorScheme.primary,
                  child: Text(
                    "next".tr(),
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge
                        ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
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