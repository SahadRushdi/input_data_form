import 'package:flutter/material.dart';
import 'package:input_data_form/theme_data.dart';
import 'package:input_data_form/widgets/form_input_widget.dart';

class InputFormScreen extends StatelessWidget {
  const InputFormScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final firstNameNotifier = ValueNotifier<String>("");
    final lastNameNotifier = ValueNotifier<String>("");
    final ageNotifier = ValueNotifier<double>(0);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Input Data Form",
            style: TextStyle(
              fontSize: HEADER_TEXT_SIZE,
              fontWeight: FontWeight.w700,
            ),
          ),
          FormInputWidget(
            name: "First Name",
            child: TextField(
              onChanged: (String value) {
                firstNameNotifier.value = value;
              },
            ),
          ),
          FormInputWidget(
            name: "Last Name",
            child: TextField(
              onChanged: (String value) {
                lastNameNotifier.value = value;
              },
            ),
          ),
          FormInputWidget(
            name: "Age",
            child: TextField(
              onChanged: (String value) {
                try {
                  ageNotifier.value = double.parse(value);
                } catch(ex) {
                  print("$ex");
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
