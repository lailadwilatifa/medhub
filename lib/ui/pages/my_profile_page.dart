import 'package:flutter/material.dart';
import 'package:medhub/models/product_model.dart';
import 'package:medhub/shared/theme.dart';
import 'package:medhub/ui/widgets/my_profile_item.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 26),
                child: Text(
                  'My Profile',
                  style: title2TextStyle,
                ),
              ),
              content()
            ],
          ),
        ),
      ),
    );
  }

  Widget content() {
    Widget profilData() {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 62,
            width: 62,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, -3),
                ),
              ],
              border: Border.all(color: Colors.white),
              shape: BoxShape.circle,
              image: const DecorationImage(
                  image: AssetImage('assets/img_profile2.png'),
                  fit: BoxFit.cover),
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi, Lorep Ipsum',
                style: overpassTextStyle.copyWith(
                    fontSize: 20, color: kNeutral900, fontWeight: bold),
              ),
              Text(
                'Welcome to MedHub',
                style: overpassTextStyle.copyWith(
                    fontWeight: regular,
                    fontSize: 14,
                    color: kNeutral900.withOpacity(0.45)),
              )
            ],
          )
        ],
      );
    }

    Widget item() {
      return Column(
        children: [
          MyProfileItem(data: dataProfile[0]),
          MyProfileItem(data: dataProfile[1]),
          MyProfileItem(data: dataProfile[2]),
          MyProfileItem(data: dataProfile[3]),
          MyProfileItem(data: dataProfile[4]),
          MyProfileItem(data: dataProfile[5], lastItem: true,),
        ],
      );
    }

    return Column(
      children: [
        profilData(),
        const SizedBox(height: 40),
        item()
      ],
    );
  }
}
