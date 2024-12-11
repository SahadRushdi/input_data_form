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

    final validationNotifier = ValueNotifier("");

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
                if (value.length>20) {
                  validationNotifier.value = "First name cannot exceed 20 characters!";
                } else {
                  firstNameNotifier.value = value;
                }
              },
            ),
          ),
          FormInputWidget(
            name: "Last Name",
            child: TextField(
              onChanged: (String value) {
                if (value.length>20) {
                validationNotifier.value = "Last name cannot exceed 20 characters!";
                } else {
                  lastNameNotifier.value = value;
                }
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
                  validationNotifier.value="Please enter a Valid Number!";
                }
              },
            ),
          ),
          ValueListenableBuilder(valueListenable: validationNotifier, builder: (_,value,__) {
            return Text(value, style: const TextStyle(
              color: Colors.red
            ),);
          }),

          ElevatedButton(
              onPressed: (){},
              child: const Text("Save")
          ),
        ],
      ),
    );
  }
}
