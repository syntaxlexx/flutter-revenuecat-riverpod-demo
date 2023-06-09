import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FreeScreen extends ConsumerStatefulWidget {
  const FreeScreen({Key? key}) : super(key: key);
  static const routeName = 'free';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FreeScreenState();
}

class _FreeScreenState extends ConsumerState<FreeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Free'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            Text('Free Page'),
          ],
        ),
      ),
    );
  }
}
