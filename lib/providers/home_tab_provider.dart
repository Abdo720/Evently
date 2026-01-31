import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:to_do/Models/event_model.dart';
import 'package:to_do/Models/user_model.dart';
import 'package:to_do/core/firebaseFunctions.dart';

class HomeTabProvider extends ChangeNotifier {
  StreamSubscription<QuerySnapshot<EventModel>>? _eventsSubscription;
  int selectedCategoriesIndex = 0;
  UserModel? currentUser;

  List<String> categories = [
    "category_all",
    "category_birthday",
    "category_book_club",
    "category_exhibition",
    "category_gaming",
    "category_holiday",
    "category_meeting",
    "category_sport",
    "category_workshop",
  ];

  List<EventModel> events = [];

  void changeCategories(int index) {
    selectedCategoriesIndex = index;
    getEvents();
  }

  HomeTabProvider() {
    _loadCurrentUser();
  }

  Future<void> _loadCurrentUser() async {
    currentUser = await Firebasefunctions.getCurrentUser();
    notifyListeners();
  }

  void getEvents() {
    _eventsSubscription?.cancel();
    _eventsSubscription = Firebasefunctions.getEvent(
      category: selectedCategoriesIndex == 0
          ? 'ALL'
          : categories[selectedCategoriesIndex],
    ).listen((snapshot) {
      events = snapshot.docs.map((doc) => doc.data()).toList();
      notifyListeners();
    });
  }

  Future<void> updateEvent(EventModel event) async {
    await Firebasefunctions.updateEvent(event);
  }

  Future<void> deleteEvent(EventModel event) async {
    await Firebasefunctions.deleteEvent(event);
  }

  @override
  void dispose() {
    _eventsSubscription?.cancel();
    super.dispose();
  }
}
