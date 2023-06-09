import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../utils/utils.dart';

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              MdiIcons.star,
              color: Constants.primaryColor,
              size: 150,
            ),
            Text(
              'Free Features Page'.toUpperCase(),
              style: context.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
