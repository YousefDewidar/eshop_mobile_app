import 'package:flutter/material.dart';
import 'package:rfaye3/core/routes/routes.dart';
import 'package:rfaye3/features/auth/presentation/views/forget_pass_view.dart';
import 'package:rfaye3/features/auth/presentation/views/login_view.dart';
import 'package:rfaye3/features/auth/presentation/views/new_password_view.dart';
import 'package:rfaye3/features/auth/presentation/views/signup_view.dart';
import 'package:rfaye3/features/auth/presentation/views/verify_code_view.dart';
import 'package:rfaye3/features/checkout/presentation/views/checkout_view.dart';
import 'package:rfaye3/features/main/domain/entities/cart_item_entity.dart';
import 'package:rfaye3/features/main/domain/entities/product_entity.dart';
import 'package:rfaye3/features/main/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:rfaye3/features/main/presentation/views/main_view.dart';
import 'package:rfaye3/features/main/presentation/views/notification_view.dart';
import 'package:rfaye3/features/main/presentation/views/product_details_view.dart';
import 'package:rfaye3/features/main/presentation/views/search_view.dart';
import 'package:rfaye3/features/splash/presentation/views/landing_view.dart';
import 'package:rfaye3/features/splash/presentation/views/splash_view.dart';

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
        builder: (context) => const VerifyCodeView(email: ''),
      );
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
      return MaterialPageRoute(
        builder:
            (context) => CheckoutView(
              cartList: setting.arguments as List<CartItemEntity>,
            ),
      );
    case Routes.productDetailsView:
      return MaterialPageRoute(
        builder: (context) {
          final args = setting.arguments as Map<String, dynamic>?;
          return ProductDetailsView(
            cartCubit: args?['cartCubit'] as CartCubit,
            product: args?['product'] as ProductEntity,
          );
        },
      );
    default:
      return null;
  }
}
