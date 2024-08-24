import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medhub/models/product_model.dart';
import 'package:medhub/shared/theme.dart';

class FeatureBrandItem extends StatelessWidget {
  final ProductModel data;
  const FeatureBrandItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.symmetric(horizontal: 7),
          width: 80,
          height: 80,
          decoration:
              const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          child: Center(
            child: Image.asset(data.image),
          ),
        ),
        Text(
          data.name,
          style: overpassTextStyle.copyWith(
              fontSize: 13, color: kNeutral900, fontWeight: regular),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
