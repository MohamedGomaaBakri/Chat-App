// ignore_for_file: must_be_immutable, camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';

class Text_Feild extends StatelessWidget {
  Text_Feild({super.key, this.HintText, this.onChanged, this.obsecure = false});

  String? HintText;
  Function(String)? onChanged;
  bool? obsecure;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // ignore: body_might_complete_normally_nullable
      validator: (value) {
        if (value!.isEmpty) {
          return 'invalid input';
        }
      },
      obscureText: obsecure!,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: HintText,
        hintStyle: const TextStyle(color: Colors.white),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
