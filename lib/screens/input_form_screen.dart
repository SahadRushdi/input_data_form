import 'package:flutter/material.dart';
import 'package:input_data_form/widgets/form_input_widget.dart';

class InputFormScreen extends StatelessWidget {
  const InputFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FormInputWidget(
            name: "First Name",
            child:
              Container(
                width: double.infinity,
                height: 20,
                color: Colors.red,
              ),
          ),
        ],
      ),
    );
  }
}
