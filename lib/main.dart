import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/Screens/Add_Event/add_event.dart';
import 'package:to_do/Screens/AuthenticationScreens/CreateAccount.dart';
import 'package:to_do/Screens/AuthenticationScreens/LoginYourAccount.dart';
import 'package:to_do/Screens/AuthenticationScreens/forgeting_pass.dart';
import 'package:to_do/Screens/HomeScreen/home_screen.dart';
import 'package:to_do/Screens/IntroScreens/introscreenbetwen.dart';
import 'package:to_do/Screens/IntroScreens/introscreenfirst.dart';
import 'package:to_do/Screens/IntroScreens/introscreenlast.dart';
import 'package:to_do/Screens/SplachScreen/Splachscreen.dart';
import 'package:to_do/Screens/IntroScreens/introscreen_1.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:to_do/core/cash_helper.dart';
import 'package:to_do/core/theme_data.dart';
import 'package:to_do/providers/theme_provider.dart';
import 'firebase_options.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:to_do/core/Colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseFirestore.instance.settings = Settings(persistenceEnabled: true);
  CashHelper.init();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('ar', 'EG')],
      path: 'assets/translations',
      fallbackLocale: Locale('en', 'US'),
      child: ChangeNotifierProvider(create: (BuildContext context) => ThemeProvider(),
      child: MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: provider.themeMode,
      initialRoute: Splach.routeName,
      routes: {
        Splach.routeName: (context) => Splachscreen(),
        Intro1.routeName: (context) => Introscreen1(),
        IntroscreenFirst.routeName: (context) => IntroscreenFirst(
          image: "assets/images/Intro2.png",
          titele: "intro_find_title".tr(),
          desc: "intro_find_desc".tr(),
        ),
        Introscreenbetwen.routeName: (context) => Introscreenbetwen(
          image: "assets/images/Intro3.png",
          titele: "intro_plan_title".tr(),
          desc: "intro_plan_desc".tr(),
        ),
        Introscreenlast.routeName: (context) => Introscreenlast(
          image: "assets/images/Intro4.png",
          titele: "intro_connect_title".tr(),
          desc: "intro_connect_desc".tr(),
        ),
        create.routeName: (context) => Createaccount(),
        Login.ruoteName: (context) => Loginyouraccount(),
        ForgetPass.routeName: (context) => ForgetingPass(),
        HomeScreen.routeName: (context) => HomeScreen(),
        Addevent.routeName: (context) => AddEvent(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
