import 'package:flutter/material.dart';
import 'package:medhub/models/product_model.dart';
import 'package:medhub/shared/theme.dart';

class PackageSizeItem extends StatelessWidget {
  final ProductModel data;
  final bool isActive;
  final Function onTap;

  const PackageSizeItem(
      {super.key,
      required this.data,
      required this.isActive,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap,
      child: Container(
        height: 68,
        width: 79,
        decoration: BoxDecoration(
          color: isActive
              ? KSuccess.withOpacity(0.05)
              : const Color(0xffF5F5F5),
          shape: BoxShape.rectangle,
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
          border: Border.all(
            width: 1,
            color: isActive ? KSuccess : const Color(0xffF5F5F5),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Rp ${data.price}',
              style: overpassTextStyle.copyWith(
                fontSize: 10,
                fontWeight: bold,
                color: isActive ? KSuccess : kNeutral900
              ),
            ),
            const SizedBox(height: 5),
            Text(
              data.name,
              style: overpassTextStyle.copyWith(
                fontSize: 12,
                fontWeight: regular,
                color: isActive ? KSuccess : kNeutral900.withOpacity(0.75)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
