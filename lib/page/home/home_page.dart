import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () => Navigator.pushNamed(context, '/signIn'),
              child: Text('로그인'))
        ],
      ),
      body: Center(
        child: Text('HomePage'),
      ),
    );
  }
}
