import 'dart:ffi';

import 'package:flutter/material.dart';

class MyView extends StatefulWidget {
  const MyView({Key? key}) : super(key: key);

  @override
  State<MyView> createState() => _MyViewState();
}

class _MyViewState extends State<MyView> {
  final ht_Controller = TextEditingController();
  final wt_Controller = TextEditingController();
  double result = 0.0;
  String formatter = "";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 130,
                    width: 130,
                    child: FloatingActionButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.male,
                        size: 60,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 130,
                    width: 130,
                    child: FloatingActionButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.female,
                        size: 60,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          form(
            texthead: "Your Height in cm:",
            controller: ht_Controller,
          ),
          SizedBox(
            height: 10,
          ),
          form(
            texthead: "Your weight in Kg :",
            controller: wt_Controller,
          ),

          // Result
          SizedBox(
            height: 40,
          ),
          Container(
            width: 350,
            child: FloatingActionButton.extended(
              onPressed: () {
                setState(() {
                  double weight = double.tryParse(wt_Controller.text) ?? 0.0;
                  double height = double.tryParse(ht_Controller.text) ?? 0.0;

                  if (weight > 0 && height > 0) {
                    result = weight / ((height * height)) * 10000;
                  } else {
                    // Handle invalid input (weight or height <= 0)
                    result = 0.0;
                    formatter = result.toStringAsFixed(3);
                  }
                });
              },
              label: Text('Calculate BMI'),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            "Your BMI is :",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            result.toStringAsFixed(3),
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
          )
        ],
      ),
    );
  }
}

class form extends StatelessWidget {
  const form({super.key, required this.texthead, required this.controller});

  final String? texthead;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              texthead!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: TextField(
            controller: controller,
            keyboardType: TextInputType.numberWithOptions(),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.shade300,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: Colors.transparent,
                  style: BorderStyle.solid,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
