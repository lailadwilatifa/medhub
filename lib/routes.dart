import 'package:flutter/material.dart';
import 'package:medhub/ui/pages/cart_page.dart';
import 'package:medhub/ui/pages/category_page.dart';
import 'package:medhub/ui/pages/home_page.dart';
import 'package:medhub/ui/pages/login_page.dart';
import 'package:medhub/ui/pages/login_success_page.dart';
import 'package:medhub/ui/pages/main_page.dart';
import 'package:medhub/ui/pages/onboarding_page.dart';
import 'package:medhub/ui/pages/product_detail_page.dart';
import 'package:medhub/ui/pages/register_page.dart';
import 'package:medhub/ui/pages/splash_page.dart';
import 'package:medhub/ui/pages/success_page.dart';
import 'package:medhub/ui/pages/verify_otp_page.dart';
import 'package:medhub/ui/pages/welcome_page.dart';

class RouteGenerator {
  Route? generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const SplashPage());
      case '/onboarding':
        return MaterialPageRoute(builder: (context) => const OnboardingPage());
      case '/welcome':
        return MaterialPageRoute(builder: (context) => const WelcomePage());
      case '/login':
        return MaterialPageRoute(builder: (context) => const LoginPage());
      case '/register':
        return MaterialPageRoute(builder: (context) => const RegisterPage());
      case '/verifyotp':
        return MaterialPageRoute(builder: (context) => const VerifyOtpPage());
      case '/loginsuccess':
        return MaterialPageRoute(builder: (context) => const LoginSuccess());
      case '/home':
        return MaterialPageRoute(builder: (context) => const HomePage());
      case '/main':
        return MaterialPageRoute(builder: (context) => const MainPage());
      case '/category':
        return MaterialPageRoute(builder: (context) => const CategoryPage());
      case '/cart':
        return MaterialPageRoute(builder: (context) => const CartPage());
        case '/success':
        return MaterialPageRoute(builder: (context) => const SuccessPage());
      case '/productdetail':
        return MaterialPageRoute(
            builder: (context) => const ProductDetailPage());
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text("Not found ${settings.name}"),
            ),
          ),
        );
    }
  }
}
