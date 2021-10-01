import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final String hint;
  final TextInputType inputType;
  final Widget? leading, trailing;
  final int? minLines, maxLines, maxLength;
  final bool? obscure, readOnly;
  final TextEditingController? controller;

  const Input({
    Key? key,
    required this.hint,
    required this.inputType,
    this.leading,
    this.trailing,
    this.minLines,
    this.maxLines,
    this.maxLength,
    this.obscure,
    this.readOnly,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: hint,
        prefixIcon: leading,
        suffixIcon: trailing,
      ),
      keyboardType: inputType,
      minLines: minLines ?? 1,
      maxLines: maxLines ?? 1,
      maxLength: maxLength,
      obscureText: obscure ?? false,
      readOnly: readOnly ?? false,
      controller: controller,
    );
  }
}
