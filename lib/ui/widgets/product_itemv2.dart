import 'package:flutter/material.dart';
import 'package:medhub/models/product_model.dart';
import 'package:medhub/shared/theme.dart';

class ProductItemV2 extends StatelessWidget {
  final ProductModel data;
  const ProductItemV2({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 157,
      decoration: BoxDecoration(
          color: const Color(0xffF5F7FA),
          shape: BoxShape.rectangle,
          border: Border.all(color: const Color(0xffEBEBEB)),
          borderRadius: const BorderRadius.all(Radius.circular(12))),
      child: Column(
        children: [
          SizedBox(
            height: 158,
            child: Stack(
              children: [
                // Container(
                //   width: 57,
                //   height: 58,
                //   decoration: BoxDecoration(
                //     color: kNeutral900,
                //     borderRadius: BorderRadius.only(bottomRight: Radius.elliptical(200, 200), topLeft: Radius.circular(12))
                //   ),
                // ),
                // Positioned(
                //   top: 0,
                //   left: 0,
                //   child: ClipPath(
                //     clipper: SaleClipper(),
                //     child: Container(
                //       color: Colors.red,
                //       padding: const EdgeInsets.all(8),
                //       child: Text(
                //         'SALE',
                //         style: overpassTextStyle.copyWith(
                //           fontSize: 12,
                //           fontWeight: semibold,
                //           color: Colors.white
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                Center(
                  child: Image.asset(data.image, width: 100, height: 100,),
                ),
              ],
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
                    padding:
                        const EdgeInsets.only(left: 16, bottom: 4, top: 14, right: 16),
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
    );
  }
}

class SaleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width * 0.75, 0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width * 0.75, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
