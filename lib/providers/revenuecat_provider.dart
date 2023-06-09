import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import '../models/models.dart';
import '../utils/utils.dart';

final revenuecatProvider = StateNotifierProvider<RevenuecatNotifier, RevenuecatState>((ref) {
  return RevenuecatNotifier(const RevenuecatState());
});

class RevenuecatNotifier extends StateNotifier<RevenuecatState> {
  var logger = Logger();

  RevenuecatNotifier(super.state) {
    _getOfferings();
    _getCustomerInfo();
  }

  Future<void> refresh() async {
    await _getOfferings();
    await _getCustomerInfo();
  }

  Future<void> _getOfferings() async {
    state = state.copyWith(isLoading: true);
    try {
      Offerings offerings = await Purchases.getOfferings();
      state = state.copyWith(offerings: offerings);

      logger.i(offerings);
      inspect(offerings);

      if (offerings.current != null) {
        // Display current offering with offerings.current
      }
    } on PlatformException catch (e) {
      logger.e(e);
      // optional error handling
      state = state.copyWith(errorMessage: 'Could not fetch offerings!');
    }

    state = state.copyWith(isLoading: false);
  }

  Future<void> _getCustomerInfo() async {
    state = state.copyWith(isLoading: true);
    try {
      CustomerInfo customerInfo = await Purchases.getCustomerInfo();
      state = state.copyWith(customerInfo: customerInfo);

      logger.i(customerInfo);
      inspect(customerInfo);

      // if (customerInfo.entitlements.all[<my_entitlement_identifier>].isActive) {
      // Grant user "pro" access
      // }
    } on PlatformException catch (e) {
      logger.e(e);
      // optional error handling
      state = state.copyWith(errorMessage: 'Could not fetch customer info!');
    }

    state = state.copyWith(isLoading: false);
  }

  Future<void> purchase(Package package) async {
    state = state.copyWith(isLoading: true);
    try {
      CustomerInfo customerInfo = await Purchases.purchasePackage(package);
      state = state.copyWith(customerInfo: customerInfo);

      logger.i(customerInfo);

      // var isPro = customerInfo.entitlements.all[<my_entitlement_identifier>].isActive;
      // if (isPro) {
      //   // Unlock that great "pro" content
      // }
    } on PlatformException catch (e) {
      logger.e(e);
      // optional error handling
      state = state.copyWith(errorMessage: 'Could not restore purchases!');
    }

    state = state.copyWith(isLoading: false);
  }

  Future<void> restorePurchase(BuildContext context) async {
    state = state.copyWith(isLoading: true);
    try {
      CustomerInfo restoredInfo = await Purchases.restorePurchases();
      state = state.copyWith(customerInfo: restoredInfo);

      logger.i(restoredInfo);

      if (restoredInfo.activeSubscriptions.isEmpty) {
        showSnackbar(context, 'No active subscriptions found');
      }

      // if (customerInfo.entitlements.all[<my_entitlement_identifier>].isActive) {
      // Grant user "pro" access
      // }
    } on PlatformException catch (e) {
      logger.e(e);
      // optional error handling
      state = state.copyWith(errorMessage: 'Could not restore purchases!');
    }

    state = state.copyWith(isLoading: false);
  }
}
