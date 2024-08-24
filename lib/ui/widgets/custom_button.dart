import 'package:flutter/material.dart';
import 'package:medhub/shared/theme.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function() onTap;

  const CustomButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(99),
        ),
        child: Center(
          child: Text(
            title,
            style: overpassTextStyle.copyWith(
              color: Colors.white,
              fontSize: 16,
              fontWeight: bold,
            ),
          ),
        ),
      ),
    );
  }
}
