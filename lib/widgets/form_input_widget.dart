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
    return Column(
      children: [
        Text(name),
        child,
      ],
    );
  }
}
