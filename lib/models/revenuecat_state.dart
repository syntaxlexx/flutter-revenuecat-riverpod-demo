import 'package:purchases_flutter/purchases_flutter.dart';

class RevenuecatState {
  final Offerings? offerings;
  final CustomerInfo? customerInfo;
  final bool isLoading;
  final String? errorMessage;

  bool get hasError => errorMessage?.isNotEmpty ?? false;
  bool get hasOfferings => offerings?.current != null;

  // monthly offering
  bool get hasMonthlyOffering => offerings?.current?.monthly != null;
  bool get hasMonthlyIntroOffering => offerings?.current?.monthly?.storeProduct.introductoryPrice != null;
  String get monthlyIntroOffering =>
      '${offerings?.current?.monthly?.storeProduct.introductoryPrice?.periodNumberOfUnits} x ${offerings?.current?.monthly?.storeProduct.introductoryPrice?.periodUnit}';
  String get monthlyOffering => '${offerings?.current?.monthly?.storeProduct.priceString}';

  const RevenuecatState({
    this.offerings,
    this.customerInfo,
    this.isLoading = false,
    this.errorMessage,
  });

  RevenuecatState copyWith({
    Offerings? offerings,
    CustomerInfo? customerInfo,
    bool? isLoading,
    String? errorMessage,
  }) {
    return RevenuecatState(
      offerings: offerings ?? this.offerings,
      customerInfo: customerInfo ?? this.customerInfo,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
