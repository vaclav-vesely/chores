import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auth_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chores'),
      ),
      body: Consumer<AuthModel>(
        builder: (context, auth, child) {
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(auth.userName ?? 'Unknown'),
                ElevatedButton(
                  onPressed: auth.logout,
                  child: const Text('Sign out'),
                ),
                const Text('0.0.1'),
              ],
            ),
          );
        },
      ),
    );
  }
}
