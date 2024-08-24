import 'package:flutter/material.dart';
import 'package:medhub/services/navigation_service.dart';
import 'package:medhub/shared/theme.dart';
import 'package:medhub/ui/widgets/custom_button.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: InkWell(
                  onTap: () {
                    NavigationService().goBack();
                  },
                  child: Image.asset('assets/ic_arrow_left.png'),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/img_login_success.png'),
                    const SizedBox(height: 50),
                    Text(
                      'Thank you',
                      style: titleTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Your Order will be delivered with invoice ',
                        style: overpassTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: regular,
                          color: kNeutral900.withOpacity(0.45),
                        ),
                        children: [
                          TextSpan(
                            text: '#INV20240817',
                            style: overpassTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: regular,
                              color: kNeutral900,
                            ),
                          ),
                          TextSpan(
                            text:
                                '. You can track the delivery in the order section.',
                            style: overpassTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: regular,
                              color: kNeutral900.withOpacity(0.45),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              CustomButton(
                title: "Continue Order",
                onTap: () {
                  NavigationService().routeToAndRemove('/main');
                },
              ),
              const SizedBox(height: 26)
            ],
          ),
        ),
      ),
    );
  }
}
