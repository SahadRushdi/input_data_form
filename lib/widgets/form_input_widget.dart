import 'package:flutter/material.dart';

class FormInputWidget extends StatelessWidget {

  final String name;
  final Widget child;
  const FormInputWidget({
    super.key,
    required this.name,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name),
          const SizedBox(height: 3),
          child,
        ],
      ),
    );
  }
}
