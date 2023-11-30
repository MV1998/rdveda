
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rdveda/src/feature/authentication/domain/repository/authentication.dart';

class FirebaseAuthentication extends Authentication {
  final String phoneNumber;
  final BuildContext context;
  
  FirebaseAuthentication(this.phoneNumber, this.context);

  @override
  Future signIn() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.verifyPhoneNumber(
      phoneNumber: "+91 $phoneNumber",
      verificationCompleted: (PhoneAuthCredential credential) {

      },
      verificationFailed: (FirebaseAuthException e) {

      },
      codeSent: (String verificationId, int? resendToken) {
        //print("-----> $verificationId");
      },
      codeAutoRetrievalTimeout: (String verificationId) {

      },
    );
    return "";
  }

  @override
  Future signUp() {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}