import 'package:baca_app/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String title;
  final bool obscureText;
  final String? placeholderText;
  final Color hintColor;
  final TextEditingController? controller;
  const CustomFormField({
    super.key,
    required this.title,
    this.placeholderText,
    this.hintColor = const Color(0xffB8B8B8),
    this.obscureText = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: robotoGreyTextStyle.copyWith(
            fontWeight: bold,
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        TextFormField(
          obscureText: obscureText,
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: placeholderText,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: regular,
              color: hintColor,
            ),
            contentPadding: const EdgeInsets.all(12),
          ),
        )
      ],
    );
  }
}
