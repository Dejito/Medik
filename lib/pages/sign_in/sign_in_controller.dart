import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medik/pages/sign_in/bloc/sign_in_bloc.dart';

class SignInController {

  final BuildContext context;

  SignInController(this.context);


  Future<void> handleSignIn(String type) async {

    final state = context.read<SignInBloc>().state;
    try {
      if (type == "email") {
        final emailAddress = state.email;
        final userPassword = state.password;
        final firebaseAuth = FirebaseAuth.instance;
        if (emailAddress.isEmpty){
          return;
          //todo:
        }
        if (userPassword.isEmpty) {
          return;
          //todo:
        }
        try {
          final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailAddress, password: userPassword);
          if (credential.user==null) {
            //user not created yet
            //todo:
          }
          if (!credential.user!.emailVerified) {
            //user not verified
          }
        } catch(e){

        }

      }
    } catch (e) {

    }

  }

}