import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medik/common/service/storage_service.dart';
import 'package:medik/common/values/constant.dart';
import 'package:medik/global.dart';
import 'package:medik/pages/applications/applications_page.dart';
import 'package:medik/pages/sign_in/bloc/sign_in_bloc.dart';

import '../../common/flutter_toast.dart';

class SignInController {
  final BuildContext context;

  SignInController(this.context);

  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        final state = context.read<SignInBloc>().state;
        final email = state.email;
        final password = state.password;

        if (email.isEmpty) {
          toastInfo(message: "email is empty");
          return;
        }
        if (password!.isEmpty) {
          toastInfo(message: "password is empty");
          return;
        }
        try {
          // print("implementing firebase auth signup");
          final credentials = await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password);
          print("cred $credentials");
          if (credentials.user == null) {
            toastInfo(message: "user does not exist");
            return;
          }
          if (!credentials.user!.emailVerified) {
            toastInfo(message: "not verified");
            return;
          }
          var user = credentials.user;
          if (user != null) {
            print(user);
            StorageService().setString(AppConstant.userTokenKey, "olami skillful");
            Navigator.of(context).pushReplacementNamed(ApplicationPage.id);
          }

        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            toastInfo(message: "user not found");
            return;
          } else if (e.code == 'wrong-password') {
            toastInfo(message: "wrong password");
            return;
          } else if (e.code == 'invalid-email') {
            toastInfo(message: "invalid email");
            return;

          } else {
            toastInfo(message: e.code);
            return;
          }
        } catch (e) {
          toastInfo(message: "something went wrong!");
        }
      }
    } catch (e) {}
  }
}
