import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Chores'),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(FirebaseAuth.instance.currentUser?.displayName ?? 'Unknown'),
              ElevatedButton(
                onPressed: FirebaseAuth.instance.signOut, // TODO: Handle errors
                child: const Text('Sign out'),
              ),
              const Text('0.0.1'),
            ],
          ),
        ));
  }
}
