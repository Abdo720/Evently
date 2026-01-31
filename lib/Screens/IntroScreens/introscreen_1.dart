import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/Screens/IntroScreens/introscreenfirst.dart';
import 'package:to_do/core/Colors.dart';
import 'package:to_do/providers/theme_provider.dart';

class Introscreen1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Intro1();
}

class Intro1 extends State<Introscreen1> {
  static String routeName = "IntroScreen1";
  bool _isLightTheme = true;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    final isEnglish = context.locale == const Locale('en', 'US');

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/images/Evently.png",
          height: 300,
          width: 150,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                "assets/images/Intro1.png",
                height: 343,
                width: 343,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "personalize_experience".tr(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 10),
            Text(
              "personalize_description".tr(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  "language".tr(),
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Spacer(),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        context.setLocale(Locale('en', 'US'));
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                        decoration: BoxDecoration(
                          color: isEnglish ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.surface,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              color: isEnglish
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context).dividerColor),
                        ),
                        child: Text(
                          "english".tr(),
                          style: TextStyle(
                            color: isEnglish ? Theme.of(context).colorScheme.surface : Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        context.setLocale(Locale('ar', 'EG'));
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                        decoration: BoxDecoration(
                          color: !isEnglish ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.surface,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              color: !isEnglish
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context).dividerColor),
                        ),
                        child: Text(
                          "arabic".tr(),
                          style: TextStyle(
                            color: !isEnglish ? Theme.of(context).colorScheme.surface : Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Text(
                  "theme".tr(),
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Spacer(),
                Row(
                  children: [
                    // Light Theme
                    InkWell(
                      onTap: () {
                        if (!provider.isLight) {
                          provider.toggleTheme();
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: provider.isLight
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.surface,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.wb_sunny_outlined,
                          color: provider.isLight
                              ? Theme.of(context).colorScheme.surface
                              : Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),

                    // Dark Theme
                    InkWell(
                      onTap: () {
                        if (provider.isLight) {
                          provider.toggleTheme();
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: !provider.isLight
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.surface,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.nightlight_round,
                          color: !provider.isLight
                              ? Theme.of(context).colorScheme.surface
                              : Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 18),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  height: 55,
                  minWidth: 400,
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      IntroscreenFirst.routeName,
                    );
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  color: Theme.of(context).colorScheme.primary,
                  child: Text(
                    "lets_start".tr(),
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}