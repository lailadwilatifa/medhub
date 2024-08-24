import 'package:flutter/material.dart';
import 'package:medhub/models/cart_model.dart';
import 'package:medhub/services/navigation_service.dart';
import 'package:medhub/shared/theme.dart';
import 'package:medhub/ui/widgets/cart_item.dart';
import 'package:medhub/ui/widgets/custom_button.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [appBar(), Expanded(child: content())],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16, right: 24, left: 24),
                child: CustomButton(
                    title: 'Place Order @ Rp 185.000',
                    onTap: () {
                      NavigationService().routeTo('/success');
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget appBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              NavigationService().goBack();
            },
            child: Image.asset('assets/ic_arrow_left.png'),
          ),
          const SizedBox(width: 16),
          Text(
            'Your Cart',
            style: title2TextStyle.copyWith(fontWeight: bold),
          )
        ],
      ),
    );
  }

  Widget content() {
    Widget addMore() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '2 Items in your cart',
            style: overpassTextStyle.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: kNeutral900.withOpacity(0.45)),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.add,
                size: 12,
                color: KSuccess,
              ),
              const SizedBox(width: 3),
              Text(
                'Add more',
                style: overpassTextStyle.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w300, color: KSuccess),
              )
            ],
          )
        ],
      );
    }

    Widget itemCart() {
      return Column(
        children: [
          CartItem(data: dataCart[0]),
          const SizedBox(
            height: 16,
          ),
          CartItem(data: dataCart[1]),
        ],
      );
    }

    Widget coupon() {
      return Container(
        padding: const EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 9),
        decoration: BoxDecoration(
          border: Border.all(
              width: 1, color: const Color(0xffE0E0E0).withOpacity(0.6)),
          shape: BoxShape.rectangle,
          borderRadius: const BorderRadius.all(
            Radius.circular(6),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 16,
                  width: 16,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/ic_coupon.png'))),
                ),
                const SizedBox(width: 16),
                Text(
                  '1 Coupon applied',
                  style: overpassTextStyle.copyWith(
                      fontSize: 14, fontWeight: semibold, color: KSuccess),
                )
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
      );
    }

    Widget paymentSummary() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment Summary',
            style: overpassTextStyle.copyWith(
                fontSize: 16, fontWeight: semibold, color: kNeutral900),
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Order Total',
                style: overpassTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: regular,
                    color: kNeutral900.withOpacity(0.45)),
              ),
              Text(
                'Rp 228.800',
                style: overpassTextStyle.copyWith(
                    fontSize: 14, fontWeight: regular, color: kNeutral900),
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Item Discount',
                style: overpassTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: regular,
                    color: kNeutral900.withOpacity(0.45)),
              ),
              Text(
                '- Rp 28.800',
                style: overpassTextStyle.copyWith(
                    fontSize: 14, fontWeight: regular, color: kNeutral900),
              )
            ],
          ),
          const SizedBox(height: 17),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Coupon Discount',
                style: overpassTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: regular,
                    color: kNeutral900.withOpacity(0.45)),
              ),
              Text(
                '- Rp 15.800',
                style: overpassTextStyle.copyWith(
                    fontSize: 14, fontWeight: regular, color: kNeutral900),
              )
            ],
          ),
          const SizedBox(height: 17),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Shipping',
                style: overpassTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: regular,
                    color: kNeutral900.withOpacity(0.45)),
              ),
              Text(
                'Free',
                style: overpassTextStyle.copyWith(
                    fontSize: 14, fontWeight: regular, color: kNeutral900),
              )
            ],
          ),
          const SizedBox(height: 16),
          Divider(
            height: 1,
            color: Colors.black.withOpacity(0.05),
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: overpassTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: regular,
                  color: kNeutral900,
                ),
              ),
              Text(
                'Free',
                style: overpassTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: bold,
                  color: kNeutral900,
                ),
              )
            ],
          ),
        ],
      );
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          addMore(),
          const SizedBox(height: 24),
          itemCart(),
          const SizedBox(height: 18),
          coupon(),
          const SizedBox(height: 29),
          paymentSummary()
        ],
      ),
    );
  }
}
