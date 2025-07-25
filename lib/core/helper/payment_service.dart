// ignore_for_file: deprecated_member_use

import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:rfaye3/core/helper/keys.dart';
import 'package:rfaye3/features/checkout/data/models/saved_card_model.dart';

class PaymobService {
  static const methodChannel = MethodChannel('paymob_sdk_flutter');

  // Method to call native PaymobSDKs
  Future<void> payWithPaymob(
    String csk, {
    SavedBankCard? savedCard,
    String? appName,
    Color? buttonBackgroundColor,
    Color? buttonTextColor,
    bool? saveCardDefault,
    bool? showSaveCard,
  }) async {
    try {
      final String result = await methodChannel.invokeMethod('payWithPaymob', {
        "publicKey": publicKey,
        "clientSecret": csk,
        "savedBankCard": savedCard?.toMap(),
        "appName": appName,
        "buttonBackgroundColor": buttonBackgroundColor?.value,
        "buttonTextColor": buttonTextColor?.value,
        "saveCardDefault": saveCardDefault,
        "showSaveCard": showSaveCard,
      });
      switch (result) {
        case 'Successfull':
          log('Transaction Successfull');
          break;
        case 'Rejected':
          log('Transaction Rejected');
          break;
        case 'Pending':
          log('Transaction Pending');
          break;
        default:
          log('Unknown response');
      }
    } on PlatformException catch (e) {
      log("Failed to call native SDK: '${e.message}'.");
    }
  }
}
