import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final Function onChanged;
  final Function validator;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final TextInputAction textInputAction;

  CustomTextField({
    this.labelText,
    this.onChanged,
    this.validator,
    this.keyboardType,
    this.controller,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
        validator: validator,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        cursorColor: Colors.blue,
        controller: controller,
        textAlign: TextAlign.left,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade900,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
