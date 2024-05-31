import 'package:capstone/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserNotifier extends StateNotifier<User> {
  UserNotifier() : super(User(imgPath: '', name: 'none'));

  void setFilter(User user) {
    state = user;
    print(state);
  }
}

final userProvider =
    StateNotifierProvider<UserNotifier, User>((ref) => UserNotifier());
