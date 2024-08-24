import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medhub/models/product_model.dart';
import 'package:medhub/shared/theme.dart';

class MyProfileItem extends StatelessWidget {
  final ProductModel data;
  final bool lastItem;
  const MyProfileItem({super.key, required this.data, this.lastItem = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 51,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            data.image,
            height: 24,
            width: 24,
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 16, bottom: 13),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                width: 1,
                color: const Color(0xff091C3F).withOpacity(0.08),
              ))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    data.name,
                    style: overpassTextStyle.copyWith(
                        fontSize: 15,
                        color: kNeutral900.withOpacity(0.75),
                        fontWeight: medium),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: Icon(
                      Icons.chevron_right,
                      color: kNeutral900,
                      size: 16,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
