import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutterfire_ui/auth.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // TODO: Consider initalizing during a splash screen.
  // See https://stackoverflow.com/questions/67023493/firebase-initializeapp-before-runapp-in-flutter-takes-a-lot-of-time
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FlutterFireUIAuth.configureProviders([
    const GoogleProviderConfiguration(
      clientId:
          '894760498829-o21jqicnvk3uarulb2qldq3kp229muf2.apps.googleusercontent.com',
    ),
  ]);
  runApp(const ChoresApp());
}

class ChoresApp extends StatelessWidget {
  const ChoresApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chores',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AuthGate(),
    );
  }
}

class AuthGate extends StatelessWidget {
  const AuthGate({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const HomePage();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SignInScreen(showAuthActionSwitch: false);
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Chores'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(FirebaseAuth.instance.currentUser?.displayName ?? 'Unknown'),
              ElevatedButton(
                onPressed: FirebaseAuth.instance.signOut,
                child: const Text('Sign out'),
              ),
              const Align(
                alignment: Alignment.bottomRight,
                child: Text('0.0.1'),
              ),
            ],
          ),
        ));
  }
}
