import 'package:flutter/material.dart';

class getTextFromFields extends StatelessWidget {
  TextEditingController controller;
  String hintName;
  bool isObscureText;
  TextInputType inputType;

  getTextFromFields({required this.controller, required this.hintName, this.isObscureText = false, this.inputType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      margin: const EdgeInsets.only(top: 20.0),

      child: TextField(
        controller: controller,
        obscureText: isObscureText,
        keyboardType: inputType,
        style: const TextStyle(
          color: Color(0xFFB6B7B7),
          decoration: TextDecoration.none,
        ),
        decoration: InputDecoration(
          hintText: hintName,
          fillColor: const Color(0xFF2C3F50),
          filled: true,
          hintStyle: const TextStyle(
            color: Color(0xFFB6B7B7),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none, // To remove the border
          ),
        ),
      ),
    );
  }
}