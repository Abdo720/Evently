import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:to_do/Screens/AuthenticationScreens/LoginYourAccount.dart';
import 'package:to_do/Screens/IntroScreens/introscreenlast.dart';
import 'package:to_do/core/cash_helper.dart';

class Introscreenbetwen extends StatelessWidget {
  static String routeName = "Introscreenbetwen";
  final String image;
  final String titele;
  final String desc;

  Introscreenbetwen({
    super.key,
    required this.image,
    required this.titele,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    final dividerColor = Theme.of(context).dividerColor;
    final surfaceColor = Theme.of(context).colorScheme.surface;
    final iconColor = Theme.of(context).iconTheme.color;

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/images/Evently.png",
          height: 300,
          width: 150,
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
                color: surfaceColor,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: dividerColor),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: iconColor,
                  size: 18,
                ),
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: InkWell(
              onTap: () {
                CashHelper.Savebool1(true);
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Login.ruoteName,
                      (route) => false,
                );
              },
              child: Container(
                height: 32,
                width: 63,
                decoration: BoxDecoration(
                  color: surfaceColor,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: dividerColor),
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
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset(image, height: 343, width: 343)),
            const SizedBox(height: 15),
            Text(titele, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 15),
            Text(desc, style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Introscreenlast.routeName);
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