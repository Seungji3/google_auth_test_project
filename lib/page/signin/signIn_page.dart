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
  // ValueNotifier userCredential = ValueNotifier('');

  var currentDisplayName = '';
  var currentEmail = '';
  var currentPhotoUrl = '';

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: TextButton(
              child: Text('Google Login'),
              onPressed: signInWithGoogle,
            ),
          ),
          Center(
              child: Container(
            child: Column(
              children: [
                Image.network(currentPhotoUrl),
                Text(currentDisplayName),
                Text(currentEmail),
              ],
            ),
          ))
        ],
      ),
    );
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    setState(() {
      if (googleUser != null) {
        currentDisplayName = googleUser.displayName!;
        currentEmail = googleUser.email;
        currentPhotoUrl = googleUser.photoUrl!;
        Navigator.pushNamed(context, '/');
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('${googleUser.displayName}님 로그인 되었습니다')));
      }
    });

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
