import 'package:flutter/material.dart';
import 'package:medhub/models/carrousel_model.dart';
import 'package:medhub/shared/theme.dart';

class CarrouselItem extends StatelessWidget {
  final CarrouselModel data;

  const CarrouselItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
        image:
            DecorationImage(image: AssetImage(data.image), fit: BoxFit.cover),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              data.title,
              style: overpassTextStyle.copyWith(
                fontSize: 20,
                fontWeight: bold,
                color: KSuccess,
              ),
            ),
            const SizedBox(
              height: 11,
            ),
            Text(
              data.subtitle,
              style: overpassTextStyle.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w300,
                color: kNeutral900.withOpacity(0.65),
              ),
            )
          ],
        ),
      ),
    );
  }
}