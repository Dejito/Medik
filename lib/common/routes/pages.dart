import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medik/common/routes/names.dart';
import 'package:medik/common/service/storage_service.dart';
import 'package:medik/common/values/constant.dart';
import 'package:medik/pages/applications/applications_page.dart';
import 'package:medik/pages/applications/bloc/application_bloc.dart';
import 'package:medik/pages/sign_in/sign_in_screen.dart';
import 'package:medik/pages/welcome/bloc/welcome_bloc.dart';
import 'package:medik/pages/welcome/welcome_screen.dart';

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

  static MaterialPageRoute<dynamic>? generateRouteSettings(
      RouteSettings settings) {
    return MaterialPageRoute<dynamic>(
      builder: (_) {
        // this very first check is skipped at the first time of asking
        if (settings.name != null) {
          final result =
              routes().where((element) => element.route == settings.name);
          if (result.isNotEmpty) {
            // print("nav route is ${result.first.page}");
            return result.first.page;
          }
        }
        // print("nav route passed first check");
        return FutureBuilder<bool>(
          future: StorageService().getBool(AppConstant.returningUser),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // If the future is still loading, return a loading indicator or something else.
              return const Center(
                  child:
                      CircularProgressIndicator()); // Example loading indicator
            } else {
              if (snapshot.hasError) {
                // Handle error
                // print("Error fetching returning user status: ${snapshot.error}");
                return const SignInScreen(); // Return something appropriate for your UI
              } else {
                bool returningUser = snapshot.data ?? false;
                if (returningUser) {
                  // print("nav route is returning user $returningUser");
                  return FutureBuilder(
                      future: StorageService().getIsLoggedIn(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else {
                          if (snapshot.hasError) {
                            // Handle error
                            // print("Error fetching returning user status: ${snapshot.error}");
                            return const SignInScreen();
                          } else {
                            bool isLoggedIn = snapshot.data ?? false;
                            if (isLoggedIn) {
                              return const ApplicationPage();
                            } else {
                              return const SignInScreen();
                            }
                          }
                        }
                      });
                  return const SignInScreen();
                } else {
                  // print("nav route is first time user");
                  return const WelcomeScreen();
                }
              }
            }
          },
        );
      },
      settings: settings,
    );
  }

  // static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
  //   if (settings.name != null) {
  //     final result =
  //         routes().where((element) => element.route == settings.name);
  //     if (result.isNotEmpty) {
  //       print("nav route is ${result.first.page}");
  //       return MaterialPageRoute(
  //           builder: (_) => result.first.page, settings: settings);
  //     }
  //   }
  //   print("nav route is passed first check");
  //   bool returningUser = StorageService().getBool(AppConstant.returningUser);
  //
  //   if (returningUser) {
  //     print("nav route is returning user $returningUser");
  //     return MaterialPageRoute(builder: (_) => const SignInScreen());
  //   } else {
  //     print("nav route is first time user");
  //     return MaterialPageRoute(
  //       builder: (_) => const WelcomeScreen(), settings: settings);
  //   }
  // }

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
