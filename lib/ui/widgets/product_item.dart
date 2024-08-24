import 'package:flutter/material.dart';
import 'package:medhub/models/product_model.dart';
import 'package:medhub/services/navigation_service.dart';
import 'package:medhub/shared/theme.dart';

class ProductItem extends StatelessWidget {
  final ProductModel data;
  const ProductItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => NavigationService().routeTo('/productdetail'),
      child: Container(
        height: 250,
        width: 180,
        decoration: BoxDecoration(
          color: const Color(0xffEEEEF0),
          shape: BoxShape.rectangle,
          border: Border.all(color: const Color(0xffEBEBEB)),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 154,
              child: Center(
                child: Image.asset(data.image),
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16, bottom: 4, top: 14, right: 16),
                      child: Text(
                        data.name,
                        style: overpassTextStyle.copyWith(
                            fontSize: 13,
                            color: kNeutral900,
                            fontWeight: regular),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Text(
                            data.price,
                            style: overpassTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: bold,
                                color: kNeutral900),
                          ),
                        ),
                        Container(
                          height: 24,
                          width: 48,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: KSuccess,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.star,
                                size: 12,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                data.rating,
                                style: overpassTextStyle.copyWith(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: bold),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
