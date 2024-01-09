import 'package:bmi_calculator/views/myView.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BMI CALCULATOR",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 4,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        elevation: 5,
        leading: Icon(
          size: 32,
          Icons.calculate,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.white,
      body: const SafeArea(child: MyView()),
    );
  }
}
