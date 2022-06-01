import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';

import 'app.dart';
import 'firebase_options.dart';

final GetIt getIt = GetIt.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // TODO: Consider initalizing during a splash screen.
  // See https://stackoverflow.com/questions/67023493/firebase-initializeapp-before-runapp-in-flutter-takes-a-lot-of-time
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}
