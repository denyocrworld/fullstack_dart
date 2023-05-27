// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class MainNavigationLogo extends StatelessWidget {
  const MainNavigationLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text(
          "Awesome",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "App",
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ],
    );
  }
}
