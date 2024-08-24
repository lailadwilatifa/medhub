import 'package:flutter/material.dart';

class CustomLinearProgressIndicator extends StatelessWidget {
  final double percent;
  final Color backgroundColor;
  final Color progressColor;
  final double height;

  CustomLinearProgressIndicator({
    required this.percent,
    this.backgroundColor = Colors.grey,
    this.progressColor = Colors.blue,
    this.height = 6.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: percent,
        child: Container(
          decoration: BoxDecoration(
            color: progressColor,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}
