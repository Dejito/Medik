import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medik/pages/applications/applications_widget.dart';
import 'package:medik/pages/sign_in/sign_in_widgets.dart';

import '../../common/values/colors.dart';
import 'bloc/application_bloc.dart';

class ApplicationPage extends StatefulWidget {

  static const id = "application_page";

  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  // var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: BlocBuilder<ApplicationBloc, ApplicationState>(
          builder: (context, state) {
            return Scaffold(
              body: buildPage(state.index),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: state.index,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: AppColors.primaryElement,
                unselectedItemColor: AppColors.primaryFourElementText,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                onTap: (int value) {
                  context.read<ApplicationBloc>().add(ApplicationEvent(index: value));
                  // setState(() {
                  //   selectedIndex = value;
                  // });
                },
                items: bottomNavBars,
              ),
            );
          },
        ),
      ),
    );
  }
}
