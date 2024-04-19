import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/widget/flutter_toast.dart';
import 'bloc/register_bloc.dart';

class RegisterController{

  final BuildContext context;

  RegisterController(this.context);

  Future<void> handleEmailRegister() async {
    final state = context.read<RegisterBloc>().state;
    final email = state.email;
    final username = state.username;
    final password = state.password;
    final rePassword = state.rePassword;

    // print("email is  $email, ");
    // print("username is $username");
    // print("password is  $password ");
    // print("rePassword is $rePassword");

    if (username.isEmpty) {
      toastInfo(message: "Username cannot be empty");
      return;
    }
    if (email.isEmpty) {
      toastInfo(message: "Email cannot be empty");
      return;
    }
    if (password.isEmpty) {
      toastInfo(message: "Password cannot be empty");
      return;
    }
    if (rePassword.isEmpty) {
      toastInfo(message: "Confirm password field cannot be empty");
      return;
    }
    try {
      final credentials = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      if (credentials.user != null) {
        await credentials.user!.sendEmailVerification();
        await credentials.user!.updateDisplayName(username);
        toastInfo(message: 'An email has been sent to your registered email and is awaiting your activation.');
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        toastInfo(message: "The password provided is too weak");
      }
      else if (e.code == 'email already in use') {
        toastInfo(message: "The email provided is already in use");
      } else {
        toastInfo(message: 'something went wrong!');
      }
    }
  }

}