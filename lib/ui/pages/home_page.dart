import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medhub/models/carrousel_model.dart';
import 'package:medhub/models/category_model.dart';
import 'package:medhub/models/product_model.dart';
import 'package:medhub/services/navigation_service.dart';
import 'package:medhub/shared/theme.dart';
import 'package:medhub/ui/widgets/carrousel_item.dart';
import 'package:medhub/ui/widgets/category_item.dart';
import 'package:medhub/ui/widgets/feature_brand_item.dart';
import 'package:medhub/ui/widgets/product_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  int _pageIndex = 0;

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
      backgroundColor: const Color(0xffF7FBFF),
      body: Stack(
        children: [
          cardAccount(),
          Container(
            margin: const EdgeInsets.only(top: 215),
            child: content(),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            height: 312,
            margin: const EdgeInsets.only(top: 60),
            decoration: BoxDecoration(
              color: const Color(0xfff8fbff).withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(412),
              ),
            ),
          ),
          searchField(),
        ],
      ),
    );
  }

  Widget cardAccount() {
    return Container(
      height: 215,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment(0.8, 1),
          colors: <Color>[
            Color(0xff1B75BC),
            Color(0xff00AAF5),
          ],
          tileMode: TileMode.mirror,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 23,
                  backgroundColor: Colors.white,
                  child: ClipOval(
                    child: Image.asset(
                      'assets/img_profile1.png',
                      width: 42,
                      height: 42,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/ic_notification_white.png'),
                    const SizedBox(width: 20),
                    InkWell(
                      onTap: () => NavigationService().routeTo('/cart'),
                      child: Image.asset('assets/ic_cart_white.png'),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 24),
            Text(
              'Hi, Lorem',
              style: overpassTextStyle.copyWith(
                fontSize: 24,
                fontWeight: bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Welcome to MedHub',
              style: overpassTextStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget searchField() {
    return Container(
      margin: const EdgeInsets.only(top: 190),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      height: 50,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 50,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: TextField(
        style: overpassTextStyle,
        decoration: InputDecoration(
            hintText: 'Search Medicine & Healthcare products',
            hintStyle: overpassTextStyle.copyWith(
                fontSize: 13,
                fontWeight: regular,
                color: kNeutral900.withOpacity(0.45)),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(30.0),
            ),
            fillColor: Colors.white,
            filled: true,
            prefixIcon: Image.asset('assets/ic_search.png')),
      ),
    );
  }

  Widget content() {
    Widget categories() {
      return SizedBox(
        height: 70,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: dataCategory.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.only(
                right: 26,
                left: index == 0 ? 28 : 0,
              ),
              child: CategoryItem(
                  image: dataCategory[index].image,
                  title: dataCategory[index].title,
                  gradient: dataCategory[index].gradient),
            );
          },
        ),
      );
    }

    Widget carrousel() {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        width: double.infinity,
        height: 140,
        decoration: const BoxDecoration(
          color: Color(0xffF8F8F8),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: Stack(
          children: [
            PageView.builder(
              onPageChanged: (index) {
                setState(() {
                  _pageIndex = index;
                  _pageController.animateToPage(_pageIndex,
                      duration: const Duration(milliseconds: 350),
                      curve: Curves.easeIn);
                });
              },
              itemCount: dataCarrousel.length,
              controller: _pageController,
              itemBuilder: (context, index) => CarrouselItem(
                data: dataCarrousel[index],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 14,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                    dataCarrousel.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: DotIndicator(
                        isActive: index == _pageIndex,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget dealsOfTheDay() {
      return SizedBox(
        height: 250,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: dataDeals.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.only(
                right: 17,
                left: index == 0 ? 24 : 0,
              ),
              child: ProductItem(
                data: dataDeals[index],
              ),
            );
          },
        ),
      );
    }

    Widget featureBrands() {
      return SizedBox(
        height: 130,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: dataFeatureBrands.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.only(
                right: 17,
                left: index == 0 ? 24 : 0,
              ),
              child: FeatureBrandItem(
                data: dataFeatureBrands[index],
              ),
            );
          },
        ),
      );
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 48, bottom: 16, left: 24),
            child: Text(
              'Top Categories',
              style: title2TextStyle,
            ),
          ),
          categories(),
          const SizedBox(
            height: 45,
          ),
          carrousel(),
          Padding(
            padding:
                const EdgeInsets.only(top: 24, bottom: 16, right: 24, left: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Deals of the Day',
                  style: title2TextStyle,
                ),
                Text(
                  'More',
                  style: overpassTextStyle.copyWith(
                      fontSize: 14, fontWeight: regular, color: KSuccess),
                )
              ],
            ),
          ),
          dealsOfTheDay(),
          Padding(
            padding: const EdgeInsets.only(top: 24, bottom: 16, left: 24),
            child: Text(
              'Featured Brands',
              style: title2TextStyle,
            ),
          ),
          featureBrands(),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    this.isActive = false,
    super.key,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 4,
      width: 4,
      decoration: BoxDecoration(
          color: isActive
              ? const Color(0xff00A59B)
              : kNeutral900.withOpacity(0.15),
          shape: BoxShape.circle),
    );
  }
}
