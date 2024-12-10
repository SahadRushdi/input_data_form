import 'package:flutter/material.dart';
import 'package:input_data_form/theme_data.dart';
import 'package:input_data_form/widgets/form_input_widget.dart';

class InputFormScreen extends StatelessWidget {
  const InputFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Input Data Form",
            style: TextStyle(
              fontSize: HEADER_TEXT_SIZE,
              fontWeight: FontWeight.w700,
            ),
          ),
          FormInputWidget(
            name: "First Name",
            child: TextField(),
          ),
          FormInputWidget(
            name: "Last Name",
            child: TextField(),
          ),
          FormInputWidget(
            name: "Age",
            child: TextField(),
          ),
        ],
      ),
    );
  }
}
