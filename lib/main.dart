import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medik/app_bloc.dart';
import 'package:medik/pages/sign_in/sign_in_screen.dart';
import 'package:medik/pages/welcome/bloc/welcome_bloc.dart';
import 'package:medik/pages/welcome/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WelcomeBloc(),
        ),
        BlocProvider(
          lazy: true,
          create: (context) => AppBloc(),
        ),
      ],
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          title: 'Medik',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const WelcomeScreen(),
          routes: {
            WelcomeScreen.route: (context) => const WelcomeScreen(),
            MyHomePage.route: (context) => const MyHomePage(),
            SignInScreen.route: (context) => const SignInScreen(),
          },
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  static const route = "home_screen";

  const MyHomePage();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text("ZOMBIE"),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '${state.counter}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),

          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                heroTag: "1",
                onPressed: () {
                  BlocProvider.of<AppBloc>(context).add(Increment());
                  print("increased pressed");
                },
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
              FloatingActionButton(
                heroTag: 2,
                onPressed: () {
                  BlocProvider.of<AppBloc>(context).add(Decrement());
                  print("decreased pressed");
                },
                tooltip: 'Decrement',
                child: const Icon(Icons.remove),
              ),
            ],
          ), // This trailing comma makes auto-formatting nicer for build methods.
        );
      },
    );
  }
}