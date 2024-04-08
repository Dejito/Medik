import 'package:flutter/material.dart';
import 'package:medik/pages/sign_in/sign_in_widgets.dart';

class SignInScreen extends StatelessWidget {

  static const route = "sign_in_screen";

  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(child: Scaffold(
        appBar: buildAppBar()
      )),
    );
  }
}
