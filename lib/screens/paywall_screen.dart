import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PaywallScreen extends ConsumerStatefulWidget {
  const PaywallScreen({Key? key}) : super(key: key);
  static const routeName = 'paywall';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PaywallScreenState();
}

class _PaywallScreenState extends ConsumerState<PaywallScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paywall'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            Text('Paywall Page'),
          ],
        ),
      ),
    );
  }
}
