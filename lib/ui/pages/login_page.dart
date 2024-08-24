import 'package:flutter/material.dart';
import 'package:medhub/services/navigation_service.dart';
import 'package:medhub/shared/theme.dart';
import 'package:medhub/ui/widgets/custom_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: InkWell(
                          onTap: () {
                            NavigationService().goBack();
                          },
                          child: Image.asset('assets/ic_arrow_left.png')),
                    ),
                    Text(
                      'Welcome Back!',
                      style: titleTextStyle,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    TextField(
                      style: overpassTextStyle.copyWith(
                          fontSize: 14,
                          color: kNeutral900,
                          fontWeight: regular),
                      decoration: InputDecoration(
                        labelText: 'Username',
                        labelStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: regular,
                            color: kNeutral900.withOpacity(0.45)),
                        prefixIcon: Image.asset('assets/ic_username.png'),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: kNeutral900.withOpacity(0.10),
                            width: 1,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: kNeutral900.withOpacity(0.10),
                            width: 1,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: KSuccess,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextField(
                      style: overpassTextStyle.copyWith(
                          fontSize: 14,
                          color: kNeutral900,
                          fontWeight: regular),
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: regular,
                            color: kNeutral900.withOpacity(0.45)),
                        prefixIcon: Image.asset('assets/ic_password.png'),
                        suffixText: "Forgot?",
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: kNeutral900.withOpacity(0.10),
                            width: 1,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: kNeutral900.withOpacity(0.10),
                            width: 1,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: KSuccess,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 56,
                    ),
                    CustomButton(
                        title: 'SIGN IN',
                        onTap: () {
                          NavigationService().routeTo('/loginsuccess');
                        }),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  NavigationService().routeTo('/register');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/ic_arrow_back.png'),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      'Don’t have an account? Sign Up',
                      style: overpassTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: regular,
                        color: kNeutral900.withOpacity(0.45),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 22,
              )
            ],
          ),
        ),
      ),
    );
  }
}
