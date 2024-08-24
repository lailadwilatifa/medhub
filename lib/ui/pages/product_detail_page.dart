import 'package:flutter/material.dart';
import 'package:medhub/models/product_model.dart';
import 'package:medhub/services/navigation_service.dart';
import 'package:medhub/shared/theme.dart';
import 'package:medhub/ui/pages/onboarding_page.dart';
import 'package:medhub/ui/widgets/custom_button.dart';
import 'package:medhub/ui/widgets/package_size_item.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  late PageController _pageController;
  int _pageIndex = 0;
  int _selectedPackage = 0;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

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
                  padding:
                      const EdgeInsets.only(bottom: 30, right: 24, left: 24),
                  child: CustomButton(
                      title: 'GO TO CART',
                      onTap: () {
                        NavigationService().routeTo('/cart');
                      }),
                ),
              ),
            ],
          ),
        ));
  }

  Widget appBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              NavigationService().goBack();
            },
            child: Image.asset('assets/ic_arrow_left.png'),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/ic_notification_black.png'),
              const SizedBox(width: 20),
              Image.asset('assets/ic_cart_black.png'),
            ],
          )
        ],
      ),
    );
  }

  Widget content() {
    Widget carrousel() {
      return Column(
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xffF8F8F8),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            height: 140,
            child: PageView.builder(
              onPageChanged: (index) {
                setState(() {
                  _pageIndex = index;
                  _pageController.animateToPage(_pageIndex,
                      duration: const Duration(milliseconds: 350),
                      curve: Curves.easeIn);
                });
              },
              itemCount: dataCarrouselProductDetail.length,
              controller: _pageController,
              itemBuilder: (context, index) => Container(
                height: 140,
                decoration: const BoxDecoration(
                  color: Color(0xffF8F8F8),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: Center(
                  child: Image.asset(dataCarrouselProductDetail[index]),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                dataCarrouselProductDetail.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: DotIndicator(
                    isActive: index == _pageIndex,
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    }

    Widget hargaAndAddCart() {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                'Rp 56.000',
                style: overpassTextStyle.copyWith(
                  fontSize: 18,
                  color: kNeutral900,
                  fontWeight: bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Etiam mollis ',
                style: overpassTextStyle.copyWith(
                  fontSize: 14,
                  color: kNeutral900.withOpacity(0.45),
                  fontWeight: regular,
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/ic_plus_border.png',
                width: 24,
                height: 24,
              ),
              const SizedBox(width: 10),
              Text(
                'Add to cart',
                style: overpassTextStyle.copyWith(
                    fontSize: 14, fontWeight: regular, color: KSuccess),
              )
            ],
          )
        ],
      );
    }

    Widget packageSize() {
      return SizedBox(
        height: 70,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: dataPackageSize.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(
                right: 16,
              ),
              child: PackageSizeItem(
                data: dataPackageSize[index],
                isActive: index == _selectedPackage,
                onTap: () {
                  setState(() {
                    _selectedPackage = index;
                  });
                },
              ),
            );
          },
        ),
      );
    }

    Widget productDetails() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Product Details',
            style: title2TextStyle,
          ),
          const SizedBox(height: 8),
          Text(
            'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi.Nunc risus massa, gravida id egestas a, pretium vel tellus. Praesent feugiat diam sit amet pulvinar finibus. Etiam et nisi aliquet, accumsan nisi sit.',
            style: overpassTextStyle.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: kNeutral900.withOpacity(0.45),
            ),
          ),
        ],
      );
    }

    Widget ratingAndReviews() {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    '4.4',
                    style: overpassTextStyle.copyWith(
                        fontSize: 33,
                        fontWeight: semibold,
                        color: Colors.black),
                  ),
                  const SizedBox(width: 10),
                  const Icon(
                    Icons.star,
                    size: 26,
                    color: Color(0xffFFC000),
                  )
                ],
              ),
              const SizedBox(height: 12),
              Text(
                '923 Ratings\nand 257 Reviews',
                style: overpassTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: regular,
                  color: kNeutral900.withOpacity(0.45),
                ),
              )
            ],
          ),
          const SizedBox(width: 18),
          Container(
            width: 1,
            height: 95,
            color: Colors.black.withOpacity(0.1),
          ),
          const SizedBox(width: 13),
          Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '5',
                    style: overpassTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: regular,
                      color: kNeutral900.withOpacity(0.45),
                    ),
                  ),
                  const SizedBox(width: 1),
                  const Icon(
                    Icons.star,
                    size: 16,
                    color: Color(0xffFFD040),
                  ),
                  LinearPercentIndicator(
                    width: MediaQuery.of(context).size.width * 0.33,
                    barRadius: const Radius.circular(3),
                    lineHeight: 5,
                    percent: 0.67,
                    progressColor: KSuccess,
                    backgroundColor: Colors.black.withOpacity(0.1),
                  ),
                  Text(
                    '67%',
                    style: overpassTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: regular,
                      color: kNeutral900.withOpacity(0.45),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '4',
                    style: overpassTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: regular,
                      color: kNeutral900.withOpacity(0.45),
                    ),
                  ),
                  const SizedBox(width: 1),
                  const Icon(
                    Icons.star,
                    size: 16,
                    color: Color(0xffFFD040),
                  ),
                  LinearPercentIndicator(
                    width: MediaQuery.of(context).size.width * 0.33,
                    barRadius: const Radius.circular(3),
                    lineHeight: 5,
                    percent: 0.20,
                    progressColor: KSuccess,
                    backgroundColor: Colors.black.withOpacity(0.1),
                  ),
                  Text(
                    '20%',
                    style: overpassTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: regular,
                      color: kNeutral900.withOpacity(0.45),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '3',
                    style: overpassTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: regular,
                      color: kNeutral900.withOpacity(0.45),
                    ),
                  ),
                  const SizedBox(width: 1),
                  const Icon(
                    Icons.star,
                    size: 16,
                    color: Color(0xffFFD040),
                  ),
                  LinearPercentIndicator(
                    width: MediaQuery.of(context).size.width * 0.33,
                    barRadius: const Radius.circular(3),
                    lineHeight: 5,
                    percent: 0.07,
                    progressColor: KSuccess,
                    backgroundColor: Colors.black.withOpacity(0.1),
                  ),
                  Text(
                    '7%',
                    style: overpassTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: regular,
                      color: kNeutral900.withOpacity(0.45),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '2',
                    style: overpassTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: regular,
                      color: kNeutral900.withOpacity(0.45),
                    ),
                  ),
                  const SizedBox(width: 1),
                  const Icon(
                    Icons.star,
                    size: 16,
                    color: Color(0xffFFD040),
                  ),
                  LinearPercentIndicator(
                    width: MediaQuery.of(context).size.width * 0.33,
                    barRadius: const Radius.circular(3),
                    lineHeight: 5,
                    percent: 0,
                    progressColor: KSuccess,
                    backgroundColor: Colors.black.withOpacity(0.1),
                  ),
                  Text(
                    '0%',
                    style: overpassTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: regular,
                      color: kNeutral900.withOpacity(0.45),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '1',
                    style: overpassTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: regular,
                      color: kNeutral900.withOpacity(0.45),
                    ),
                  ),
                  const SizedBox(width: 1),
                  const Icon(
                    Icons.star,
                    size: 16,
                    color: Color(0xffFFD040),
                  ),
                  LinearPercentIndicator(
                    width: MediaQuery.of(context).size.width * 0.33,
                    barRadius: const Radius.circular(3),
                    lineHeight: 5,
                    percent: 0.02,
                    progressColor: KSuccess,
                    backgroundColor: Colors.black.withOpacity(0.1),
                  ),
                  Text(
                    '2%',
                    style: overpassTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: regular,
                      color: kNeutral900.withOpacity(0.45),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      );
    }

    Widget dateAndEtc() {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Lorem Hoffman',
                style: overpassTextStyle.copyWith(
                    fontSize: 14, fontWeight: regular, color: kNeutral900),
              ),
              Text(
                '05 August 2024',
                style: overpassTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: regular,
                    color: kNeutral900.withOpacity(0.45)),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.star,
                color: Color(0xffFFC000),
                size: 12,
              ),
              const SizedBox(width: 1),
              Text(
                '4.2',
                style: overpassTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: regular,
                  color: kNeutral900.withOpacity(0.45),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi.Nunc risus massa, gravida id egestas ',
            style: overpassTextStyle.copyWith(
              fontSize: 13,
              fontWeight: regular,
              color: kNeutral900.withOpacity(0.45),
            ),
          ),
        ],
      );
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sugar Free Gold Low Calories',
            style: overpassTextStyle.copyWith(
                fontSize: 22, fontWeight: bold, color: kNeutral900),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4, bottom: 16),
            child: Text(
              'Etiam mollis metus non purus',
              style: overpassTextStyle.copyWith(
                fontSize: 14,
                color: kNeutral900.withOpacity(0.45),
                fontWeight: regular,
              ),
            ),
          ),
          carrousel(),
          const SizedBox(height: 22),
          hargaAndAddCart(),
          Padding(
            padding: const EdgeInsets.only(top: 18, bottom: 9),
            child: Divider(
              height: 1,
              color: Colors.black.withOpacity(0.1),
            ),
          ),
          Text(
            'Package size',
            style: title2TextStyle,
          ),
          const SizedBox(height: 16),
          packageSize(),
          const SizedBox(height: 7),
          productDetails(),
          Padding(
            padding: const EdgeInsets.only(top: 24, bottom: 13),
            child: Text(
              'Rating and Reviews',
              style: title2TextStyle,
            ),
          ),
          ratingAndReviews(),
          const SizedBox(height: 50),
          dateAndEtc(),
          const SizedBox(height: 150)
        ],
      ),
    );
  }
}
