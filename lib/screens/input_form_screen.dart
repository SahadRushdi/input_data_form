import 'package:flutter/material.dart';

class InputFormScreen extends StatelessWidget {
  const InputFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("First Name"),
          Container(
            width: double.infinity,
            height: 20,
            color: Colors.red,
          ),
          const Text("Last Name"),
          Container(
            width: double.infinity,
            height: 20,
            color: Colors.red,
          ),
          const Text("Age"),
          Container(
            width: double.infinity,
            height: 20,
            color: Colors.red,
          )
        ],
      ),
    );
  }
}
