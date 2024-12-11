import 'package:flutter/material.dart';
import 'package:input_data_form/screens/saved_data_screen.dart';
import 'package:input_data_form/theme_data.dart';
import 'package:input_data_form/widgets/form_input_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InputFormScreen extends StatelessWidget {
  const InputFormScreen({super.key});

  Future<void> saveData(String firstName, String lastName, double age) async {
    final pref = await SharedPreferences.getInstance();
    await Future.delayed(const Duration(seconds: 1), () async {
      pref.setString("firstName", "Saved:: $firstName");
      pref.setString("lastName", "Saved:: $lastName");
      pref.setDouble("age", age);
    });
  }

  @override
  Widget build(BuildContext context) {
    final firstNameNotifier = ValueNotifier<String>("");
    final lastNameNotifier = ValueNotifier<String>("");
    final ageNotifier = ValueNotifier<double>(0);
    final validationNotifier = ValueNotifier("");

    return Scaffold(
      appBar: AppBar(
        title: const Text("Input Form"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  "Input Data Form",
                  style: TextStyle(
                    fontSize: HEADER_TEXT_SIZE,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              FormInputWidget(
                name: "First Name",
                child: TextField(
                  onChanged: (String value) {
                    if (value.length > 20) {
                      validationNotifier.value =
                      "First name cannot exceed 20 characters!";
                    } else {
                      firstNameNotifier.value = value;
                      validationNotifier.value = "";
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: "Enter your first name",
                  ),
                ),
              ),
              const SizedBox(height: 15),
              FormInputWidget(
                name: "Last Name",
                child: TextField(
                  onChanged: (String value) {
                    if (value.length > 20) {
                      validationNotifier.value =
                      "Last name cannot exceed 20 characters!";
                    } else {
                      lastNameNotifier.value = value;
                      validationNotifier.value = "";
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: "Enter your last name",
                  ),
                ),
              ),
              const SizedBox(height: 15),
              FormInputWidget(
                name: "Age",
                child: TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (String value) {
                    try {
                      ageNotifier.value = double.parse(value);
                      validationNotifier.value = "";
                    } catch (ex) {
                      validationNotifier.value = "Please enter a valid number!";
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: "Enter your age",
                  ),
                ),
              ),
              const SizedBox(height: 15),
              ValueListenableBuilder(
                valueListenable: validationNotifier,
                builder: (_, value, __) {
                  return Center(
                    child: Text(
                      value,
                      style: const TextStyle(color: Colors.red),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              Center(
                child: ValueListenableBuilder(
                  valueListenable: firstNameNotifier,
                  builder: (_, firstName, __) {
                    return ValueListenableBuilder(
                      valueListenable: lastNameNotifier,
                      builder: (_, lastName, __) {
                        return ValueListenableBuilder(
                          valueListenable: ageNotifier,
                          builder: (_, age, __) {
                            return ElevatedButton(
                              onPressed: () {
                                if (firstName.isEmpty ||
                                    lastName.isEmpty ||
                                    age <= 0) {
                                  validationNotifier.value =
                                  "All fields must be filled correctly!";
                                } else {
                                  saveData(firstName, lastName, age)
                                      .whenComplete(() {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                        const SavedDataScreen(),
                                      ),
                                    );
                                  });
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                backgroundColor: Colors.blueAccent,
                              ),
                              child: const Text(
                                "Save",
                                style: TextStyle(fontSize: 16),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
