import 'package:flutter/material.dart';
import 'package:rfaye3/core/routes/routes.dart';
import 'package:rfaye3/features/auth/ui/views/forget_pass_view.dart';
import 'package:rfaye3/features/auth/ui/views/login_view.dart';
import 'package:rfaye3/features/auth/ui/views/new_password_view.dart';
import 'package:rfaye3/features/auth/ui/views/signup_view.dart';
import 'package:rfaye3/features/auth/ui/views/verify_code_view.dart';
import 'package:rfaye3/features/checkout/ui/views/checkout_view.dart';
import 'package:rfaye3/features/main/domain/entities/cart_item_entity.dart';
import 'package:rfaye3/features/main/ui/views/main_view.dart';
import 'package:rfaye3/features/main/ui/views/notification_view.dart';
import 'package:rfaye3/features/main/ui/views/search_view.dart';
import 'package:rfaye3/features/splash/ui/views/landing_view.dart';
import 'package:rfaye3/features/splash/ui/views/splash_view.dart';

Route<dynamic>? onGenerateRoute(RouteSettings setting) {
  switch (setting.name) {
    case Routes.splash:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case Routes.login:
      return MaterialPageRoute(builder: (context) => const LoginView());
    case Routes.signUp:
      return MaterialPageRoute(builder: (context) => const SignupView());
    case Routes.forgetPass:
      return MaterialPageRoute(builder: (context) => const ForgetPassView());
    case Routes.verify:
      return MaterialPageRoute(
          builder: (context) => const VerifyCodeView(email: ''));
    case Routes.newPass:
      return MaterialPageRoute(builder: (context) => const NewPasswordView());
    case Routes.landing:
      return MaterialPageRoute(builder: (context) => const LandingView());
    case Routes.home:
      return MaterialPageRoute(builder: (context) => const MainView());
    case Routes.search:
      return MaterialPageRoute(builder: (context) => const SearchView());
    case Routes.notification:
      return MaterialPageRoute(builder: (context) => const NotificationView());
    case Routes.checkout:
      return MaterialPageRoute(builder: (context) =>  CheckoutView(
        cartList: setting.arguments as List<CartItemEntity>,
      ));
    default:
      return null;
  }
}
