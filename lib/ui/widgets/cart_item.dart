import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medhub/models/cart_model.dart';
import 'package:medhub/shared/theme.dart';

class CartItem extends StatelessWidget {
  final CartModel data;
  const CartItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 70,
              height: 80,
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                image: DecorationImage(
                    image: AssetImage(data.image), fit: BoxFit.cover),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.name,
                            style: overpassTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: semibold,
                                color: kNeutral900),
                          ),
                          Text(
                            data.desc,
                            style: overpassTextStyle.copyWith(
                              fontSize: 13,
                              fontWeight: regular,
                              color: kNeutral900.withOpacity(0.45),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 20,
                        width: 20,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/ic_close.png'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        data.price,
                        style: overpassTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: bold,
                          color: kNeutral900,
                        ),
                      ),
                      Container(
                        height: 32,
                        decoration: const BoxDecoration(
                          color: Color(0xffF1FFEA),
                          borderRadius: BorderRadius.all(Radius.circular(36)),
                          shape: BoxShape.rectangle,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                  color: KSuccess, shape: BoxShape.circle),
                              child: const Center(
                                child: Icon(
                                  Icons.remove,
                                  size: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: Text(
                                '1',
                                style: GoogleFonts.sofia(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                  color: kNeutral900, shape: BoxShape.circle),
                              child: const Center(
                                child: Icon(
                                  Icons.add,
                                  size: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Divider(
          height: 1,
          color: Colors.black.withOpacity(0.05),
        )
      ],
    );
  }
}
