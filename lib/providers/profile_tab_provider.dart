import 'package:flutter/material.dart';
import 'package:to_do/Models/user_model.dart';
import 'package:to_do/core/firebaseFunctions.dart';

class ProfileTabProvider extends ChangeNotifier {
  UserModel? currentUser;

  ProfileTabProvider() {
    _loadCurrentUser();
  }

  Future<void> _loadCurrentUser() async {
    currentUser = await Firebasefunctions.getCurrentUser();
    notifyListeners();
  }
}
