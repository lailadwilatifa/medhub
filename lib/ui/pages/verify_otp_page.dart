import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medhub/services/navigation_service.dart';
import 'package:medhub/shared/theme.dart';
import 'package:medhub/ui/widgets/custom_button.dart';

class VerifyOtpPage extends StatelessWidget {
  const VerifyOtpPage({super.key});

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
              const SizedBox(height: 8),
              Text(
                'We just send you a verification code via phone +62 821 39 488 953',
                style: overpassTextStyle.copyWith(
                  fontSize: 14,
                  color: kNeutral900.withOpacity(0.45),
                  fontWeight: regular,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _otpTextField(context, first: true, last: false),
                  const SizedBox(width: 14),
                  _otpTextField(context, first: false, last: false),
                  const SizedBox(width: 14),
                  _otpTextField(context, first: false, last: false),
                  const SizedBox(width: 14),
                  _otpTextField(context, first: false, last: true),
                ],
              ),
              const SizedBox(height: 29),
              CustomButton(
                  title: 'SUBMIT CODE',
                  onTap: () {
                    NavigationService().routeTo('/loginsuccess');
                  }),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 24, bottom: 16),
                  child: Text(
                    'The verify code will expire in 00:59',
                    style: overpassTextStyle.copyWith(
                      fontSize: 14,
                      color: kNeutral900.withOpacity(0.45),
                      fontWeight: regular,
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Resend Code',
                  style: overpassTextStyle.copyWith(
                      fontSize: 14, fontWeight: regular, color: KSuccess),
                      textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _otpTextField(BuildContext context,
      {required bool first, required bool last}) {
    return SizedBox(
      height: 48,
      width: 40,
      child: TextField(
        autofocus: true,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: overpassTextStyle.copyWith(
            fontSize: 24,
            color: kNeutral900.withOpacity(0.45),
            fontWeight: regular),
        maxLength: 1,
        decoration: InputDecoration(
          counter: Offstage(),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: kNeutral900.withOpacity(0.10),
              width: 1,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: kNeutral900.withOpacity(0.10),
              width: 1,
            ),
          ),
        ),
        onChanged: (value) {
          if (value.length == 1 && !last) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty && !first) {
            FocusScope.of(context).previousFocus();
          }
        },
      ),
    );
  }
}
