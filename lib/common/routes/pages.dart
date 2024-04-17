import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medik/common/routes/names.dart';
import 'package:medik/pages/applications/applications_page.dart';
import 'package:medik/pages/applications/bloc/application_bloc.dart';
import 'package:medik/pages/sign_in/sign_in_screen.dart';
import 'package:medik/pages/welcome/bloc/welcome_bloc.dart';
import 'package:medik/pages/welcome/welcome_screen.dart';

import '../../pages/counter_test/app_bloc.dart';
import '../../pages/register/bloc/register_bloc.dart';
import '../../pages/register/register.dart';
import '../../pages/sign_in/bloc/sign_in_bloc.dart';

class AppPages {
  static List<PageEntity> routes() {
    return <PageEntity>[
      PageEntity(
        route: AppRoutes.initial,
        page: const WelcomeScreen(),
        bloc: BlocProvider(
          create: (context) => WelcomeBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.signIn,
        page: const SignInScreen(),
        bloc: BlocProvider(
          create: (context) => SignInBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.register,
        page: const Register(),
        bloc: BlocProvider(
          create: (context) => RegisterBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.application,
        page: const ApplicationPage(),
        bloc: BlocProvider(
          create: (context) => ApplicationBloc(),
        ),
      ),
    ];
  }

  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    final result = routes().where((element) => element.route == settings.name);
    if (result.isNotEmpty) {
      return MaterialPageRoute(
          builder: (_) => result.first.page, settings: settings);
    } else {
      return MaterialPageRoute(
        builder: (_) => const WelcomeScreen(), settings: settings);
    }
  }

  static List allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = [];
    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }
}

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page, this.bloc});
}
