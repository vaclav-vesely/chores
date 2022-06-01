import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auth_model.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
        onPressed: Provider.of<AuthModel>(context, listen: false).login,
        child: const Text("Login"),
      )),
    );
  }
}
