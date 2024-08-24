import 'package:flutter/material.dart';
import 'package:medhub/services/navigation_service.dart';
import 'package:medhub/shared/theme.dart';
import 'package:medhub/ui/widgets/custom_button.dart';
import 'package:medhub/ui/widgets/custom_textfield.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _passwordVisible = true;

  @override
  void initState() {
    super.initState();
    _passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
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
              Text(
                'Create your account',
                style: titleTextStyle,
              ),
              const SizedBox(height: 24),
              const CustomTextfield(
                label: 'Your Name',
                inputType: TextInputType.text,
              ),
              const SizedBox(height: 16),
              const CustomTextfield(
                label: 'Mobile Number',
                inputType: TextInputType.phone,
              ),
              const SizedBox(height: 16),
              const CustomTextfield(
                label: 'Email',
                inputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              TextField(
                obscureText: !_passwordVisible,
                keyboardType: TextInputType.visiblePassword,
                style: overpassTextStyle.copyWith(
                    fontSize: 14, color: kNeutral900, fontWeight: regular),
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: regular,
                      color: kNeutral900.withOpacity(0.45)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: kNeutral900.withOpacity(0.10),
                      width: 1,
                    ),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                    icon: Icon(_passwordVisible
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined),
                    color: kNeutral900.withOpacity(0.45),
                    iconSize: 16,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: KSuccess,
                      width: 1,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              CustomButton(
                title: 'CREATE ACCOUNT',
                onTap: () {
                  NavigationService().routeTo('/verifyotp');
                },
              ),
              const SizedBox(height: 19),
              InkWell(
                onTap: () {
                  NavigationService().routeTo('/login');
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
                      'Already have account?  Login',
                      style: overpassTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: regular,
                        color: kNeutral900.withOpacity(0.45),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
