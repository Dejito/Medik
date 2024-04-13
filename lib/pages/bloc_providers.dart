import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medik/pages/register/bloc/register_bloc.dart';
import 'package:medik/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:medik/pages/welcome/bloc/welcome_bloc.dart';

import 'counter_test/app_bloc.dart';

class AppBlocsProvider {
  static get blocProviders => [
        BlocProvider(
          create: (context) => WelcomeBloc(),
        ),
        BlocProvider(
          lazy: true,
          create: (context) => AppBloc(),
        ),
        BlocProvider(create: (context) => SignInBloc()),
        BlocProvider(create: (context) => RegisterBloc())
      ];
}
