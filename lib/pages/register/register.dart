import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medik/pages/register/register_controller.dart';
import 'package:medik/pages/sign_in/bloc/sign_in_bloc.dart';

import '../../common/widget/base_text_widget.dart';
import '../common_widgets.dart';
import '../sign_in/sign_in_widgets.dart';
import 'bloc/register_bloc.dart';

class Register extends StatefulWidget {
  static const id = "register";

  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Register"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 25.h),
            // buildThirdPartyLogin(context),
            reusableText("Enter your details below and sign up for free"),
            Container(
              margin: EdgeInsets.only(top: 12.h, bottom: 16.h),
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: BlocBuilder<RegisterBloc, RegisterState>(
                builder: (context, state) {
                  final registerBloc = BlocProvider.of<RegisterBloc>(context);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      reusableText("username"),
                      buildTextField(
                        "Enter your username",
                        "email",
                        "user",
                        (String text) {
                          context.read<RegisterBloc>().add(UsernameEvent(text));
                        },
                      ),
                      SizedBox(
                        height: 12.w,
                      ),
                      reusableText("Email"),
                      buildTextField(
                        "Enter your email address",
                        "email",
                        "user",
                        (String text) {
                          registerBloc.add(OnboardingEmailEvent(text));
                        },
                      ),
                      SizedBox(
                        height: 12.w,
                      ),
                      reusableText(
                        "Password",
                      ),
                      buildTextField(
                        "Enter your password",
                        "password",
                        'lock',
                        (String text) {
                          registerBloc.add(OnboardingPasswordEvent(text));
                        },
                      ),
                      SizedBox(
                        height: 12.w,
                      ),
                      reusableText(
                        "Confirm Password",
                      ),
                      buildTextField(
                        "Re-enter your password",
                        "password",
                        'lock',
                        (String text) {
                          registerBloc.add(RePasswordEvent(text));
                        },
                      ),
                      SizedBox(
                        height: 9.w,
                      ),
                      reusableText(
                        "By creating an account, you have to agree to our terms and conditions",
                      ),
                      buildLoginAndRegButton("Sign up", 'login', () {
                        RegisterController(context).handleEmailRegister();
                      }),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
