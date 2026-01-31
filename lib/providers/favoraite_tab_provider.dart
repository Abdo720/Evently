import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:to_do/Models/event_model.dart';
import 'package:to_do/Models/user_model.dart';
import 'package:to_do/core/firebaseFunctions.dart';

class FavoraiteTabProvider extends ChangeNotifier {
  StreamSubscription<QuerySnapshot<EventModel>>? _eventsSubscription;
  List<EventModel> fav = [];
  UserModel? currentUser;

  FavoraiteTabProvider() {
    _loadCurrentUser();
  }

  Future<void> _loadCurrentUser() async {
    currentUser = await Firebasefunctions.getCurrentUser();
    notifyListeners();
  }

  void getFavorite() {
    _eventsSubscription?.cancel();
    _eventsSubscription = Firebasefunctions.getFavorite().listen((snapshot) {
      fav = snapshot.docs.map((doc) => doc.data()).toList();
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
