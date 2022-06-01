import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auth_model.dart';
import 'home_page.dart';
import 'loading_page.dart';
import 'login_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthModel(),
      child: Consumer<AuthModel>(
        builder: (context, auth, child) {
          switch (auth.state) {
            case AuthState.initializing:
              return const LoadingPage();
            case AuthState.unauthenticated:
              return const LoginPage();
            case AuthState.authenticated:
              return const HomePage();
          }
        },
      ),
    );
  }
}
