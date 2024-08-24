import 'package:flutter/material.dart';
import 'package:medhub/models/carrousel_model.dart';
import 'package:medhub/models/product_model.dart';
import 'package:medhub/services/navigation_service.dart';
import 'package:medhub/shared/theme.dart';
import 'package:medhub/ui/widgets/diabeticdiet_item.dart';
import 'package:medhub/ui/widgets/product_itemv2.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appBar(),
            Expanded(child: content(context)),
          ],
        ),
      ),
    );
  }

  Widget appBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 24, bottom: 18),
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
            'Diabetes Care',
            style: title2TextStyle.copyWith(fontWeight: bold),
          )
        ],
      ),
    );
  }

  Widget content(BuildContext context) {
    Widget imageCarrousel() {
      return Container(
        width: double.infinity,
        height: 140,
        margin: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
          image: DecorationImage(
              image: AssetImage(dataCarrousel[0].image), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                dataCarrousel[0].title,
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
                dataCarrousel[0].subtitle,
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

    Widget dibaeticDiet() {
      return SizedBox(
        height: 162,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: dataDiebaticDiet.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.only(
                right: 26,
                left: index == 0 ? 28 : 0,
              ),
              child: DiabetiDietItem(data: dataDiebaticDiet[index]),
            );
          },
        ),
      );
    }

    Widget allProducts() {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ProductItemV2(data: dataAllProducts[0]),
                const SizedBox(width: 15,),
                ProductItemV2(data: dataAllProducts[1]),
              ],
            ),
            const SizedBox(height: 17,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ProductItemV2(data: dataAllProducts[2]),
                const SizedBox(width: 15,),
                ProductItemV2(data: dataAllProducts[3]),
              ],
            )
          ],
        ),
      );
      // return SizedBox(
      //   height: 300,
      //   child: GridView.count(
      //     crossAxisCount: 2,
      //     physics: const NeverScrollableScrollPhysics(),
      //     shrinkWrap: true,
      //     padding: const EdgeInsets.all(20),
      //     primary: false,
      //     crossAxisSpacing: 10,
      //     mainAxisSpacing: 10,
      //     children: [
      //       ProductItemV2(data: dataAllProducts[0]),
      //       ProductItemV2(data: dataAllProducts[0]),
      //       ProductItemV2(data: dataAllProducts[0]),
      //       ProductItemV2(data: dataAllProducts[0])
      //     ],
      //   ),
      // );
      //   return SizedBox(
      //     height: 250,
      //     child: ListView.builder(
      //       scrollDirection: Axis.horizontal,
      //       itemCount: dataAllProducts.length,
      //       itemBuilder: (BuildContext context, int index) {
      //         return Padding(
      //           padding: EdgeInsets.only(
      //             right: 26,
      //             left: index == 0 ? 28 : 0,
      //           ),
      //           child: ProductItemV2(data: dataAllProducts[index]),
      //         );
      //       },
      //     ),
      //   );
    }

    return ListView(
      children: [
        imageCarrousel(),
        Padding(
          padding: const EdgeInsets.only(top: 19, bottom: 16, left: 24),
          child: Text(
            'Diabetic Diet',
            style: title2TextStyle,
          ),
        ),
        dibaeticDiet(),
        Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 24, left: 24),
          child: Text(
            'All Products',
            style: title2TextStyle,
          ),
        ),
        allProducts(),
        const SizedBox(height: 38,)
      ],
    );
  }
}
