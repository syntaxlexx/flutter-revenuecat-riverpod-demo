import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constants {
  static const Color primaryColor = Color(0XFFE5962D);
  static const Color secondaryColor = Color(0XFF1A2F44);
  static final String revenuecatAndroidKey = dotenv.env['REVENUECAT_ANDROID_KEY'] as String;
  static final String revenuecatAppleKey = dotenv.env['REVENUECAT_APPLE_KEY'] as String;
  static const String proMembershipMonthly = 'pro_monthly:pro-monthly-base';
  static const String proMembershipYearly = 'pro_monthly:pro-yearly';
}
