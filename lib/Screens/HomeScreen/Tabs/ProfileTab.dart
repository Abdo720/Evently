import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:to_do/Screens/AuthenticationScreens/LoginYourAccount.dart';
import 'package:to_do/core/cash_helper.dart';
import 'package:to_do/providers/profile_tab_provider.dart';
import 'package:to_do/providers/theme_provider.dart';

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return ChangeNotifierProvider(
      create: (context) => ProfileTabProvider(),
      builder: (context, child) {
        final provider = Provider.of<ProfileTabProvider>(context);
        Locale currentLocale = context.locale;

        final colorScheme = Theme.of(context).colorScheme;
        final scaffoldBg = Theme.of(context).scaffoldBackgroundColor;
        final surface = colorScheme.surface;
        final primary = colorScheme.primary;
        final error = colorScheme.error;
        final onSurface = colorScheme.onSurface;
        final iconColor = Theme.of(context).iconTheme.color;

        return Scaffold(
          backgroundColor: scaffoldBg,
          body: provider.currentUser == null
              ? Center(child: CircularProgressIndicator(color: primary))
              : Column(
            children: [
              const SizedBox(height: 250),
              Center(
                child: Text(
                  provider.currentUser?.name ?? "",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  "${FirebaseAuth.instance.currentUser!.email}",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              const SizedBox(height: 40),

              // Theme switch
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: surface,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 12),
                    Text(
                      "theme".tr(),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const Spacer(),
                    Switch(
                      value: themeProvider.themeMode == ThemeMode.dark,
                      onChanged: (val) {
                        themeProvider.toggleTheme();
                      },
                      activeColor: primary,
                      inactiveThumbColor: surface,
                      inactiveTrackColor: onSurface.withOpacity(0.12),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Language selector
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                height: 50,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: surface,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Text(
                      "language".tr(),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const Spacer(),
                    DropdownButton<Locale>(
                      dropdownColor: scaffoldBg,
                      value: currentLocale,
                      underline: const SizedBox(),
                      icon: Icon(Icons.arrow_drop_down_sharp, color: primary),
                      items: const [
                        DropdownMenuItem(
                          value: Locale('en', 'US'),
                          child: Text("English"),
                        ),
                        DropdownMenuItem(
                          value: Locale('ar', 'EG'),
                          child: Text("العربية"),
                        ),
                      ],
                      onChanged: (Locale? locale) {
                        if (locale != null) {
                          context.setLocale(locale);
                        }
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Logout button
              InkWell(
                onTap: () async {
                  CashHelper.Savebool2(false);
                  if (CashHelper.Getbool3("google") == false) {
                    await GoogleSignIn().signOut();
                    await GoogleSignIn().disconnect();
                  }
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushNamedAndRemoveUntil(
                      context, Login.ruoteName, (route) => false);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: surface,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 12),
                      Text(
                        "logout".tr(),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const Spacer(),
                      Icon(Icons.logout, color: error),
                      const SizedBox(width: 12),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}