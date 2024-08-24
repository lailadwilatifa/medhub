import 'package:flutter/material.dart';
import 'package:medhub/services/navigation_service.dart';
import 'package:medhub/shared/theme.dart';
import 'package:medhub/ui/widgets/custom_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/img_mask_group.png'),
            Padding(
              padding: const EdgeInsets.only(top: 34, bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Welcome to ',
                    style: titleTextStyle,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                    decoration: const BoxDecoration(
                      color: Color(0xffFFA629),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    child: Text(
                      'MedHub',
                      style: titleTextStyle,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 60, left: 60, bottom: 34),
              child: Text(
                'Do you want some help with your health to get better life?',
                style: descTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 32, left: 32, bottom: 20),
              child: Column(
                children: [
                  CustomButton(title: 'SIGN UP WITH EMAIL', onTap: () {
                    NavigationService().routeTo('/register');
                  }),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      border: Border.all(color: kNeutral900.withOpacity(0.1)),
                      borderRadius: BorderRadius.circular(99),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset('assets/ic_facebook.png'),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            'CONTINUE WITH FACEBOOK',
                            style: overpassTextStyle.copyWith(
                              color: kNeutral900.withOpacity(0.75),
                              fontSize: 13,
                              fontWeight: bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      border: Border.all(color: kNeutral900.withOpacity(0.1)),
                      borderRadius: BorderRadius.circular(99),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset('assets/ic_google.png'),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            'CONTINUE WITH GMAIL',
                            style: overpassTextStyle.copyWith(
                              color: kNeutral900.withOpacity(0.75),
                              fontSize: 13,
                              fontWeight: bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                NavigationService().routeTo('/login');
              },
              child: Text(
                'Login',
                style: overpassTextStyle.copyWith(
                  fontSize: 14,
                  color: kNeutral900.withOpacity(0.45),
                  fontWeight: regular,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
