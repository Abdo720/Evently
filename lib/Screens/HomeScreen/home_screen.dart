import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:to_do/Screens/Add_Event/add_event.dart';
import 'package:to_do/Screens/HomeScreen/Tabs/FavoriteTab.dart';
import 'package:to_do/Screens/HomeScreen/Tabs/HomeTab.dart';
import 'package:to_do/Screens/HomeScreen/Tabs/ProfileTab.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "HomeScreen";
  @override
  State<StatefulWidget> createState() => Home();
}

class Home extends State<HomeScreen> {
  int index = 0;

  final List<Widget> pages = [
    HomeTab(),
    FavoriteTab(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final scaffoldBg = Theme.of(context).scaffoldBackgroundColor;

    return Scaffold(
      backgroundColor: scaffoldBg,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: scaffoldBg,
        selectedItemColor: colorScheme.primary,
        unselectedItemColor: colorScheme.onSurface.withOpacity(0.6),
        currentIndex: index,
        onTap: (val) {
          setState(() {
            index = val;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "home".tr()),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: "favorite".tr()),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "profile".tr()),
        ],
      ),
      body: pages[index],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Addevent.routeName);
        },
        backgroundColor: colorScheme.primary,
        child: Icon(Icons.add, size: 35, color: colorScheme.onPrimary),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}