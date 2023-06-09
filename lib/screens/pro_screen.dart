import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProScreen extends ConsumerStatefulWidget {
  const ProScreen({Key? key}) : super(key: key);
  static const routeName = 'pro';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProScreenState();
}

class _ProScreenState extends ConsumerState<ProScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pro'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            Text('Pro Page'),
          ],
        ),
      ),
    );
  }
}
