import 'package:flutter/material.dart';
import 'package:medhub/models/product_model.dart';
import 'package:medhub/shared/theme.dart';

class DiabetiDietItem extends StatelessWidget {
  final ProductModel data;
  const DiabetiDietItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 162,
      width: 110,
      decoration: const BoxDecoration(
        color: Color(0xffF5F7FA),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 99,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(data.image), fit: BoxFit.cover),
              shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12), topRight: Radius.circular(12)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 14, left: 14, right: 14),
            child: Text(
              data.name,
              style: overpassTextStyle.copyWith(
                  fontSize: 13, fontWeight: regular, color: kNeutral900),
            ),
          ),
        ],
      ),
    );
  }
}
