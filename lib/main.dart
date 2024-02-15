import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:project_auth_test/page/signin/signIn_page.dart';
import 'package:project_auth_test/page/home/home_page.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Main',
      initialRoute: '/signIn',
      routes: {
        '/': (context) => HomePage(),
        '/signIn': (context) => SignInPage(),
      },
    );
  }
}
