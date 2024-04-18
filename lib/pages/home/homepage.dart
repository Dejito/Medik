import 'package:flutter/material.dart';
import 'package:medik/pages/home/widget/home_page_widget.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildHomePageAppBar(),
      body: Container(
        child: const Center()
      ),
    );
  }
}
