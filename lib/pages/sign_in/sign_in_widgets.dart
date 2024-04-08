import 'package:flutter/material.dart';

AppBar buildAppBar (){
  return AppBar(
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
        color: Colors.grey.withOpacity(.5),
        height: 1.0,
      ),
    ),
    title: const Center(
      child: Text(
          "Login"
      ),
    ),
  );
}