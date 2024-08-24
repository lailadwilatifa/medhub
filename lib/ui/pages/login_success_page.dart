import 'package:flutter/material.dart';
import 'package:medhub/services/navigation_service.dart';
import 'package:medhub/shared/theme.dart';
import 'package:medhub/ui/widgets/custom_button.dart';

class LoginSuccess extends StatelessWidget {
  const LoginSuccess({super.key});

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
                      'Phone Number Verified',
                      style: titleTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Congradulations, your phone number has been verified. You can start using the app',
                      style: descTextStyle,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              CustomButton(
                title: "CONTINUE",
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
