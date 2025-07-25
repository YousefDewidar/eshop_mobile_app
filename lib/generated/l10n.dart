// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get dontHaveAccount1 {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dontHaveAccount1',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get dontHaveAccount2 {
    return Intl.message(
      'Sign Up',
      name: 'dontHaveAccount2',
      desc: '',
      args: [],
    );
  }

  /// `Or`
  String get or {
    return Intl.message('Or', name: 'or', desc: '', args: []);
  }

  /// `Sign in with Facebook`
  String get face {
    return Intl.message(
      'Sign in with Facebook',
      name: 'face',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Google`
  String get google {
    return Intl.message(
      'Sign in with Google',
      name: 'google',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Apple`
  String get apple {
    return Intl.message(
      'Sign in with Apple',
      name: 'apple',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get required {
    return Intl.message(
      'This field is required',
      name: 'required',
      desc: '',
      args: [],
    );
  }

  /// `Create a new account`
  String get createAcc {
    return Intl.message(
      'Create a new account',
      name: 'createAcc',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message('Sign Up', name: 'signUp', desc: '', args: []);
  }

  /// `Full Name`
  String get fullName {
    return Intl.message('Full Name', name: 'fullName', desc: '', args: []);
  }

  /// `By creating an account, you agree to`
  String get termCon1 {
    return Intl.message(
      'By creating an account, you agree to',
      name: 'termCon1',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Conditions`
  String get termCon2 {
    return Intl.message(
      'Terms & Conditions',
      name: 'termCon2',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get allreadyhaveAccount {
    return Intl.message(
      'Already have an account?',
      name: 'allreadyhaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Account created successfully`
  String get signupSuccess {
    return Intl.message(
      'Account created successfully',
      name: 'signupSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password`
  String get forgetPassAppbar {
    return Intl.message(
      'Forget Password',
      name: 'forgetPassAppbar',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password`
  String get forgetPassButton {
    return Intl.message(
      'Forget Password',
      name: 'forgetPassButton',
      desc: '',
      args: [],
    );
  }

  /// `Don't worry, just enter your email address and we will send you a verification code.`
  String get forgetPass3 {
    return Intl.message(
      'Don\'t worry, just enter your email address and we will send you a verification code.',
      name: 'forgetPass3',
      desc: '',
      args: [],
    );
  }

  /// `Verify Email`
  String get verifyAppbar {
    return Intl.message(
      'Verify Email',
      name: 'verifyAppbar',
      desc: '',
      args: [],
    );
  }

  /// `Enter the code we sent to your email address`
  String get verifyBody {
    return Intl.message(
      'Enter the code we sent to your email address',
      name: 'verifyBody',
      desc: '',
      args: [],
    );
  }

  /// `Verify Code`
  String get verifyButton {
    return Intl.message(
      'Verify Code',
      name: 'verifyButton',
      desc: '',
      args: [],
    );
  }

  /// `Resend Code`
  String get verifyAgain {
    return Intl.message('Resend Code', name: 'verifyAgain', desc: '', args: []);
  }

  /// `New Password`
  String get newPassAppbar {
    return Intl.message(
      'New Password',
      name: 'newPassAppbar',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get newPassButton {
    return Intl.message(
      'Change Password',
      name: 'newPassButton',
      desc: '',
      args: [],
    );
  }

  /// `Create a new password to log in`
  String get newPassBody {
    return Intl.message(
      'Create a new password to log in',
      name: 'newPassBody',
      desc: '',
      args: [],
    );
  }

  /// `Confirm `
  String get confirmPass {
    return Intl.message('Confirm ', name: 'confirmPass', desc: '', args: []);
  }

  /// `Password changed successfully`
  String get newPassDone {
    return Intl.message(
      'Password changed successfully',
      name: 'newPassDone',
      desc: '',
      args: [],
    );
  }

  /// `Good Morning !..`
  String get homeHello {
    return Intl.message(
      'Good Morning !..',
      name: 'homeHello',
      desc: '',
      args: [],
    );
  }

  /// `Search.......`
  String get searchHint {
    return Intl.message(
      'Search.......',
      name: 'searchHint',
      desc: '',
      args: [],
    );
  }

  /// `Best Seller`
  String get mostPop {
    return Intl.message('Best Seller', name: 'mostPop', desc: '', args: []);
  }

  /// `More`
  String get more {
    return Intl.message('More', name: 'more', desc: '', args: []);
  }

  /// `Add New Address`
  String get addAddress {
    return Intl.message(
      'Add New Address',
      name: 'addAddress',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message('Edit', name: 'edit', desc: '', args: []);
  }

  /// `Save Address`
  String get saveAddress {
    return Intl.message(
      'Save Address',
      name: 'saveAddress',
      desc: '',
      args: [],
    );
  }

  /// `Weight`
  String get weight {
    return Intl.message('Weight', name: 'weight', desc: '', args: []);
  }

  /// `EGP`
  String get egp {
    return Intl.message('EGP', name: 'egp', desc: '', args: []);
  }

  /// `Shop Now`
  String get shopNow {
    return Intl.message('Shop Now', name: 'shopNow', desc: '', args: []);
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Products`
  String get products {
    return Intl.message('Products', name: 'products', desc: '', args: []);
  }

  /// `Cart`
  String get cart {
    return Intl.message('Cart', name: 'cart', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `Search Results`
  String get searchRes {
    return Intl.message(
      'Search Results',
      name: 'searchRes',
      desc: '',
      args: [],
    );
  }

  /// `Last Search`
  String get lastSearch {
    return Intl.message('Last Search', name: 'lastSearch', desc: '', args: []);
  }

  /// `No Search Results`
  String get noSearch {
    return Intl.message(
      'No Search Results',
      name: 'noSearch',
      desc: '',
      args: [],
    );
  }

  /// `Clear All`
  String get clearAll {
    return Intl.message('Clear All', name: 'clearAll', desc: '', args: []);
  }

  /// `Notifications`
  String get notification {
    return Intl.message(
      'Notifications',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Select All as Read`
  String get selectAllRead {
    return Intl.message(
      'Select All as Read',
      name: 'selectAllRead',
      desc: '',
      args: [],
    );
  }

  /// `New`
  String get new_notification {
    return Intl.message('New', name: 'new_notification', desc: '', args: []);
  }

  /// `Sorry... This product is not available now`
  String get searchNotFound {
    return Intl.message(
      'Sorry... This product is not available now',
      name: 'searchNotFound',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message('All', name: 'all', desc: '', args: []);
  }

  /// `Our Products`
  String get ourProduct {
    return Intl.message('Our Products', name: 'ourProduct', desc: '', args: []);
  }

  /// `You have`
  String get haveProductsInCart1 {
    return Intl.message(
      'You have',
      name: 'haveProductsInCart1',
      desc: '',
      args: [],
    );
  }

  /// `products in your cart`
  String get haveProductsInCart2 {
    return Intl.message(
      'products in your cart',
      name: 'haveProductsInCart2',
      desc: '',
      args: [],
    );
  }

  /// `Kg`
  String get kilogram {
    return Intl.message('Kg', name: 'kilogram', desc: '', args: []);
  }

  /// `Checkout`
  String get checkout {
    return Intl.message('Checkout', name: 'checkout', desc: '', args: []);
  }

  /// `Shipping`
  String get shipping {
    return Intl.message('Shipping', name: 'shipping', desc: '', args: []);
  }

  /// `Payment`
  String get payment {
    return Intl.message('Payment', name: 'payment', desc: '', args: []);
  }

  /// `Address`
  String get address {
    return Intl.message('Address', name: 'address', desc: '', args: []);
  }

  /// `Review`
  String get review {
    return Intl.message('Review', name: 'review', desc: '', args: []);
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `Pay Cash`
  String get payCash {
    return Intl.message('Pay Cash', name: 'payCash', desc: '', args: []);
  }

  /// ``
  String get payCash2 {
    return Intl.message('', name: 'payCash2', desc: '', args: []);
  }

  /// `Pay Online`
  String get payOnline {
    return Intl.message('Pay Online', name: 'payOnline', desc: '', args: []);
  }

  /// ``
  String get payOnline2 {
    return Intl.message('', name: 'payOnline2', desc: '', args: []);
  }

  /// `Phone`
  String get phone {
    return Intl.message('Phone', name: 'phone', desc: '', args: []);
  }

  /// `Street Name`
  String get address2 {
    return Intl.message('Street Name', name: 'address2', desc: '', args: []);
  }

  /// `Free`
  String get free {
    return Intl.message('Free', name: 'free', desc: '', args: []);
  }

  /// `Start Now`
  String get startNow {
    return Intl.message('Start Now', name: 'startNow', desc: '', args: []);
  }

  /// `skip`
  String get skip {
    return Intl.message('skip', name: 'skip', desc: '', args: []);
  }

  /// `Welcome to`
  String get land1Title {
    return Intl.message('Welcome to', name: 'land1Title', desc: '', args: []);
  }

  /// `Discover a world of elegance with AccessoryHUB. Explore our wide collection of trendy, high-quality accessories and enjoy the best deals.`
  String get land1SubTitle {
    return Intl.message(
      'Discover a world of elegance with AccessoryHUB. Explore our wide collection of trendy, high-quality accessories and enjoy the best deals.',
      name: 'land1SubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Shop with Style`
  String get land2Title {
    return Intl.message(
      'Shop with Style',
      name: 'land2Title',
      desc: '',
      args: [],
    );
  }

  /// `We offer carefully selected accessories for every taste. Browse photos, read details and reviews, and find the perfect piece to match your style.`
  String get land2SubTitle {
    return Intl.message(
      'We offer carefully selected accessories for every taste. Browse photos, read details and reviews, and find the perfect piece to match your style.',
      name: 'land2SubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Add to Cart`
  String get addToCart {
    return Intl.message('Add to Cart', name: 'addToCart', desc: '', args: []);
  }

  /// `Categories`
  String get categories {
    return Intl.message('Categories', name: 'categories', desc: '', args: []);
  }

  /// `What are you looking for?`
  String get homeSearchHint {
    return Intl.message(
      'What are you looking for?',
      name: 'homeSearchHint',
      desc: '',
      args: [],
    );
  }

  /// `My Account`
  String get set1 {
    return Intl.message('My Account', name: 'set1', desc: '', args: []);
  }

  /// `My Orders`
  String get set2 {
    return Intl.message('My Orders', name: 'set2', desc: '', args: []);
  }

  /// `My Payments`
  String get set3 {
    return Intl.message('My Payments', name: 'set3', desc: '', args: []);
  }

  /// `My Favorites`
  String get set4 {
    return Intl.message('My Favorites', name: 'set4', desc: '', args: []);
  }

  /// `My Notifications`
  String get set5 {
    return Intl.message('My Notifications', name: 'set5', desc: '', args: []);
  }

  /// `Language`
  String get set6 {
    return Intl.message('Language', name: 'set6', desc: '', args: []);
  }

  /// `Theme`
  String get set7 {
    return Intl.message('Theme', name: 'set7', desc: '', args: []);
  }

  /// `Sign Out`
  String get signOut {
    return Intl.message('Sign Out', name: 'signOut', desc: '', args: []);
  }

  /// `Governorate`
  String get state {
    return Intl.message('Governorate', name: 'state', desc: '', args: []);
  }

  /// `City`
  String get city {
    return Intl.message('City', name: 'city', desc: '', args: []);
  }

  /// `Street`
  String get street {
    return Intl.message('Street', name: 'street', desc: '', args: []);
  }

  /// `Apartment / Landmark`
  String get apartment {
    return Intl.message(
      'Apartment / Landmark',
      name: 'apartment',
      desc: '',
      args: [],
    );
  }

  /// `Mobile Number`
  String get phoneNumber {
    return Intl.message(
      'Mobile Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Notes`
  String get notes {
    return Intl.message('Notes', name: 'notes', desc: '', args: []);
  }

  /// `Add your first address`
  String get addFirstAddress {
    return Intl.message(
      'Add your first address',
      name: 'addFirstAddress',
      desc: '',
      args: [],
    );
  }

  /// `gm`
  String get gram {
    return Intl.message('gm', name: 'gram', desc: '', args: []);
  }

  /// `Out of stock`
  String get outOfStock {
    return Intl.message('Out of stock', name: 'outOfStock', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
