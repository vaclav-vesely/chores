import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
        onPressed: _login,
        child: const Text("Login"),
      )),
    );
  }

  Future<void> _login() async {
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
}
