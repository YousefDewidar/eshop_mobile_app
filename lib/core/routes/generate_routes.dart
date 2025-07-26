import 'package:flutter/material.dart';
import 'package:rfaye3/features/auth/ui/views/forget_pass_view.dart';
import 'package:rfaye3/features/auth/ui/views/login_view.dart';
import 'package:rfaye3/features/auth/ui/views/signup_view.dart';
import 'package:rfaye3/features/auth/ui/views/verify_code_view.dart';
import 'package:rfaye3/core/routes/routes.dart';
import 'package:rfaye3/features/checkout/presentation/views/add_address_view.dart';
import 'package:rfaye3/features/checkout/presentation/views/checkout_view.dart';
import 'package:rfaye3/features/main/data/models/product_model.dart';
import 'package:rfaye3/features/cart/presentation/view_model/cart_cubit/cart_cubit.dart';
import 'package:rfaye3/features/main/presentation/views/main_view.dart';
import 'package:rfaye3/features/main/presentation/views/notification_view.dart';
import 'package:rfaye3/features/main/presentation/views/product_details_view.dart';
import 'package:rfaye3/features/main/presentation/views/search_view.dart';
import 'package:rfaye3/features/profile/presentation/views/orders_veiw.dart';
import 'package:rfaye3/features/profile/presentation/views/personal_view.dart';
import 'package:rfaye3/features/profile/presentation/views/profile_view.dart';
import 'package:rfaye3/features/splash/presentation/views/landing_view.dart';
import 'package:rfaye3/features/splash/presentation/views/splash_view.dart';

Route<dynamic>? onGenerateRoute(RouteSettings setting) {
  switch (setting.name) {
    case Routes.splash:
      return MaterialPageRoute(builder: (context) => const SplashView());

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
            (context) => CheckoutView(orderPrice: setting.arguments as num),
      );
    case Routes.profile:
      return MaterialPageRoute(builder: (context) => const ProfileView());
    case Routes.productDetailsView:
      return MaterialPageRoute(
        builder: (context) {
          final args = setting.arguments as Map<String, dynamic>?;
          return ProductDetailsView(
            cartCubit: args?['cartCubit'] as CartCubit,
            product: args?['product'] as ProductModel,
          );
        },
      );
    case Routes.addAddress:
      return MaterialPageRoute(builder: (context) => const AddAddressView());
    case Routes.orders:
      return MaterialPageRoute(builder: (context) => const OrdersView());
    case Routes.personal:
      return MaterialPageRoute(builder: (context) => const PersonalView());
    case Routes.login:
      return MaterialPageRoute(builder: (context) => const LoginView());
    case Routes.signUp:
      return MaterialPageRoute(builder: (context) => const SignupView());
    case Routes.forgetPass:
      return MaterialPageRoute(builder: (context) => const ForgetPassView());
    case Routes.verify:
      return MaterialPageRoute(
        builder:
            (context) => VerifyCodeView(email: setting.arguments as String),
      );
    default:
      return null;
  }
}
