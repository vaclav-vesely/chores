import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

enum AuthState {
  initializing,
  unauthenticated,
  authenticated,
}

class AuthModel extends ChangeNotifier {
  AuthModel() {
    FirebaseAuth.instance.authStateChanges().listen(_onAuthStateChanged);
  }

  AuthState _state = AuthState.initializing;

  AuthState get state => _state;

  get userName => FirebaseAuth.instance.currentUser?.displayName;

  void _onAuthStateChanged(User? user) {
    if (user == null) {
      _state = AuthState.unauthenticated;
    } else {
      _state = AuthState.authenticated;
    }
    notifyListeners();
  }

  Future<void> login() async {
    try {
      var auth = FirebaseAuth.instance;
      var authProvider = GoogleAuthProvider();
      // Prompts the user to select a user account
      // See https://developers.google.com/identity/protocols/oauth2/openid-connect#authenticationuriparameters
      authProvider.setCustomParameters({'prompt': 'select_account'});
      await auth.signInWithPopup(authProvider);
    } on Exception catch (e) {
      // TODO: Handle errors
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void logout() {
    try {
      FirebaseAuth.instance.signOut();
    } on Exception catch (e) {
      // TODO: Handle errors
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
