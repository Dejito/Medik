import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medik/pages/sign_in/sign_in_controller.dart';
import 'package:medik/pages/sign_in/sign_in_widgets.dart';

import 'bloc/sign_in_bloc.dart';

class SignInScreen extends StatelessWidget {
  static const route = "sign_in_screen";

  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          child: BlocBuilder<SignInBloc, SignInState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildThirdPartyLogin(),
                  Center(
                    child: reusableText("Or use email account to login"),
                  ),
                  reusableText("Email"),
                  buildTextField("Enter your email address", "email", "user",
                      (emailValue){
                       return context.read<SignInBloc>().add(EmailEvent(emailValue));
                        // print(emailValue);
                   }
                  ),
                  reusableText("Password"),
                  buildTextField("Enter your password", "password", "lock",
                      (passwordValue){
                    return context.read<SignInBloc>().add(PasswordEvent(passwordValue));
                      }
                  ),
                  forgotPassword(),
                  buildLoginAndRegButton("Login", 'login', () {
                    SignInController(context).handleSignIn("email");
                  }),
                  buildLoginAndRegButton("Register", 'reg', () {}),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
