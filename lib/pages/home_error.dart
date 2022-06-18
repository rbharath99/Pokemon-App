// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class HomeError extends StatelessWidget {
  HomeError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        'Cannot Load Pokemon Data',
        style: TextStyle(color: Colors.red),
      ),
    );
  }
}