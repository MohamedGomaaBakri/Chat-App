// ignore_for_file: camel_case_types, must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';

class defaultButton extends StatelessWidget {
  defaultButton({super.key, required this.ButtonName, this.onTap});

  VoidCallback? onTap;
  String ButtonName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 45,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(ButtonName),
        ),
      ),
    );
  }
}
