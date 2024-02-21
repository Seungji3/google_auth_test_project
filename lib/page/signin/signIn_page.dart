import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  var currentDisplayName = '';
  var currentEmail = '';
  var currentPhotoUrl = '';

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
      child: Column(
        children: [
          if (currentPhotoUrl.isEmpty)
            const Icon(Icons.person)
          else
            Image.network(currentPhotoUrl, width: 40),
          Text(currentDisplayName),
          Text(currentEmail),
        ],
      ),
    )));
  }
}
