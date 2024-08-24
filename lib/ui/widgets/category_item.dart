import 'package:flutter/material.dart';
import 'package:medhub/services/navigation_service.dart';
import 'package:medhub/shared/theme.dart';

class CategoryItem extends StatelessWidget {
  final String image, title;
  final List<Color> gradient;

  const CategoryItem(
      {super.key,
      required this.image,
      required this.title,
      required this.gradient});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        NavigationService().routeTo('/category');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 48,
            width: 48,
            margin: const EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: const Alignment(0.8, 1),
                colors: gradient,
                tileMode: TileMode.mirror,
              ),
            ),
            child: Center(
              child: Image.asset(image),
            ),
          ),
          Text(
            title,
            style: overpassTextStyle.copyWith(
              fontSize: 11,
              color: kNeutral900.withOpacity(0.95),
              fontWeight: FontWeight.w300
            ),
          )
        ],
      ),
    );
  }
}
