import 'dart:async';

import 'package:firebase/enum/enum.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController with ChangeNotifier {
  static void initialize() {
    GetIt.instance.registerSingleton<AuthController>(AuthController());
  }

  static AuthController get instance => GetIt.instance<AuthController>();

  static AuthController get I => GetIt.instance<AuthController>();

  late StreamSubscription<User?> currentAuthedUser;

  AuthState state = AuthState.unauthenticated;

  listen() {
    currentAuthedUser =
        FirebaseAuth.instance.authStateChanges().listen(handleUserChanges);
  }

  void handleUserChanges(User? user) {
    // print(user?.email);
    // print(user?.displayName);
    if (user == null) {
      state = AuthState.unauthenticated;
    } else {
      state = AuthState.authenticated;
    }
    notifyListeners();
  }

  register(String userName, String password) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: userName, password: password);
  }

  login(String userName, String password) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: userName, password: password);
  }

  logout() async {
    return FirebaseAuth.instance.signOut();
  }

  loadSession() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // String? session = prefs.getString('session');

    // if (session != null) {
    //   state = AuthState.authenticated;
    // } else {
    //   state = AuthState.unauthenticated;
    // }
    // notifyListeners();
    listen();
    User? user = FirebaseAuth.instance.currentUser;
    handleUserChanges(user);
  }
}

class SimulatedAPI {
  Map<String, String> users = {"testUser": "12345678ABCabc!"};

  Future<bool> login(String userName, String password) async {
    await Future.delayed(const Duration(seconds: 4));
    if (users[userName] == null) {
      throw Exception("User does not exist");
    }
    if (users[userName] != password) {
      throw Exception("Password does not match!");
    }
    return users[userName] == password;
  }
}
