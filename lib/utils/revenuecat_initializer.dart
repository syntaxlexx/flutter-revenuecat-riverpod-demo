import 'dart:io' show Platform;
import 'package:purchases_flutter/purchases_flutter.dart';

import 'constants.dart';

class RevenuecatInitializer {
  Future<void> initPlatformState() async {
    await Purchases.setLogLevel(LogLevel.debug);

    late PurchasesConfiguration configuration;

    if (Platform.isAndroid) {
      configuration = PurchasesConfiguration(Constants.revenuecatAndroidKey)..observerMode = false;
      // if (buildingForAmazon) {
      // use your preferred way to determine if this build is for Amazon store
      // checkout our MagicWeather sample for a suggestion
      //   configuration = AmazonConfiguration(<public_amazon_sdk_key>);
      // }
    } else if (Platform.isIOS) {
      configuration = PurchasesConfiguration(Constants.revenuecatAppleKey)..observerMode = false;
    }

    await Purchases.configure(configuration);
  }
}
