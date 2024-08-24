import 'package:flutter/material.dart';
import 'package:medhub/shared/theme.dart';

class CustomTextfield extends StatelessWidget {
  final String label;
  final TextInputType inputType;
  const CustomTextfield({
    super.key,
    required this.label,
    required this.inputType
    });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: inputType,
      style: overpassTextStyle.copyWith(
          fontSize: 14, color: kNeutral900, fontWeight: regular),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
            fontSize: 15,
            fontWeight: regular,
            color: kNeutral900.withOpacity(0.45)),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: kNeutral900.withOpacity(0.10),
            width: 1,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: KSuccess,
            width: 1,
          ),
        ),
      ),
    );
  }
}
